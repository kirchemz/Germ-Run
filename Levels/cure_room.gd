extends Node2D

@onready var player = $Player

var player_in = false
var crafting_ui = preload("res://UI/crafting_ui.tscn")
var player_in_vent = false
var has_cure = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.countdown.visible = false
	player.get_node("Camera2D").zoom = Vector2(3, 3)
	player.speed = 200

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if player_in_vent:
		player.input_space()
		if player.space_bar_active:
			if has_cure:
				get_tree().change_scene_to_file("res://Levels/win_screen.tscn")
	if not has_cure:
		if not Globals.hide_crafting:
			if player_in:
				player.input_space()
				if player.space_bar_active:
					player.global_position = Vector2(161, 98)
					$Crafting_UI.visible = true
					$"Cure Piece 1".visible = true
					$"Cure Piece 2".visible = true
					player.kill()
					player.get_node("Camera2D").enabled = true
	if not player_in and not player_in_vent:
		player.remove_space()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == player:
		player_in = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body == player:
		player_in = false


func _on_vent_body_entered(body: Node2D) -> void:
	if body == player:
		player_in_vent = true


func _on_vent_body_exited(body: Node2D) -> void:
	if body == player:
		player_in_vent = false
