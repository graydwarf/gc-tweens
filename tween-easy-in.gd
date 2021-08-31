extends Node2D

onready var _tween = $Tween
var _movingUp = false
export var _tweenSpeed = 1
export var _tweenWaitTime = 0.4
export var _tweenTransistionType = Tween.TRANS_LINEAR
export var _tweenEasement = Tween.EASE_IN

func _ready() -> void:
	ToggleTween()

func TweenDown():
	_tween.interpolate_property($icon, "position", Vector2(300, 100),
		Vector2(300, 300), _tweenSpeed,
		_tweenTransistionType, _tweenEasement, _tweenWaitTime)
	_tween.start()

func TweenUp():
	_tween.interpolate_property($icon, "position", Vector2(300, 300),
		Vector2(300, 100), _tweenSpeed,
		_tweenTransistionType, _tweenEasement, _tweenWaitTime)
	_tween.start()

func ToggleTween():
	if _movingUp:
		_movingUp = false
		TweenDown()
	else:
		_movingUp = true
		TweenUp()

func _on_Tween_tween_completed(object: Object, key: NodePath) -> void:
	ToggleTween()
