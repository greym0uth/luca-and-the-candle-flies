extends Area2D

signal on_activated
signal on_deactivated

var _bodies = []
var _has_firefly = false
var _has_keeper = false

@export var require_both = false

func _on_interaction_body_entered(body):
    if body.is_in_group("firefly"):
        _has_firefly = true
    elif body.is_in_group("keeper"):
        _has_keeper = true

    _bodies.push_back(body)
    if (require_both and _has_keeper and _has_firefly) or (not require_both and _bodies.size() >= 0):
        emit_signal("on_activated")

func _on_interaction_body_exited(body):
    if body.is_in_group("firefly"):
        _has_firefly = false
    elif body.is_in_group("keeper"):
        _has_keeper = false

    _bodies.erase(body)
    if (require_both and not _has_keeper || not _has_firefly) or (not require_both and _bodies.size() == 0):
        emit_signal("on_deactivated")
