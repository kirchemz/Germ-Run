extends Area2D

var player_in = false

func _process(delta):
	pass

func on():
	$On.visible = true
	$Off.visible = false
func off():
	$Off.visible = true
	$On.visible = false


func _on_body_entered(body):
	if body.name == "Player":
		player_in = true


func _on_body_exited(body):
	if body.name == "Player":
		player_in = false
