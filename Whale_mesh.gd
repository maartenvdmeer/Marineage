extends MeshInstance3D

var sensitivity = 0.3
var custom_rotation = Vector3()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Create the whale body
	var body = create_sphere(1.5, Vector3(0, 0, 0))
	add_child(body)

	# Create the whale tail
	var tail = create_cylinder(0.2, 0.5, Vector3(-1.8, 0, 0))
	tail.rotation_degrees = Vector3(0, 0, 90)
	add_child(tail)

	# Create the whale fins
	var fin_left = create_cylinder(0.1, 0.3, Vector3(0.5, -0.5, 0))
	fin_left.rotation_degrees = Vector3(0, 0, 45)
	add_child(fin_left)

	var fin_right = create_cylinder(0.1, 0.3, Vector3(0.5, 0.5, 0))
	fin_right.rotation_degrees = Vector3(0, 0, -45)
	add_child(fin_right)

	# Reference to the camera
	var camera = $Camera3D
	if camera:
		camera.translation = Vector3(0, 2, -5) # Adjust as needed

# Function to create a sphere mesh
func create_sphere(radius: float, position: Vector3) -> MeshInstance3D:
	var sphere = MeshInstance3D.new()
	var mesh = SphereMesh.new()
	mesh.radius = radius
	sphere.mesh = mesh
	sphere.transform.origin = position
	return sphere

# Function to create a cylinder mesh
func create_cylinder(radius: float, height: float, position: Vector3) -> MeshInstance3D:
	var cylinder = MeshInstance3D.new()
	var mesh = CylinderMesh.new()
	mesh.top_radius = radius
	mesh.bottom_radius = radius
	mesh.height = height
	cylinder.mesh = mesh
	cylinder.transform.origin = position
	return cylinder

# Called every frame. '_delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	# Update the camera position based on the whale's position
	var camera = $Camera3D
	if camera:
		camera.global_transform.origin = global_transform.origin + Vector3(0, 2, -5) # Adjust as needed
		camera.global_transform.basis = global_transform.basis

# Handle mouse input for camera rotation
func _input(event):
	if event is InputEventMouseMotion:
		custom_rotation.y -= event.relative.x * sensitivity
		custom_rotation.x -= event.relative.y * sensitivity
		custom_rotation.x = clamp(custom_rotation.x, -90, 90)
		rotation_degrees = custom_rotation
