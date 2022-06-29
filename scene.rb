class Scene
    CONST_LINES = ["\n", "[gd_scene", "[ext_resource"]

    def initialize(file)
        @bits = []
        
        @lines = File.readlines(file)
        @lines.each.with_index do |line, i|
            if line.end_with?("{\n") and not @in_node
                @in_brace = true
            elsif @in_brace
                @in_brace = !line.end_with?("}\n")
            elsif CONST_LINES.find{|c| line.start_with?(c)}
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
            elsif line.start_with?("[connection")
                @bits << line
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
    
    def initialize(line, type)
        property = line.match %r{(?<name>[^=]+) = (?<value>.+)}
        @name = property["name"]
        @value = property["value"]
        @type = type
        
        do_conversions
    end

    def add_source(code)
        code[0] = code.first.delete_prefix("\"")
        code[-1] = code.last.delete_suffix("\"")
        code.pop if code.last.empty?
        
        @value = '"' + Script.new(code.collect{|line| line.gsub('\"', '"')}).to_s.collect{|line| line.end_with?("\n") ? line : line + "\n"}.join.gsub('"', '\"') + '"'
    end

    def to_s
        "#{@name} = #{@value}\n" + @double.to_s
    end
end

class Node
    include Utils

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

        @lines.collect!.with_index do |line, i|
            if line.start_with?("__meta__")
                @inside_meta = []
                ""
            elsif @inside_meta and line.start_with?('"_editor_description_":')
                description = extract_string(i, line.index(":") + 2)
                @inside_meta << "editor_description = " + description
                ""
            elsif @inside_meta and line == "}\n"
                extract = @inside_meta
                @inside_meta = nil
                extract.join
            elsif @inside_meta
                ""
            elsif not line.include?("=") or line.start_with?("[")
                line
            else
                Property.new(line, @type)
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
    include Utils

    def initialize(lines)
        @lines = lines
        @properties = []
        skip_lines = 0

        type = lines[0].match(%r{type="([^"]+)"})
        if type
            @type = TYPE_CONVERSIONS.fetch(type[1], type[1])
        end
        lines[0].sub!("type=\"#{type}\"", "type=\"#{@type}\"")

        @lines.collect!.with_index do |line, i|
            if skip_lines > 0
                skip_lines -= 1
                next
            end

            if not line.include?("=") or line.start_with?("[") or line.start_with?(";")
                line
            else
                property = Property.new(line, @type)
                if property.name == "script/source" or property.name == "code"
                    code = extract_string(i, line.index("\"")).split("\n")
                    skip_lines = code.length - 1
                    property.add_source(code)
                end
                property
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
