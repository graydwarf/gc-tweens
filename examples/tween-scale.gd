extends Node2D

onready var _icon = $icon
onready var _codeContainer = $CodeContainer

var _tweenState = ""
var _tween : Tween

func _ready() -> void:
	AddNewTween()
	ScaleUp()

func ScaleUp():
	_tweenState = "ScaleUp"
	_tween.interpolate_property(
			_icon,
			'scale',
			_icon.get_scale(),
			Vector2(2.0, 2.0),
			1.2,
			Tween.TRANS_QUAD,
			Tween.EASE_OUT)
	_tween.start()

func FadeOut():
	_tweenState = "FadeOut"
	_tween.interpolate_property(
			_icon,
			'self_modulate',
			Color(1, 1, 1, 1),
			Color(1, 1, 1, 0),
			0.5,
			Tween.TRANS_LINEAR,
			Tween.EASE_IN)
	_tween.start()

func AddNewTween():
	_tween = Tween.new()
	_tween.connect("tween_completed", self, "_on_Tween_tween_completed")
	_icon.add_child(_tween)

func ResetTween():
	#get_node(".").remove_child("icon")
	_tweenState = "Reset"
	if _tween != null:
		_icon.remove_child(_tween)
	AddNewTween()
	ChangeTweenState()

func ChangeTweenState():
	if _tweenState == "ScaleUp":
		FadeOut()
	elif _tweenState == "Reset":
		ScaleUp()
	elif _tweenState == "FadeOut":
		ResetTween()

func _on_Tween_tween_completed(_object: Object, _key: NodePath) -> void:
	yield(get_tree().create_timer(1), "timeout")
	ChangeTweenState()

func ShowCode():
	_codeContainer.visible = true

func HideCode():
	_codeContainer.visible = true
