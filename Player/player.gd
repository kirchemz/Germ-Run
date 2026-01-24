extends CharacterBody2D

@onready var anim = $AnimatedSprite2D
@onready var countdown = $"Zombie Countdown"

var speed = 300
var input_direction

var space_bar_active = false
var send_zombies = false

func _process(delta):
	if input_direction != Vector2(0, 0):
		Globals.player_direction = input_direction
	if $"Maze Camera".enabled == true:
		countdown.scale = Vector2(0.12, 0.12)
		countdown.position = Vector2(-14.523, -12.682)
	else:
		countdown.scale = Vector2(0.492, 0.492)
		countdown.position = Vector2(-62.798, -64.434)
	if $"Zombie Countdown".send_zombies:
		send_zombies = true
	if Input.is_action_just_pressed("space"):
		space_bar_active = true
	else:
		space_bar_active = false
	if input_direction != null:
		if input_direction.x == -1:
			$AnimatedSprite2D.flip_h = true
		if input_direction.x == 1:
			$AnimatedSprite2D.flip_h = false
	if input_direction:
		anim.play("Run")
	else:
		anim.play("Idle")
	input_direction = Input.get_vector("left", "right", "up", "down").normalized()
	velocity = input_direction * speed
	move_and_slide()

func input_space():
	$"Space Bar".visible = true

func remove_space():
	$"Space Bar".visible = false

func kill():
	$Camera2D.enabled = false
	set_process(false)
	set_process_input(false)
	set_physics_process(false)

func unkill():
	$Camera2D.enabled = true
	set_process(true)
	set_process_input(true)
	set_physics_process(true)
