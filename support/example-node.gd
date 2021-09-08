extends Button

func SetText(t):
	self.text = t

func _on_ExampleNode_pressed() -> void:
	TweenSignals.emit_signal("LoadExample", self.text)
