extends CharacterBody3D

const ROTATION_SPEED_X = 0.5
const ROTATION_SPEED_Y = 0.2

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
