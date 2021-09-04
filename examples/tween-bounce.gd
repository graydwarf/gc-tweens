extends Node2D

func _ready() -> void:
	var tween = get_node("Tween")

	# Scale the icon up 2x
	tween.interpolate_property($icon, 'scale',
			Vector2(1.0, 1.0), Vector2(2.0, 2.0), 2,
			Tween.TRANS_CIRC, Tween.EASE_OUT)

	# Scale the icon down 2x
	tween.interpolate_property($icon, 'scale',
			Vector2(2.0, 2.0), Vector2(1.0, 1.0), 1,
			Tween.TRANS_CIRC, Tween.EASE_IN, 2)

	tween.start()
	tween.repeat = true

