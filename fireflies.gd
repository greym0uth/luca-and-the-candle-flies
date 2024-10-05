extends Node2D

func _process(_delta):
    if Input.is_action_just_pressed("firefly_stay"):
        leave_firefly()

func leave_firefly():
    var mouse_position = get_global_mouse_position()
    for child in get_children():
        if child.target_position == null && child.global_position.distance_to(mouse_position) < child.collect_stay_radius:
            child.target_position = mouse_position
            break
