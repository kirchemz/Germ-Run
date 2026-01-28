extends Node2D

@onready var player = $Player

var player_in = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.countdown.visible = false
	player.get_node("Camera2D").zoom = Vector2(3, 3)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player_in:
		player.input_space()
		if player.space_bar_active:
			get_tree().change_scene_to_file("res://Levels/win_screen.tscn")


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player_in = true
