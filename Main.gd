extends Node3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

# Handle input events
func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
