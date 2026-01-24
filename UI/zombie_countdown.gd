extends Node2D

var timer_length = 0
var send_zombies = false
var timer_start = false

func _ready():
	pass

func _process(delta):
	if timer_start:
		$Timer.start(timer_length)
		timer_start = false
	$Label.text = "Zombies Coming in: " + str(snapped($Timer.time_left, 1)) + " Secs"



func _on_timer_timeout():
	send_zombies = true
