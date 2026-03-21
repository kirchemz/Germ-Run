extends Node2D

@onready var player = $Player

func _ready() -> void:
	player.countdown.visible = false
	player.get_node("Camera2D").zoom = Vector2(3, 3)
	player.speed = 200
