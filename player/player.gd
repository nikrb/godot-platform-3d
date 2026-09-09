extends CharacterBody3D

const ROTATION_SPEED_X = 0.5
const ROTATION_SPEED_Y = 0.2

#step 4
const SPEED = 5.5	# metres per second

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

#step 4
# add input actions
func _physics_process(delta):
	var input_dir_2d = Input.get_vector(
		"move_left", "move_right", "move_forward", "move_backward"
	)
	var input_dir_3d = Vector3(
		input_dir_2d.x, 0, input_dir_2d.y
	)
	var direction = transform.basis * input_dir_3d
	
	velocity.x = direction.x * SPEED
	velocity.z = direction.z * SPEED
	
	move_and_slide()
	
