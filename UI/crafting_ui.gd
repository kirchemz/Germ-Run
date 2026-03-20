extends Node2D

var mouse_in = false
var current_area : Area2D

func _process(_delta: float) -> void:
	if Globals.crafting_box_1_full and Globals.crafting_box_2_full:
		$Cure.visible = true
		$Button.visible = true
		$"../Cure Piece 1".visible = false
		$"../Cure Piece 2".visible = false


func _on_button_pressed() -> void:
	Globals.hide_crafting = true
	visible = false
	$"../Label".visible = true
	$"../Player".unkill()
	$"..".has_cure = true
