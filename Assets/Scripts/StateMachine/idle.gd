extends State
@export var move_state: State

func process_input(_event: InputEvent) -> State:
	return null

func process_physics(delta: float) -> State:
	# Gradually stop
	parent.velocity = parent.velocity.move_toward(Vector2.ZERO, 2000.0 * delta)
	# Start moving if input exists
	var v := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if v != Vector2.ZERO:
		return move_state
	parent.move_and_slide()
	return null
