extends CharacterBody2D

var speed = 400

@onready var seeded_offset = randf_range(-100, 100)

@export var rotation_speed = 1
@export var collect_stay_radius = 128

var current_time = 0

var current_rotation = 0

var target_position = null

func _process(delta):
    if target_position != null && Input.is_action_just_pressed("firefly_collect"):
        if get_global_mouse_position().distance_to(global_position) < collect_stay_radius:
            target_position = null

func _physics_process(delta):
    var target_angle = 0
    if target_position != null:
        target_angle = global_position.angle_to_point(target_position)
    else:
        var mouse_position = get_global_mouse_position()
        target_angle = global_position.angle_to_point(mouse_position)

    current_time += delta
    var offset_angle = sin(seeded_offset + current_time * 1) * (PI / 4)

    current_rotation = lerp_angle(current_rotation, target_angle + offset_angle, rotation_speed * PI * delta)

    var direction = Vector2.RIGHT.rotated(current_rotation)
    velocity = direction * speed
    move_and_slide()
