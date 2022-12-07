extends MeshInstance
var rng = RandomNumberGenerator.new()
var rotate

func _ready():
	rng.randomize()
	rotate = Vector3(rng.randfn(0.0, 0.25), rng.randfn(0.0, 0.25), rng.randfn(0.0, 0.25)) # bananas ROTAT E

func _process(_delta):
	$"%MeshInstance".rotation_degrees += rotate # This will make the mesh rotate. Purely demonstrative.
	
	get_surface_material(0).set_shader_param("camera_distance", ($"%Camera".transform.origin - transform.origin).length())
