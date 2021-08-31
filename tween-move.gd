extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tween = get_node("Tween")

	tween.interpolate_property($icon, "position", Vector2(100, 100),
		Vector2(300, 300), 1.5,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, 3)

	tween.interpolate_property($icon, "position", Vector2(300, 300),
		Vector2(100, 100), 1.5,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, 1)

	tween.start()
	tween.repeat = true
