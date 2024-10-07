extends Area2D

signal triggered

func _on_body_entered(body:Node2D):
    emit_signal("triggered")
