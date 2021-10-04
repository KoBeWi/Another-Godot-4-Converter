# TODO: this list is outdated
TYPE_CONVERSIONS = {"Reference" => "RefCounted", "AnimationTreePlayer" => "AnimationTree", "BitmapFont" => "Font", "DynamicFont" => "Font", "DynamicFontData" => "FontData", "ToolButton" => "Button", "Navigation3D" => "Node3D", "Navigation2D" => "Node2D", "AnimatedSprite" => "AnimatedSprite2D", "Area" => "Area3D", "ARVRCamera" => "XRCamera3D", "ARVRController" => "XRController3D", "ARVRAnchor" => "XRAnchor3D", "ARVRInterface" => "XRInterface", "ARVROrigin" => "XROrigin3D", "ARVRPositionalTracker" => "XRPositionalTracker", "ARVRServer" => "XRServer", "BoneAttachment" => "BoneAttachment3D", "BoxShape" => "BoxShape3D", "BulletPhysicsDirectBodyState" => "BulletPhysicsDirectBodyState3D", "BulletPhysicsServer" => "BulletPhysicsServer3D", "Camera" => "Camera3D", "CapsuleShape" => "CapsuleShape3D", "ClippedCamera" => "ClippedCamera3D", "CollisionObject" => "CollisionObject3D", "CollisionPolygon" => "CollisionPolygon3D", "CollisionShape" => "CollisionShape3D", "ConcavePolygonShape" => "ConcavePolygonShape3D", "ConeTwistJoint" => "ConeTwistJoint3D", "ConvexPolygonShape" => "ConvexPolygonShape3D", "CPUParticles" => "CPUParticles3D", "CSGBox" => "CSGBox3D", "CSGCombiner" => "CSGCombiner3D", "CSGCylinder" => "CSGCylinder3D", "CSGMesh" => "CSGMesh3D", "CSGPolygon" => "CSGPolygon3D", "CSGPrimitive" => "CSGPrimitive3D", "CSGShape" => "CSGShape3D", "CSGSphere" => "CSGSphere3D", "CSGTorus" => "CSGTorus3D", "CubeMesh" => "BoxMesh", "CylinderShape" => "CylinderShape3D", "DirectionalLight" => "DirectionalLight3D", "EditorSpatialGizmo" => "EditorNode3DGizmo", "EditorSpatialGizmoPlugin" => "EditorNode3DGizmoPlugin", "Generic6DOFJoint" => "Generic6DOFJoint3D", "HeightMapShape" => "HeightMapShape3D", "HingeJoint" => "HingeJoint3D", "ImmediateGeometry" => "ImmediateGeometry3D", "Joint" => "Joint3D", "KinematicBody" => "KinematicBody3D", "KinematicCollision" => "KinematicCollision3D", "Light" => "Light3D", "Listener" => "Listener3D", "MeshInstance" => "MeshInstance3D", "MultiMeshInstance" => "MultiMeshInstance3D", "NavigationAgent" => "NavigationAgent3D", "NavigationMeshInstance" => "NavigationRegion3D", "NavigationObstacle" => "NavigationObstacle3D", "NavigationPolygonInstance" => "NavigationRegion2D", "NavigationRegion" => "NavigationRegion3D", "Navigation2DServer" => "NavigationServer2D", "NavigationServer" => "NavigationServer3D", "OmniLight" => "OmniLight3D", "PanoramaSky" => "Sky", "Particles" => "GPUParticles3D", "Particles2D" => "GPUParticles2D", "Path" => "Path3D", "PathFollow" => "PathFollow3D", "PhysicalBone" => "PhysicalBone3D", "Physics2DDirectBodyStateSW" => "PhysicsDirectBodyState2DSW", "Physics2DDirectBodyState" => "PhysicsDirectBodyState2D", "Physics2DDirectSpaceState" => "PhysicsDirectSpaceState2D", "Physics2DServerSW" => "PhysicsServer2DSW", "Physics2DServer" => "PhysicsServer2D", "Physics2DShapeQueryParameters" => "PhysicsShapeQueryParameters2D", "Physics2DShapeQueryResult" => "PhysicsShapeQueryResult2D", "Physics2DTestMotionResult" => "PhysicsTestMotionResult2D", "PhysicsBody" => "PhysicsBody3D", "PhysicsDirectBodyState" => "PhysicsDirectBodyState3D", "PhysicsDirectSpaceState" => "PhysicsDirectSpaceState3D", "PhysicsServer" => "PhysicsServer3D", "PhysicsShapeQueryParameters" => "PhysicsShapeQueryParameters3D", "PhysicsShapeQueryResult" => "PhysicsShapeQueryResult3D", "PinJoint" => "PinJoint3D", "PlaneShape" => "WorldMarginShape3D", "ProceduralSky" => "Sky", "ProximityGroup" => "ProximityGroup3D", "RayCast" => "RayCast3D", "RayShape" => "RayShape3D", "RemoteTransform" => "RemoteTransform3D", "RigidBody" => "RigidBody3D", "Shape" => "Shape3D", "ShortCut" => "Shortcut", "Skeleton" => "Skeleton3D", "SkeletonIK" => "SkeletonIK3D", "SliderJoint" => "SliderJoint3D", "SoftBody" => "SoftBody3D", "Spatial" => "Node3D", "SpatialGizmo" => "Node3DGizmo", "SpatialMaterial" => "StandardMaterial3D", "SpatialVelocityTracker" => "VelocityTracker3D", "SphereShape" => "SphereShape3D", "SpotLight" => "SpotLight3D", "SpringArm" => "SpringArm3D", "Sprite" => "Sprite2D", "StaticBody" => "StaticBody3D", "TextureProgress" => "TextureProgressBar", "VehicleBody" => "VehicleBody3D", "VehicleWheel" => "VehicleWheel3D", "ViewportContainer" => "SubViewportContainer", "Viewport" => "SubViewport", "VisibilityEnabler" => "VisibilityEnabler3D", "VisibilityNotifier" => "VisibilityNotifier3D", "VisualServer" => "RenderingServer", "VisualShaderNodeScalarConstant" => "VisualShaderNodeFloatConstant", "VisualShaderNodeScalarFunc" => "VisualShaderNodeFloatFunc", "VisualShaderNodeScalarOp" => "VisualShaderNodeFloatOp", "VisualShaderNodeScalarUniform" => "VisualShaderNodeFloatUniform", "VisualShaderNodeScalarClamp" => "VisualShaderNodeClamp", "VisualShaderNodeVectorClamp" => "VisualShaderNodeClamp", "VisualShaderNodeScalarInterp" => "VisualShaderNodeMix", "VisualShaderNodeVectorInterp" => "VisualShaderNodeMix", "VisualShaderNodeVectorScalarMix" => "VisualShaderNodeMix", "VisualShaderNodeScalarSmoothStep" => "VisualShaderNodeSmoothStep", "VisualShaderNodeVectorSmoothStep" => "VisualShaderNodeSmoothStep", "VisualShaderNodeVectorScalarSmoothStep" => "VisualShaderNodeSmoothStep", "VisualShaderNodeVectorScalarStep" => "VisualShaderNodeStep", "VisualShaderNodeScalarSwitch" => "VisualShaderNodeSwitch", "World" => "World3D", "StreamTexture" => "StreamTexture2D", "Light2D" => "PointLight2D" }
COLOR_RENAMES = {"mediumspringgreen"=>"MEDIUM_SPRING_GREEN", "mediumaquamarine"=>"MEDIUM_AQUAMARINE", "mediumslateblue"=>"MEDIUM_SLATE_BLUE", "mediumturquoise"=>"MEDIUM_TURQUOISE", "mediumvioletred"=>"MEDIUM_VIOLET_RED", "blanchedalmond"=>"BLANCHED_ALMOND", "cornflowerblue"=>"CORNFLOWER_BLUE", "darkolivegreen"=>"DARK_OLIVE_GREEN", "lightgoldenrod"=>"LIGHT_GOLDENROD", "lightslategray"=>"LIGHT_SLATE_GRAY", "lightsteelblue"=>"LIGHT_STEEL_BLUE", "mediumseagreen"=>"MEDIUM_SEA_GREEN", "darkgoldenrod"=>"DARK_GOLDENROD", "darkslateblue"=>"DARK_SLATE_BLUE", "darkslategray"=>"DARK_SLATE_GRAY", "darkturquoise"=>"DARK_TURQUOISE", "lavenderblush"=>"LAVENDER_BLUSH", "lightseagreen"=>"LIGHT_SEA_GREEN", "palegoldenrod"=>"PALE_GOLDENROD", "paleturquoise"=>"PALE_TURQUOISE", "palevioletred"=>"PALE_VIOLET_RED", "rebeccapurple"=>"REBECCA_PURPLE", "antiquewhite"=>"ANTIQUE_WHITE", "darkseagreen"=>"DARK_SEA_GREEN", "lemonchiffon"=>"LEMON_CHIFFON", "lightskyblue"=>"LIGHT_SKY_BLUE", "mediumorchid"=>"MEDIUM_ORCHID", "mediumpurple"=>"MEDIUM_PURPLE", "midnightblue"=>"MIDNIGHT_BLUE", "darkmagenta"=>"DARK_MAGENTA", "deepskyblue"=>"DEEP_SKY_BLUE", "floralwhite"=>"FLORAL_WHITE", "forestgreen"=>"FOREST_GREEN", "greenyellow"=>"GREEN_YELLOW", "lightsalmon"=>"LIGHT_SALMON", "lightyellow"=>"LIGHT_YELLOW", "navajowhite"=>"NAVAJO_WHITE", "saddlebrown"=>"SADDLE_BROWN", "springgreen"=>"SPRING_GREEN", "transparent"=>"TRANSPARENT", "yellowgreen"=>"YELLOW_GREEN", "aquamarine"=>"AQUAMARINE", "blueviolet"=>"BLUE_VIOLET", "chartreuse"=>"CHARTREUSE", "darkorange"=>"DARK_ORANGE", "darkorchid"=>"DARK_ORCHID", "darksalmon"=>"DARK_SALMON", "darkviolet"=>"DARK_VIOLET", "dodgerblue"=>"DODGER_BLUE", "ghostwhite"=>"GHOST_WHITE", "lightcoral"=>"LIGHT_CORAL", "lightgreen"=>"LIGHT_GREEN", "mediumblue"=>"MEDIUM_BLUE", "papayawhip"=>"PAPAYA_WHIP", "powderblue"=>"POWDER_BLUE", "sandybrown"=>"SANDY_BROWN", "whitesmoke"=>"WHITE_SMOKE", "aliceblue"=>"ALICE_BLUE", "burlywood"=>"BURLYWOOD", "cadetblue"=>"CADET_BLUE", "chocolate"=>"CHOCOLATE", "darkgreen"=>"DARK_GREEN", "darkkhaki"=>"DARK_KHAKI", "firebrick"=>"FIREBRICK", "gainsboro"=>"GAINSBORO", "goldenrod"=>"GOLDENROD", "indianred"=>"INDIAN_RED", "lawngreen"=>"LAWN_GREEN", "lightblue"=>"LIGHT_BLUE", "lightcyan"=>"LIGHT_CYAN", "lightgray"=>"LIGHT_GRAY", "lightpink"=>"LIGHT_PINK", "limegreen"=>"LIME_GREEN", "mintcream"=>"MINT_CREAM", "mistyrose"=>"MISTY_ROSE", "olivedrab"=>"OLIVE_DRAB", "orangered"=>"ORANGE_RED", "palegreen"=>"PALE_GREEN", "peachpuff"=>"PEACH_PUFF", "rosybrown"=>"ROSY_BROWN", "royalblue"=>"ROYAL_BLUE", "slateblue"=>"SLATE_BLUE", "slategray"=>"SLATE_GRAY", "steelblue"=>"STEEL_BLUE", "turquoise"=>"TURQUOISE", "webmaroon"=>"WEB_MAROON", "webpurple"=>"WEB_PURPLE", "cornsilk"=>"CORNSILK", "darkblue"=>"DARK_BLUE", "darkcyan"=>"DARK_CYAN", "darkgray"=>"DARK_GRAY", "deeppink"=>"DEEP_PINK", "honeydew"=>"HONEYDEW", "lavender"=>"LAVENDER", "moccasin"=>"MOCCASIN", "navyblue"=>"NAVY_BLUE", "seagreen"=>"SEA_GREEN", "seashell"=>"SEASHELL", "webgreen"=>"WEB_GREEN", "crimson"=>"CRIMSON", "darkred"=>"DARK_RED", "dimgray"=>"DIM_GRAY", "fuchsia"=>"FUCHSIA", "hotpink"=>"HOT_PINK", "magenta"=>"MAGENTA", "oldlace"=>"OLD_LACE", "skyblue"=>"SKY_BLUE", "thistle"=>"THISTLE", "webgray"=>"WEB_GRAY", "bisque"=>"BISQUE", "indigo"=>"INDIGO", "maroon"=>"MAROON", "orange"=>"ORANGE", "orchid"=>"ORCHID", "purple"=>"PURPLE", "salmon"=>"SALMON", "sienna"=>"SIENNA", "silver"=>"SILVER", "tomato"=>"TOMATO", "violet"=>"VIOLET", "yellow"=>"YELLOW", "azure"=>"AZURE", "beige"=>"BEIGE", "black"=>"BLACK", "brown"=>"BROWN", "coral"=>"CORAL", "green"=>"GREEN", "ivory"=>"IVORY", "khaki"=>"KHAKI", "linen"=>"LINEN", "olive"=>"OLIVE", "wheat"=>"WHEAT", "white"=>"WHITE", "aqua"=>"AQUA", "blue"=>"BLUE", "cyan"=>"CYAN", "gold"=>"GOLD", "gray"=>"GRAY", "lime"=>"LIME", "peru"=>"PERU", "pink"=>"PINK", "plum"=>"PLUM", "snow"=>"SNOW", "teal"=>"TEAL", "red"=>"RED", "tan"=>"TAN"}

