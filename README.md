# Another Godot 4 Converter

This is another converter for Godot 4 (see https://github.com/godotengine/godot-proposals/issues/387 for list of converters). It's a script written in Ruby.

It supports:
- scene converting (node type conversion, property conversion)
  - sub-resource converting (same as above)
  - support for changed defaults, e.g. if you had disabled RayCast2D, the converted scene will have `enabled = false`, because the default changed
  - conversion of ParticlesMaterial randomness to the new min/max
  - conversion of TextureRect stretch_mode (the compat value was removed, so it's a special case)
  - conversion of CapsuleShape2D/3D height. It's now independent from radius
- script conversion
  - method, property and constant renames
  - some methods got special treating, e.g. `object.connect(object2, "signal", "method")` will be converted to the cool new `object.signal.connect(object2.method)` syntax
  - conversion of setters/getters to new syntax
  - onready/tool/export conversion to annotations (just adds `@` bruh)
  - built-in script conversion (the converter will extract the script and convert it normally)

The script conversion might be wonky. It's difficult to properly convert scripts without writting a parser (I actually tried that, but alas failed). I did a test on a pretty big project and the converter doesn't break scripts at least.
Script conversion doesn't (and most likely won't) support multiline method calls and nested calls (e.g. in `method1(method2())` only `method1` is handled) and probably some other weird stuff you can do with your code. If you followed code guidelines you should be fine (probably).

### NOTE

The script had just basic functionality implemented, it converts only a very small number of stuff. Check the `# TODO` comments in the code to see what is missing (and planned). I tried to keep most of conversion in `conversion.rb` file.

## How to use

### Messy usage
Copy all scripts to your project and do
```
ruby main.rb
```
Your project will be auto-converted.

### Proper usage
Put the scripts anywhere and do
```
ruby main.rb --path path/to/your/project
```

### Debug usage
Useful for testing the converter, but not intended for the actual projects. Instead of replacing files, it creates a copy prefixed with `DEBUG#`, so you can easily compare before and after changes.
```
ruby main.rb --debug
```
(can be used with `--path` ofc)
