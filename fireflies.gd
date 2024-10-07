extends Node2D

func _process(_delta):
    if Input.is_action_just_pressed("firefly_stay"):
        leave_firefly()

    if Input.is_action_just_pressed("firefly_collect"):
        for child in get_children():
            child.target_position = null

func add_firefly(firefly: Node2D):
    call_deferred("add_child", firefly)

func leave_firefly():
    var mouse_position = get_global_mouse_position()
    for child in get_children():
        if child.target_position == null:
            child.target_position = mouse_position
            break
