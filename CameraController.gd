extends Camera3D

var speed = 5.0
var sensitivity = 0.3
var zoom_speed = 2.0
var custom_rotation = Vector3()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Camera movement
	var direction = Vector3()
	if Input.is_action_pressed("ui_up"):
		direction.z -= 1
	if Input.is_action_pressed("ui_down"):
		direction.z += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	direction = direction.normalized() * speed * delta
	translate(direction)

# Handle input events
func _input(event):
	if event is InputEventMouseMotion:
		custom_rotation.y -= event.relative.x * sensitivity
		custom_rotation.x -= event.relative.y * sensitivity
		custom_rotation.x = clamp(custom_rotation.x, -90, 90)
		rotation_degrees = custom_rotation
	elif event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			translate(Vector3(0, 0, -zoom_speed))
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			translate(Vector3(0, 0, zoom_speed))
