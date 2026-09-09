extends CharacterBody3D

const ROTATION_SPEED_X = 0.5
const ROTATION_SPEED_Y = 0.2

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _unhandled_input(event):
	if event is InputEventMouseMotion:
		rotation_degrees.y -= event.screen_relative.x * ROTATION_SPEED_X
		#get_node("Camera3D")
		#$Camera3D
		# access as unique name - don't need full path
		# screen_relative for different screen resolutions
		%Camera3D.rotation_degrees.x -= event.screen_relative.y * ROTATION_SPEED_Y
		%Camera3D.rotation_degrees.x = clamp(
			$Camera3D.rotation_degrees.x, -80, 80
		)
	# project > settings > input map > show predefined actions	
	elif event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
