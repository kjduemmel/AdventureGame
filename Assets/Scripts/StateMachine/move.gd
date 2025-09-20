extends State
@export var idle_state: State
@export var speed: float = 140.0

func process_physics(delta: float) -> State:
	var dir: Vector2 = input.get_move_dir()
	var length := dir.length() 

	# Move
	parent.velocity = dir.normalized() * speed
	parent.move_and_slide()
	
	if length <= 0.001:
		# Idle
		parent.velocity = parent.velocity.move_toward(Vector2.ZERO, 2000.0 * delta)
		parent.move_and_slide()
		return idle_state

	# Animate: set Walk blend position (Vector2)
	# AnimationTree params are:
	#   parameters/Walk/blend_position
	#   parameters/Idle/blend_position
	if anim_tree:
		anim_tree.set("parameters/Walk/blend_position", dir)
	return null
