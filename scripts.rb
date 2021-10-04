class Script
    def initialize(code)
        @code = code
        do_conversions
    end

    def Script.tabs(line)
        line.match(%r{(\s*)})[1]
    end

    def to_s
        @code.collect(&:to_s)
    end
end

class MethodCall
    REGEX = %r{.+\(.*\)}

    def initialize(line)
        start = line.index("(")
        i = start + 1
        p = 1
        while p > 0 and i < line.length
            if line[i] == "("
                p += 1
            elsif line[i] == ")"
                p -= 1
            end
            i += 1
        end
        stop = i

        j = start
        while j > 0 and not line[j].match(/\s/)
            j -= 1
        end

        precall = line[j + 1...start].split(".")
        if precall.length > 1
            @caller = precall[0...precall.size - 1].join(".")
            @method = precall.last
        else
            @method = precall.last
        end
        @args = line[start + 1...stop - 1].split(%r{\s*,\s*})
        reduce_args
        @tabs = line[0..j]
        @remainder = line[stop...line.length]

        if @remainder.match(REGEX)
            @remainder = MethodCall.new(@remainder)
        end

        do_conversions
    end

    def reduce_args
        @args.each.with_index do |arg, i|
            if arg.include?("(") and not arg.include?(")")
                j = i + 1
                999.times do
                    if @args[j].include?(")")
                        break
                    else
                        j += 1
                    end
                end
                @args[i] = @args[i..j].join(", ")
                (j - i).times do
                    @args.delete_at(i + 1)
                end
                reduce_args
                return
            end
        end
    end

    def to_s
        @override or @tabs + (@caller ? "#{@caller}.#{@method}" : @method.to_s) + "(" + @args&.join(", ").to_s + ")" + @remainder.to_s
    end
end
