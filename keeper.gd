extends CharacterBody2D

signal on_dead(body: Node2D)

@export var speed = 200

var dead = false
var direction = Vector2()

var _is_immune = false

var items = []

@onready var _current_sprite = get_node("Downwards")

func _physics_process(delta):
    if dead:
        return

    direction = Vector2(0, 0)
    if Input.is_action_pressed("move_east"):
        direction.x += 1
    if Input.is_action_pressed("move_west"):
        direction.x -= 1
    if Input.is_action_pressed("move_south"):
        direction.y += 1
    if Input.is_action_pressed("move_north"):
        direction.y -= 1


    if $Downwards.visible and direction.y < 0:
        $Downwards.visible = false
        $Upwards.visible = true
        _current_sprite = $Upwards
    elif $Upwards.visible and direction.y > 0:
        $Downwards.visible = true
        $Upwards.visible = false
        _current_sprite = $Downwards

    if direction.x > 0 and _current_sprite.flip_h:
        _current_sprite.flip_h = false
    elif direction.x < 0 and not _current_sprite.flip_h:
        _current_sprite.flip_h = true

    direction.y *= 0.5
    direction = direction.normalized()
    velocity = direction * speed

    if velocity.length_squared() != 0:
        $MovementAnimationPlayer.play("walk")
    else:
        $MovementAnimationPlayer.play("idle")

    move_and_slide()


func _on_unlit():
    $AnimationPlayer.play("unlit")

func _on_lit():
    dead = false
    $AnimationPlayer.play("lit")


func die():
    if not dead:
        dead = true
        emit_signal("on_dead", self)


func make_immune():
    $AnimationPlayer.play("lit");
    _is_immune = true

func add_item(item: String):
    items.append(item)
