extends StaticBody2D

func _ready():
    get_parent().on_enabled.connect(_on_enabled)
    get_parent().on_disabled.connect(_on_disabled)

func _on_enabled():
    self.set_collision_layer_value(1, true)
    self.set_collision_layer_value(5, false)
    $DisabledSprite.visible = false
    $EnabledSprite.visible = true
    pass

func _on_disabled():
    self.set_collision_layer_value(1, false)
    self.set_collision_layer_value(5, true)
    $DisabledSprite.visible = true
    $EnabledSprite.visible = false
    pass
