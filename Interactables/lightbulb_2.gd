extends Area2D

var activated = false
var wait_time = 0
var turn_off = false

func _ready():
	pass

func _process(delta):
	if not $Timer.wait_time == wait_time:
		$Timer.wait_time = wait_time
	if activated:
		on()
		$Timer.start()
		if turn_off:
			Globals.lightbulb_on_2 = false
			activated = false
			$Timer.stop()
	else:
		off()
func on():
	$Off.visible = false
	$On.visible = true

func off():
	$Off.visible = true
	$On.visible = false

func _on_timer_timeout():
	turn_off = true
