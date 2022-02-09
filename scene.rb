class Scene
    CONST_LINES = ["\n", "[gd_scene", "[ext_resource"]

    def initialize(file)
        @bits = []
        
        @lines = File.readlines(file)
        @lines.each.with_index do |line, i|
            if CONST_LINES.find{|c| line.start_with?(c)}
                if @in_node &.> 0
                    extract_node(i)
                    @in_node = nil
                    @bits << line
                elsif not @in_node
                    @bits << line
                end
            elsif line.start_with?("[node name=")
                if not @in_node
                    @in_node = i
                else
                    extract_node(i)
                    @in_node = i
                end
            elsif line.start_with?("[sub_resource type=")
                if not @in_node
                    @in_node = -i
                else
                    extract_node(i)
                    @in_node = -i
                end
            end
        end

        if @in_node
            extract_node(@lines.length)
        end
    end

    def extract_node(to)
        if @in_node > 0
            @bits << Node.new(@lines[@in_node...to])
        else
            @bits << Resource.new(@lines[-@in_node...to])
        end
    end

    def to_s
        @bits.collect(&:to_s).join
    end
end

class Property
    attr_accessor :name
    attr_accessor :value
    
    def initialize(line)
        property = line.match %r{(?<name>[^=]+) = (?<value>.+)}
        @name = property["name"]
        @value = property["value"]
        
        do_conversions
    end

    def add_source(code)
        if code.last.end_with?("\"\n") and not code.last.end_with?("\\\"\n")
            code.last.chomp!("\"\n")
            code.last << "\n"
        end
        
        code[0] = code.first.to_s.reverse.chomp("script/source = \"".reverse).reverse
        @value = '"' + Script.new(code.collect{|line| line.gsub('\"', '"')}).to_s.collect{|line| line.end_with?("\n") ? line : line + "\n"}.join.gsub('"', '\"') + '"'
    end

    def to_s
        "#{@name} = #{@value}\n" + @double.to_s
    end
end

class Node
    def initialize(lines)
        @lines = lines
        @properties = []

        type = lines[0].match(%r{type="([^"]+)"})
        @instance = !type
        if not @instance
            type = type[1]
            @type = TYPE_CONVERSIONS.fetch(type, type)
            lines[0].sub!("type=\"#{type}\"", "type=\"#{@type}\"")
        end

        @lines.collect! do |line|
            if not line.include?("=") or line.start_with?("[")
                line
            else
                Property.new(line)
            end
        end
        @properties = @lines.select{|line| line.class == Property}
        
        do_conversions
    end

    def to_s
        @lines.collect(&:to_s)
    end

    def get_property(name)
        @properties.find{|property| property.name == name}
    end

    def set_property_value(name, value, default = nil)
        if default != nil and value == default
            @lines.reject!{|line| line.class == Property and line.name == name}
            return
        end

        if property = get_property(name)
            property.value = value
        else
            @lines << "#{name} = #{value}\n"
        end
    end
end

class Resource
    def initialize(lines)
        @lines = lines
        @properties = []

        type = lines[0].match(%r{type="([^"]+)"})[1]
        @type = TYPE_CONVERSIONS.fetch(type, type)
        lines[0].sub!("type=\"#{type}\"", "type=\"#{@type}\"")

        @lines.collect!.with_index do |line, i|
            if @in_script
                if (m1 = line == "\"\n") or line.match(%r{[^\\]\"})
                    @script_property.add_source(@lines[@in_script..(m1 ? i - 1 : i)])
                    @lines.slice! (@in_script + 1)..i
                    @in_script = @script_property = nil
                    next
                end
                next line
            end
            if @in_shader
                if (m1 = line == "\"\n") or line.match(%r{[^\\]\"})
                    @in_shader = false
                end
                next line
            end

            if not line.include?("=") or line.start_with?("[")
                line
            else
                property = Property.new(line)
                if property.name == "script/source"
                    @in_script = i
                    @script_property = property
                end
                if property.name == "code"
                    @in_shader = true
                end
                property
            end
        end

        do_conversions
    end

    def to_s
        @lines.collect(&:to_s)
    end
end
