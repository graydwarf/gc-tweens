extends Node2D

# This is done because godot-companion loads this project
# as a pck file where we want to control the start and stop
# of each example.
func _ready() -> void:
	for node in get_children():
		node.Start()

	var firstChild = get_child(0)
	firstChild.visible = true
