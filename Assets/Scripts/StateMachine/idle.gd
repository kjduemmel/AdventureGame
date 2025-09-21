extends State
@export var move_state: State
var _last_dir := Vector2.DOWN  # default facing

func process_physics(delta: float) -> State:
	# friction
	parent.velocity = parent.velocity.move_toward(Vector2.ZERO, 2000.0 * delta)
	parent.move_and_slide()

	var dir := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if dir.length() > 0.001:
		_last_dir = dir.normalized()
		return move_state

	# Animate: set Idle blend position to last facing
	if anim_tree:
		anim_tree.set("parameters/Idle/blend_position", _last_dir)
	return null
