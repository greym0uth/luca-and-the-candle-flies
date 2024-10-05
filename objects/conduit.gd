extends StaticBody2D

signal on_powered
signal on_unpowered

var _bodies = []

func _on_interaction_body_entered(body):
    print(_bodies)
    _bodies.push_back(body)
    print(_bodies)
    if _bodies.size() == 1:
        emit_signal("on_powered")

func _on_interaction_body_exited(body):
    print(_bodies)
    _bodies.erase(body)
    print(_bodies)
    if _bodies.size() == 0:
        emit_signal("on_unpowered")
