extends CharacterBody2D

var target
var speed = 1
var direction
var follow = false

func _process(delta):
	if follow:
		direction = (target.global_position - global_position * speed)
		velocity = direction * speed
		move_and_slide()


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


