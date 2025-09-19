class_name State
extends Node

@export
var parent: CharacterBody2D
@export
var animations: AnimatedSprite2D
@export
var input: Node
@export
var animation_name: StringName

func enter() -> void:
	if animations and animation_name != StringName() and "play" in animations:
		animations.play(animation_name)

func exit() -> void: pass
func process_input(_event: InputEvent) -> State: return null
func process_frame(_delta: float) -> State: return null
func process_physics(_delta: float) -> State: return null
