extends Node2D


func _ready() -> void:
	var start_planet_growth = create_tween().tween_property($Planet, "scale", Vector2(7, 7), 8)
	await start_planet_growth.finished
	var planet_growth = create_tween().tween_property($Planet, "scale", Vector2(70, 70), 8)
	await get_tree().create_timer(4).timeout
	$"Dialogue Box".visible = true
	$"Dialogue Box/NinePatchRect/Label".text = "*BOOM*"
	$"Dialogue Box/NinePatchRect/Label".visible_ratio = 0
	await get_tree().create_timer(0.5).timeout
	$"Dialogue Box".text_speed = 0.04
	await $"Dialogue Box/NinePatchRect/Label".visible_ratio >= 2
	var blackout = create_tween().tween_property($TextureRect, "modulate", Color(0.0, 0.0, 0.0, 1.0), 3)
	await blackout.finished
	await get_tree().create_timer(3).timeout
	get_tree().change_scene_to_file("res://Levels/level_one.tscn")
