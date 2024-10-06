extends StaticBody2D
class_name Powerable

signal on_powered
signal on_unpowered

@export var start_powered = false
@export var is_permanent = false

var is_powered = false

func _ready():
    if start_powered:
        power()

func unpower():
    if is_permanent or not is_powered:
        return

    is_powered = false
    emit_signal("on_unpowered")
    if has_node("AnimationPlayer"):
        $AnimationPlayer.play("unpower")

func power():
    if is_powered:
        return

    is_powered = true
    emit_signal("on_powered")

    if has_node("AnimationPlayer"):
        $AnimationPlayer.play("power")
