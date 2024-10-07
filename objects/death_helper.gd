extends Node2D

var _is_active = true

func on_death(body: Node2D):
    if _is_active:
        body.global_position = global_position

func disable():
    _is_active = false
