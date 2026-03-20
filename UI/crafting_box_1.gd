extends Node2D

var mouse_in = false
var current_area : Area2D
var full = false

func _process(delta: float) -> void:
	Globals.crafting_box_1_full = full
	if not full:
		if is_instance_valid(current_area):
			if "locked" in current_area:
				if not current_area.mouse_active:
					full = true
					current_area.locked = true
					current_area.global_position = global_position


func _on_area_entered(area: Area2D) -> void:
	mouse_in = true
	current_area = area


func _on_area_exited(_area: Area2D) -> void:
	mouse_in = false
	current_area = null
