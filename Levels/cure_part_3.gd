extends Node2D

var player_in = false
@onready var player = $Player

func _process(delta: float) -> void:
	if player_in:
		player.input_space()
		if player.space_bar_active:
			get_tree().change_scene_to_file("res://Levels/cure_room.tscn")
	else:
		player.remove_space()

func _on_area_2d_body_entered(body: Node2D) -> void:
	player_in = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	player_in = false