class Script
    def do_conversions
        @code.collect! do |line|
            if line == "tool\n"
                line = "@tool\n"
            elsif line.start_with?("onready")
                line.insert(0, "@")
                redo
            elsif line.start_with?("export")
                line.insert(0, "@")
                redo
                 # TODO: convert to new syntax
            elsif line.include?("extends")
                type = line.match(%r{extends (\w+)[:|\s]})[1]
                line = line.gsub("extends #{type}", "extends #{TYPE_CONVERSIONS.fetch(type, type)}")
            elsif not line.include?("func ") and line.match(MethodCall::REGEX)
                convert_constants(line)
                line = MethodCall.new(line)
            elsif line.include?("setget")
                setget_data = line.match %r{setget\s*(?<set>[^,]+)?,?\s*(?<get>.+)?}
                tabs = Script.tabs(line)

                line = setget_data.pre_match.strip + ":"
                if setget_data["set"]
                    line << " set = #{setget_data["set"].chomp}"
                end
                if setget_data["get"]
                    if setget_data["set"]
                        line << ","
                    end
                    line << " get = #{setget_data["get"].chomp}"
                end
                line << "\n"
                line = tabs + line
                redo
            elsif line.include?("var") and type = line.match(%r{:\s*(?<name>\w+)}) || type = line.match(%r{\s+as\s+(?<name>\w+)})
                line = line.gsub(type["name"], TYPE_CONVERSIONS.fetch(type["name"], type["name"]))
            elsif assign = line.match(%r{(?<property>\w+)\s*=\s*(?<value>\w+)})
                convert_constants(line)
                line = convert_assigns(line, assign["property"], assign["value"])
            elsif line.match(%r{\w})
                convert_constants(line)
            end
            line
        end
    end

    def convert_constants(line)
        COLOR_RENAMES.each_pair do |from, to|
            convert_constant(line, "Color.#{from}", "Color.#{to}")
        end

        convert_constant(line, "scancode", "keycode")
        convert_constant(line, "Engine.editor_hint", "Engine.is_editor_hint()")
        # TODO: add more
    end

    def convert_constant(line, from, to)
        line.gsub!(from, to)
    end

    def convert_assigns(line, property, value)
        return line if convert_assign(line, property, value, "pause_mode", "PAUSE_MODE_PROCESS", "process_mode", "PROCESS_MODE_ALWAYS") # TODO: other modes
        # TODO: add more

        line
    end

    def convert_assign(line, property, value, from_property, from_value, to_property, to_value)
        if property == from_property and value == from_value
            line.gsub!(from_property, to_property)
            line.gsub!(from_value, to_value)
        end
    end
