extends "res://Levels/cure_piece.gd"

func _process(_delta: float) -> void:
	if not locked:
		if not mouse_active:
			global_position = start_pos
	if mouse_in:
		if not locked:
			if not Globals.is_holding_1 and not Globals.is_holding_3:
				if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
					global_position = get_global_mouse_position()
					Globals.is_holding_2 = true
					mouse_active = true
				else:
					mouse_active = false
					Globals.is_holding_2 = false
