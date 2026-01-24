extends Area2D

var speed = 600
var player_input


func _process(delta):
	position += player_input * speed * delta

func _on_area_entered(area):
	if area.name == "Lightbulb":
		Globals.lightbulb_on = true
		queue_free()
	if area.name == "Lightbulb 2":
		Globals.lightbulb_on_2 = true
		queue_free()
	if area.name == "Lightbulb_3":
		Globals.lightbulb_on_3 = true
		queue_free()
	if area.name == "Lightbulb_4":
		Globals.lightbulb_on_4 = true
		queue_free()
	if area.name == "Lightbulb_5":
		Globals.lightbulb_on_5 = true
		queue_free()




func _on_body_entered(body):
	if not body.name == "Player":
		queue_free()
