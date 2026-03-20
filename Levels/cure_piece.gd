extends Area2D

var locked = false
var mouse_in = false
var start_pos = global_position
var mouse_active = false

func _on_mouse_entered() -> void:
	mouse_in = true

func _on_mouse_exited() -> void:
	mouse_in = false
