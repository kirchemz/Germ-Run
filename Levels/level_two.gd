extends Node2D

@onready var player = $Player

var open_door = false

var zombie = preload("res://Zombie/zombie.tscn")
var sent_zombies = false

func _ready():
	player.get_node("Camera2D").zoom = Vector2(2, 2)
	player.speed = 200
	player.kill()
	await get_tree().create_timer(2).timeout
	player.unkill()
	player.countdown.timer_length = 10
	player.countdown.timer_start = true
	$TileMap.visible = true
	$Lever.visible = true
	$Door.visible = true
	player.visible = true

func _process(delta):
	if not sent_zombies:
		if player.send_zombies:
			var zombie_instance = zombie.instantiate()
			zombie_instance.target = player
			add_child(zombie_instance)
			zombie_instance.global_position = Vector2(575, 400)
			zombie_instance.scale = Vector2(1.75, 1.75)
			sent_zombies = true
	if open_door:
		if $Door.player_in:
			get_tree().change_scene_to_file("res://Levels/level_four.tscn")
	if $Lever.player_in:
		player.input_space()
		if player.space_bar_active:
			$Lever.on()
			$Lever2.visible = true
	if $Lever2.visible == true:
		if $Lever2.player_in:
			player.input_space()
			if player.space_bar_active:
				$Lever2.on()
				$Door.open()
				open_door = true
	if not $Lever.player_in:
		if not $Lever2.player_in:
			player.remove_space()
