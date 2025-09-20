class_name Player
extends CharacterBody2D

@onready var anim_tree: AnimationTree = $AnimationTree
@onready var move_sm: StateMachine = $MovementSM
@onready var input_comp: PlayerInput = $PlayerInput

func _ready() -> void:
	move_sm.init(self, anim_tree, input_comp)

func _unhandled_input(event: InputEvent) -> void:
	move_sm.process_input(event)

func _physics_process(delta: float) -> void:
	move_sm.process_physics(delta)

func _process(delta: float) -> void:
	move_sm.process_frame(delta)
