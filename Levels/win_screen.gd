extends Node2D

func _ready():
	$Label2.text = "Deaths: " + str(Globals.deaths)


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Levels/main_menu.tscn")
