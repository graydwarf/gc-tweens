extends Node2D
onready var _icon = $icon

var _growTween = Tween.new()
var _shrinkTween = Tween.new()
var _isBouncing = false

func _ready():
	add_child(_growTween)
	add_child(_shrinkTween)
	TweenBounce()

func TweenBounce():
	_isBouncing = true
	TweenGrow()
	#TweenShrink()
	_isBouncing = false

func TweenGrow():
	_growTween.interpolate_property(_icon, 'scale',
		Vector2(1.0, 1.0), Vector2(2.0, 2.0), 2,
		Tween.TRANS_CIRC, Tween.EASE_OUT)
	_growTween.interpolate_property(_icon, 'scale',
		Vector2(2.0, 2.0), Vector2(1.0, 1.0), 2,
		Tween.TRANS_QUAD, Tween.EASE_IN, 2)
	_growTween.start()

func TweenShrink():
	_shrinkTween.interpolate_property(_icon, 'scale',
		Vector2(1.0, 1.0), Vector2(0.5, 0.5), 2,
		Tween.TRANS_CUBIC, Tween.EASE_OUT)
	_shrinkTween.interpolate_property(_icon, 'scale',
		Vector2(0.5, 0.5), Vector2(1.0, 1.0), 2,
		Tween.TRANS_QUAD, Tween.EASE_IN, 2)
	_shrinkTween.start()

func _process(delta):
	if !_isBouncing:
		TweenBounce()

	#tween_up.is_active()
	#var up = Input.is_action_just_pressed("ui_up")
	#var down = Input.is_action_just_pressed("ui_down")
