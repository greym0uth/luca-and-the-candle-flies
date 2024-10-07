extends Node2D

@export var starting_level: PackedScene

func _ready():
    if starting_level != null:
        on_go_to_level(starting_level)

func on_go_to_level(level: PackedScene):
    for child in get_children():
        child.call_deferred("queue_free")

    var level_instance = level.instantiate()
    call_deferred("add_child", level_instance)
    level_instance.on_go_to_level.connect(on_go_to_level)
