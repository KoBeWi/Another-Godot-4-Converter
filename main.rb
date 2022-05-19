require 'fileutils'

require "./utils"
require "./scene"
require "./scripts"
require "./conversion"

FILE_EXTENSIONS = [".tscn", ".tres", ".gd", ".shader"]

def fetch_files(dir, list)
    for file in Dir.entries(dir) - [".", ".."]
        if dir == "."
            name = file
        else
            name = dir + "/" + file
        end

        if Dir.exists?(name)
            fetch_files(name, list)
        else
            if FILE_EXTENSIONS.include?(File.extname(name))
                list << name
            end
        end
    end
end

def save_file(file, data)
    if $DEBUG
        File.new(File.dirname(file) + "/DEBUG#" + File.basename(file), "w").puts(data.to_s)
    else
        File.new(file, "w").puts(data.to_s)
    end
end

def rename_file(file, new_name)
    if $DEBUG
        FileUtils.cp(file, File.dirname(file) + "/DEBUG#" + File.basename(new_name))
    else
        File.rename(file, new_name)
    end
end

$DEBUG = true if ARGV.delete("--debug")
root = "."
if i = ARGV.index("--path")
    root = ARGV[i + 1]
    ARGV.delete_at(i)
    ARGV.delete_at(i)
end

file_list = []
if not Dir.exists?(root) and File.exists?(root)
    file_list = [root]
else
    fetch_files(root, file_list)
end

file_list.reject! {|file| file.include?("DEBUG#")}

i = 1
all = file_list.length

file_list.select{|f| File.extname(f) == ".shader"}.each do |shader|
    puts "Renaming file: #{shader} (#{i}/#{all})"
    rename_file(shader, shader.chomp("shader") + "gdshader")
    i += 1
end

file_list.select{|f| File.extname(f) == ".tscn"}.each do |scene|
    puts "Converting file: #{scene} (#{i}/#{all})"
    file = Scene.new(scene)
    save_file(scene, file)
    i += 1
end

file_list.select{|f| File.extname(f) == ".gd"}.each do |script|
    puts "Converting file: #{script} (#{i}/#{all})"
    file = Script.new(File.readlines(script))
    save_file(script, file)
    i += 1
end

file_list.select{|f| File.extname(f) == ".tres"}.each do |resource|
    puts "Converting file: #{resource} (#{i}/#{all})"
    file = Resource.new(File.readlines(resource))
    save_file(resource, file)
    i += 1
end
