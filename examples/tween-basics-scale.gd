extends Node2D

onready var _tween1 = $Tween1
onready var _tween2 = $Tween2
onready var _tween3 = $Tween3
onready var _tween4 = $Tween4

export var _scaledUpSize = 1.5
export var _tweenSpeed = 2
export var _tweenWaitTime = 0.4
export var _tweenTransistionType = Tween.TRANS_LINEAR

onready var _easeInIcon = $EaseInIcon
onready var _easeOutIcon = $EaseOutIcon
onready var _easeInOutIcon = $EaseInOutIcon
onready var _easeOutInIcon = $EaseOutInIcon
onready var _titleLabel = $TitleLabel

var _flag = false
var _isRunning = false

func _ready() -> void:
	pass

func Start():
	_isRunning = true
	ToggleTween()

func Stop():
	_isRunning = false

func Move1():
	_tween1.interpolate_property(_easeInIcon, "scale",
			Vector2(1.0, 1.0), Vector2(_scaledUpSize, _scaledUpSize),
			_tweenSpeed, _tweenTransistionType,
			Tween.EASE_IN, _tweenWaitTime)
	_tween1.start()

	_tween2.interpolate_property(_easeOutIcon, "scale",
			Vector2(1.0, 1.0), Vector2(_scaledUpSize, _scaledUpSize),
			_tweenSpeed, _tweenTransistionType,
			Tween.EASE_OUT, _tweenWaitTime)
	_tween2.start()

	_tween3.interpolate_property(_easeOutInIcon, "scale",
			Vector2(1.0, 1.0), Vector2(_scaledUpSize, _scaledUpSize),
			_tweenSpeed, _tweenTransistionType,
			Tween.EASE_IN_OUT, _tweenWaitTime)
	_tween3.start()

	_tween4.interpolate_property(_easeInOutIcon, "scale",
			Vector2(1.0, 1.0), Vector2(_scaledUpSize, _scaledUpSize),
			_tweenSpeed, _tweenTransistionType,
			Tween.EASE_OUT_IN, _tweenWaitTime)
	_tween4.start()

func Move2():
	_tween1.interpolate_property(_easeInIcon, "scale",
			Vector2(_scaledUpSize, _scaledUpSize), Vector2(1.0, 1.0),
			_tweenSpeed, _tweenTransistionType,
			Tween.EASE_IN, _tweenWaitTime)
	_tween1.start()

	_tween2.interpolate_property(_easeOutIcon, "scale",
			Vector2(_scaledUpSize, _scaledUpSize), Vector2(1.0, 1.0),
			_tweenSpeed, _tweenTransistionType,
			Tween.EASE_OUT, _tweenWaitTime)
	_tween2.start()

	_tween3.interpolate_property(_easeInOutIcon, "scale",
			Vector2(_scaledUpSize, _scaledUpSize), Vector2(1.0, 1.0),
			_tweenSpeed, _tweenTransistionType,
			Tween.EASE_IN_OUT, _tweenWaitTime)
	_tween3.start()

	_tween4.interpolate_property(_easeOutInIcon, "scale",
			Vector2(_scaledUpSize, _scaledUpSize), Vector2(1.0, 1.0),
			_tweenSpeed, _tweenTransistionType,
			Tween.EASE_OUT_IN, _tweenWaitTime)
	_tween4.start()

func ToggleTween():
	_flag = !_flag
	if _flag:
		Move1()
	else:
		Move2()

# Only need one of the teens to monitor and trigger completed events for all
func _on_Tween_tween_completed(_object: Object, _key: NodePath) -> void:
	if !_isRunning:
		return

	ToggleTween()

func _on_TransLinearButton_pressed() -> void:
	_titleLabel.text = "TRANS_LINEAR = 0  The animation is interpolated linearly."
	_tweenTransistionType = Tween.TRANS_LINEAR

func _on_TransSineButton_pressed() -> void:
	_titleLabel.text = "TRANS_SINE = 1 The animation is interpolated using a sine function."
	_tweenTransistionType = Tween.TRANS_SINE

func _on_TransQuintButton_pressed() -> void:
	_titleLabel.text = "TRANS_QUINT = 2 The animation is interpolated with a quintic (to the power of 5) function."
	_tweenTransistionType = Tween.TRANS_QUINT

func _on_TransQuartButton_pressed() -> void:
	_titleLabel.text = "TRANS_QUART = 3 The animation is interpolated with a quartic (to the power of 4) function."
	_tweenTransistionType = Tween.TRANS_QUART

func _on_TransQuadButton_pressed() -> void:
	_titleLabel.text = "TRANS_QUAD = 4 The animation is interpolated with a quadratic (to the power of 2) function."
	_tweenTransistionType = Tween.TRANS_QUAD

func _on_TransExpoButton_pressed() -> void:
	_titleLabel.text = "TRANS_EXPO = 5 The animation is interpolated with an exponential (to the power of x) function."
	_tweenTransistionType = Tween.TRANS_EXPO

func _on_TransElasticButton_pressed() -> void:
	_titleLabel.text = "TRANS_ELASTIC = 6 The animation is interpolated with elasticity, wiggling around the edges."
	_tweenTransistionType = Tween.TRANS_ELASTIC

func _on_TransCubicButton_pressed() -> void:
	_titleLabel.text = "TRANS_CUBIC = 7 The animation is interpolated with a cubic (to the power of 3) function."
	_tweenTransistionType = Tween.TRANS_CUBIC

func _on_TransCircButton_pressed() -> void:
	_titleLabel.text = "TRANS_CIRC = 8 The animation is interpolated with a function using square roots."
	_tweenTransistionType = Tween.TRANS_CIRC

func _on_TransBounceButton_pressed() -> void:
	_titleLabel.text = "TRANS_BOUNCE = 9 The animation is interpolated by bouncing at the end."
	_tweenTransistionType = Tween.TRANS_BOUNCE

func _on_TransBackButton_pressed() -> void:
	_titleLabel.text = "TRANS_BACK = 10 The animation is interpolated backing out at ends."
	_tweenTransistionType = Tween.TRANS_BACK
