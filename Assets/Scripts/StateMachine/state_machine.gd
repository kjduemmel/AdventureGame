class_name StateMachine
extends Node

@export
var starting_state: State

var current_state: State

func init(parent: CharacterBody2D, anim_tree: AnimationTree, input: Node) -> void:
	for c in get_children():
		if c is State:
			c.parent = parent
			c.anim_tree = anim_tree
			c.input = input
	current_state = starting_state
	current_state.enter()

func process_input(event: InputEvent) -> void:
	var next := current_state.process_input(event)
	if next: _to(next)

func process_frame(delta: float) -> void:
	var next := current_state.process_frame(delta)
	if next: _to(next)

func process_physics(delta: float) -> void:
	var next := current_state.process_physics(delta)
	if next: _to(next)

func _to(next: State) -> void:
	if next == current_state: return
	current_state.exit()
	current_state = next
	current_state.enter()
