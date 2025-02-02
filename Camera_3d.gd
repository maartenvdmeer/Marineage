extends Camera3D

var target: MeshInstance3D = null
const OFFSET = Vector3(0, 2, -5) # Adjust as needed
var sensitivity = 0.3
var custom_rotation = Vector3()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Capture the mouse
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	# Find the whale in the scene tree
	target = get_parent() as MeshInstance3D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if target:
		# Smoothly update the camera position based on the whale's position
		global_transform.origin = target.global_transform.origin + OFFSET
		global_transform.basis = target.global_transform.basis

# Handle mouse input for camera rotation
func _input(event):
	if event is InputEventMouseMotion:
		custom_rotation.y -= event.relative.x * sensitivity
		custom_rotation.x -= event.relative.y * sensitivity
		custom_rotation.x = clamp(custom_rotation.x, -90, 90)
		rotation_degrees = custom_rotation
