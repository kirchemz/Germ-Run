extends Node2D

@onready var player = $Player
@onready var lever = $Lever
@onready var door = $Door

var player_in = false
var lever_flipped = false
var zombie = preload("res://Zombie/zombie.tscn")
var sent_zombies = false

func _ready():
	player.kill()
	player.get_node("Camera2D").enabled = true
	player.anim.play("Idle")
	await get_tree().create_timer(2).timeout
	player.countdown.timer_length = 5
	player.countdown.visible = false
	$TileMap.visible = true
	$Lever.visible = true
	$Door.visible = true
	player.visible = true
	$"Dialogue Box".visible = true
	$"Dialogue Box/NinePatchRect/Label".text = " I think I am the only
	 one to survive the
	 toxic gasses of the"
	$"Dialogue Box".text_speed = 0.01
	$"Dialogue Box/NinePatchRect/Label".add_theme_font_size_override("font_size", 200)
	await get_tree().create_timer(5).timeout
	$"Dialogue Box/NinePatchRect/Label".visible_ratio = 0
	$"Dialogue Box/NinePatchRect/Label".text = " planet we crashed on.
		 I need to save the rest
		 of my crew before"
	await get_tree().create_timer(5).timeout
	$"Dialogue Box/NinePatchRect/Label".visible_ratio = 0
	$"Dialogue Box".text_speed = 0.04
	$"Dialogue Box/NinePatchRect/Label".text = " it's to late!"
	await get_tree().create_timer(2).timeout
	$"Dialogue Box".visible = false
	player.unkill()
	$TileMap/Label2.visible = true

func _process(delta):
	if not sent_zombies:
		if player.send_zombies:
			var zombie_instance = zombie.instantiate()
			zombie_instance.target = player
			add_child(zombie_instance)
			zombie_instance.global_position = Vector2(200, 200)
			sent_zombies = true
	if lever_flipped:
		door.open()
		if door.player_in:
			get_tree().change_scene_to_file("res://Levels/level_two.tscn")
	if lever.player_in:
		player.input_space()
		if player.space_bar_active:
				lever.on()
				lever_flipped = true
	elif not door.player_in:
		player.remove_space()
