extends Node2D

signal felled

var _is_in_range = false
var is_felled = false

@onready var _keeper = get_tree().get_nodes_in_group("keeper")[0]

func _process(_delta):
    if _is_in_range and _keeper != null:
        if _keeper.items.has("axe") and Input.is_action_just_pressed("keeper_use"):
            is_felled = true
            $Sprite2D.frame = 0
            emit_signal("felled")

func _on_interaction_on_deactivated():
    _is_in_range = false

func _on_interaction_on_activated():
    _is_in_range = true