end

class MethodCall
    def do_conversions
        if @method == "connect"
            if @caller
                @caller = [@caller, @args[0].gsub('"', "")].join "."
            else
                @caller = @args[0].gsub('"', "")
            end

            args = [[@args[1], @args[2].gsub('"', "")].join(".")]

            if @args.length > 3
                i = 3
                while !@args[i].end_with?("]")
                    i += 1
                end
                @args[3][0] = ""
                @args[i][-1] = ""
                args[0] << ".bind(#{@args[3..i].join(", ")})"

                if @args.length == i + 2
                    args << @args[i + 1]
                end
            end
            @args = args
            @args.first.gsub!("self.", "")

            # TODO: convert signal names
        elsif @method == "yield"
            @override = @tabs + "await #{@args[0]}.#{@args[1].gsub('"', "")}\n"
        else
            convert_method("clip", "intersection")
            convert_method("empty", "is_empty")
            convert_method("instance", "instantiate")
            convert_method("rand_range", "randf_range")

            convert_method_with_caller(nil, "decimals", "step_decimals")
            # TODO: add more
        end
    end

    def convert_method(from, to)
        if @method == from
            @method = to
        end
    end

    def convert_method_with_caller(caller, from, to)
        if @caller == caller and @method == from
            @method = to
        end
    end
end

class Node
    def do_conversions
        add_missing_default("RayCast2D", "enabled", "false")
        # TODO: add more
    end

    def add_missing_default(type, property, value)
        if @type == type and not @lines.find{|line| line.class == Property and line.name == property}
            @lines << "#{property} = #{value}\n"
        end
    end
end

class Property
    def do_conversions
        ### Nodes
        convert_name("margin_left", "offset_left")
        convert_name("margin_top", "offset_top")
        convert_name("margin_right", "offset_right")
        convert_name("margin_bottom", "offset_bottom")
        # TODO: add more
        
        ### Resources
        convert_name("scancode", "keycode")
        # TODO: here too
    end

    def convert_name(from, to)
        @name = to if @name == from
    end
end
