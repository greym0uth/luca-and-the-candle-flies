extends TileMapLayer

signal on_enabled
signal on_disabled

var _enabled = false

func enable():
    _enabled = true
    emit_signal("on_enabled")

func disable():
    _enabled = false
    emit_signal("on_disabled")


func toggle():
    if _enabled:
        disable()
    else:
        enable()
