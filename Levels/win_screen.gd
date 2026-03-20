extends Node2D

func _ready():
	$Label2.text = "Deaths: " + str(Globals.deaths)


func _on_button_pressed() -> void:
	Globals.deaths = 0
	Globals.crafting_box_1_full = false
	Globals.crafting_box_2_full = false
	Globals.hide_crafting = false
	get_tree().change_scene_to_file("res://Levels/main_menu.tscn")
