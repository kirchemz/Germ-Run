extends Node2D

@onready var player = $Player

var player_in = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.countdown.visible = false
	player.get_node("Camera2D").zoom = Vector2(3, 3)
	player.speed = 200

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if player_in:
		player.input_space()
		if player.space_bar_active:
			$Control.visible = true
	else:
		player.remove_space()


func _on_area_2d_body_entered(body: Node2D) -> void:
	player_in = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	player_in = true
