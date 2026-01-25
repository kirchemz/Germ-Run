extends CharacterBody2D

@onready var anim = $AnimationPlayer

var target
var speed = 1
var direction
var follow = false

func _process(delta):
	if target.global_position > global_position:
		$AnimatedSprite2D.flip_h = false
	if target.global_position < global_position:
		$AnimatedSprite2D.flip_h = true
	if follow:
		anim.play("Run")
		direction = (target.global_position - global_position * speed)
		velocity = direction * speed
		move_and_slide()
	else:
		anim.play("Idle")


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		follow = true


func _on_area_2d_body_exited(body):
	if body.name == "Player":
		follow = false


func _on_area_2d_2_body_entered(body):
	if body.name == "Player":
		get_tree().reload_current_scene()
		Globals.deaths += 1
		Globals.lightbulb_on = false
		Globals.lightbulb_on_2 = false
		Globals.lightbulb_on_3 = false
		Globals.lightbulb_on_4 = false
		Globals.lightbulb_on_5 = false
