extends Node2D

@onready var player = $Player

var lazer = preload("res://Player/lazer.tscn")
var cooldown = false

var zombie = preload("res://Zombie/zombie.tscn")
var sent_zombies = false

var open_door_5
var open_door_4
var open_door_3
var open_door_2
var open_door
var activate_door

func _ready():
	$Lightbulb.wait_time = 0.2
	$"Lightbulb 2".wait_time = 2
	$Lightbulb_3.wait_time = 4
	$Lightbulb_4.wait_time = 6
	$Lightbulb_5.wait_time = 8
	player.get_node("Camera2D").zoom = Vector2(2, 2)
	player.speed = 200
	player.kill()
	await get_tree().create_timer(2).timeout
	player.unkill()
	player.countdown.timer_length = 10
	player.countdown.timer_start = true
	$TileMap.visible = true
	$Lightbulb.visible = true
	$"Lightbulb 2".visible = true
	$Lightbulb_3.visible = true
	$Lightbulb_4.visible = true
	$Lightbulb_5.visible = true
	$Door.visible = true
	player.visible = true

func _process(delta):
	if not sent_zombies:
		if player.send_zombies:
			var zombie_instance = zombie.instantiate()
			zombie_instance.target = player
			add_child(zombie_instance)
			zombie_instance.global_position = Vector2(250, 165)
			zombie_instance.scale = Vector2(1.75, 1.75)
			sent_zombies = true
	if not $Lightbulb.activated:
		open_door = false
	if not $"Lightbulb 2".activated:
		open_door_2 = false
	if open_door:
		if open_door_2:
			if open_door_3:
				if open_door_4:
					if open_door_5:
						$Door.open()
						activate_door = true
	if activate_door:
		if $Door.player_in:
			Globals.lightbulb_on = false
			get_tree().change_scene_to_file("res://Levels/cure_room.tscn")
	if Globals.lightbulb_on:
		$Lightbulb.activated = true
		open_door = true
	if Globals.lightbulb_on_2:
		$"Lightbulb 2".activated = true
		open_door_2 = true
	if Globals.lightbulb_on_3:
		$Lightbulb_3.activated = true
		open_door_3 = true
	if Globals.lightbulb_on_4:
		$Lightbulb_4.activated = true
		open_door_4 = true
	if Globals.lightbulb_on_5:
		$Lightbulb_5.activated = true
		open_door_5 = true
	if $TileMap.visible == true:
		if not Globals.player_direction == null:
			if not cooldown:
				if player.space_bar_active:
					cooldown = true
					var lazer_instance = lazer.instantiate()
					lazer_instance.player_input = Globals.player_direction
					add_child(lazer_instance)
					lazer_instance.global_position = player.global_position
					if Globals.player_direction == Vector2(0, 1) or Globals.player_direction == Vector2(0, -1):
						lazer_instance.rotation_degrees = 90
					if snapped(Globals.player_direction, Vector2(1, 1)) == Vector2(-1, 1) or snapped(Globals.player_direction, Vector2(1, 1)) == Vector2(1, -1):
						lazer_instance.rotation_degrees = 135
					if snapped(Globals.player_direction, Vector2(1, 1)) == Vector2(1, 1) or snapped(Globals.player_direction, Vector2(1, 1)) == Vector2(-1, -1):
						lazer_instance.rotation_degrees = 45
					await get_tree().create_timer(1).timeout
					cooldown = false
