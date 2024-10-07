extends Node2D

signal on_go_to_level(scene: PackedScene)
signal complete

const firefly = preload("res://firefly.tscn")

@export var firefly_count = 1

var is_complete = false

func _ready():
    for i in range(firefly_count):
        var firefly_instance = firefly.instantiate()
        get_node("Sorted/Fireflies").call_deferred("add_child", firefly_instance)
        firefly_instance.position.x += i * 100


func _on_go_next_level(level: PackedScene):
    emit_signal("on_go_to_level", level)

func on_complete():
    is_complete = true
    $AnimationPlayer.play("relight")
    emit_signal("complete")
    get_node("Sorted/Shadows").queue_free()
