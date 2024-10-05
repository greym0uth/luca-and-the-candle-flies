extends CharacterBody2D
@export var speed = 200
var direction = Vector2()

func _physics_process(delta):
    direction = Vector2(0, 0)
    if Input.is_action_pressed("move_east"):
        direction.x += 1
    if Input.is_action_pressed("move_west"):
        direction.x -= 1
    if Input.is_action_pressed("move_south"):
        direction.y += 1
    if Input.is_action_pressed("move_north"):
        direction.y -= 1
    direction.y *= 0.5
    direction = direction.normalized()
    velocity = direction * speed
    move_and_slide()
