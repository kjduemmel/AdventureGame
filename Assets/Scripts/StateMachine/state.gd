class_name State
extends Node

@export
var parent: CharacterBody2D
@export
var anim_tree: AnimationTree
@export
var input: Node
@export
var animation_name: StringName

var _playback: AnimationNodeStateMachinePlayback

func enter() -> void:
	if anim_tree and _playback and animation_name != StringName():
		anim_tree.active = true
		_playback.travel(animation_name)

func exit() -> void: pass
func process_input(_event: InputEvent) -> State: return null
func process_frame(_delta: float) -> State: return null
func process_physics(_delta: float) -> State: return null
