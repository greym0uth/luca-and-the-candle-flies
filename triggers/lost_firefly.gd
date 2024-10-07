extends Area2D

signal on_collected(body: Node2D)

const firefly: PackedScene = preload("res://firefly.tscn")

func _on_body_entered(body:Node2D):
    if body.is_in_group("keeper"):
        var firefly_instance = firefly.instantiate()
        firefly_instance.global_position = global_position
        emit_signal("on_collected", firefly_instance)
        print(firefly_instance.get_groups())
        call_deferred("queue_free")
