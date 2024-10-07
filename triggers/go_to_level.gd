extends Area2D

signal on_triggered(level: PackedScene)

@export var level: PackedScene

func _on_body_entered(body: Node2D):
    if level != null and body.is_in_group("keeper"):
        emit_signal("on_triggered", level)
