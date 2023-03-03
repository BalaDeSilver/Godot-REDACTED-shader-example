# Godot [ REDACTED ] shader example

![](https://github.com/BalaDeSilver/Godot-REDACTED-shader-example/blob/main/REDACTED.gif)

An example of a shader I made in Godot 3.x.

Reminder that you need the following code somewhere on the node you attach it to for 3.x to work with this shader:
```
func _process(_delta):
	get_surface_material(0).set_shader_param("camera_distance", ($"%Camera".transform.origin - transform.origin).length())
```
