extends Node2D


func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://Levels/level_one.tscn")


func _on_credits_pressed():
	$"Back Button".visible = true
	$"Credits Title".visible = true
	$"Credits List".visible = true
	$"Start Button".visible = false
	$"Credits Button".visible = false
	$Title.visible = false


func _on_back_button_pressed():
	$"Back Button".visible = false
	$"Credits Title".visible = false
	$"Credits List".visible = false
	$"Start Button".visible = true
	$"Credits Button".visible = true
	$Title.visible = true
