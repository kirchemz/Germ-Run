extends Node2D

@onready var player = $Player

var zombie = preload("res://Zombie/zombie.tscn")
var sent_zombies = false
var door_opened = false

func _ready():
	player.kill()
	await get_tree().create_timer(2).timeout
	player.countdown.timer_length = 10
	player.unkill()
	player.countdown.timer_start = true
	player.get_node("Camera2D").enabled = false
	player.get_node("Maze Camera").enabled = true
	$TileMap3.visible = true
	$Player.visible = true
	$Door.visible = true
	$Lever.visible = true

func _process(delta):
	if $Door.player_in:
		if door_opened:
			get_tree().change_scene_to_file("res://Levels/level_four.tscn")
	if not sent_zombies:
		if player.send_zombies:
			var zombie_instance = zombie.instantiate()
			zombie_instance.target = player
			add_child(zombie_instance)
			zombie_instance.global_position = Vector2(165, 145)
			var zombie_instance2 = zombie.instantiate()
			zombie_instance2.target = player
			add_child(zombie_instance2)
			zombie_instance2.global_position = Vector2(544, 569)
			sent_zombies = true
	if $Lever.player_in:
		player.input_space()
		if player.space_bar_active:
			$Lever.on()
			$Lever2.visible = true
	if $Lever2.player_in:
		if $Lever2.visible == true:
			player.input_space()
			if player.space_bar_active:
				$Lever2.on()
				$Lever3.visible = true
	if $Lever3.player_in:
		if $Lever3.visible == true:
			player.input_space()
			if player.space_bar_active:
				$Lever3.on()
				$Door.open()
				door_opened = true
	if not $Lever.player_in:
		if not $Lever2.player_in:
			if not $Lever3.player_in:
				player.remove_space()
