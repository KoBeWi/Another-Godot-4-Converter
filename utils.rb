module Utils
    def extract_string(line, from)
        lines = [line]
        while true
            if line < @lines.length and !@lines[line].end_with?("\"\n") || @lines[line].end_with?("\\\"\n")
                line += 1
                lines << line
            else
                break
            end
        end
        lines = lines.collect{|i| @lines[i]}
        lines[0] = lines[0][from...]
        lines.join
    end
end