extends Camera2D

@export var target: NodePath
@export var speed = 100

func _process(delta):
    var target_node = get_node(target)
    if target_node != null:
        global_position = lerp(global_position, target_node.global_position, speed * delta)
