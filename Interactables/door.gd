extends Area2D

var player_in = false

func open():
	$Open.visible = true
	$Closed.visible = false




func _on_body_entered(body):
	if body.name == "Player":
		player_in = true


func _on_body_exited(body):
	if body.name == "Player":
		player_in = false
