extends State
@export var idle_state: State
@export var speed: float = 140.0

func process_input(_event: InputEvent) -> State:
	return null

func process_physics(delta: float) -> State:
	var dir : Vector2 = input.get_move_dir()
	if dir == Vector2.ZERO:
		parent.velocity = parent.velocity.move_toward(Vector2.ZERO, 2000.0 * delta)
		parent.move_and_slide()
		return idle_state
	parent.velocity = dir.normalized() * speed
	parent.move_and_slide()
	return null
