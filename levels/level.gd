extends Node2D

signal on_go_to_level

const firefly = preload("res://firefly.tscn")

@export var firefly_count = 1

func _ready():
    for i in range(firefly_count):
        var firefly_instance = firefly.instantiate()
        $Fireflies.add_child(firefly_instance)
        firefly_instance.position.x += i * 100


func _on_next_level_body_entered(body):
    if body.is_in_group("keeper"):
        emit_signal("on_next_level")

func on_complete():
    $AnimationPlayer.play("relight")
