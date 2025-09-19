class_name PlayerInput
extends Node

func get_move_dir() -> Vector2:
	return Input.get_vector("move_left","move_right","move_up","move_down")
