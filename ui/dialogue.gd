extends Container

@export var entries: Array[String] = []
@export var _label: NodePath

@onready var _label_node = get_node(_label)

var is_active = false

func next_entry():
    if entries.size() == 0:
        return

    var entry = entries.pop_front()
    _label_node.text = entry

    $AnimationPlayer.play("active")
    $AnimationPlayer.seek(1)
    is_active = true

func on_complete():
    is_active = false
