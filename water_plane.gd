extends MeshInstance3D

# Variables to control the wave effect
var amplitude = 1.0
var frequency = 2.0
var speed = 1.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var time = Engine.get_physics_frames() * delta
	var wave_height = amplitude * sin(frequency * time + speed)
	position.y += wave_height * delta
	print("Water Plane Position: ", global_transform.origin)
	print("Water Plane Visible: ", visible)
