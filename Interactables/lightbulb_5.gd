extends Area2D

var activated = false
var wait_time = 0

func _process(_delta):
	if activated:
		off()
		await get_tree().create_timer(wait_time).timeout
		Globals.lightbulb_on_5 = false
		activated = false
	else:
		on()
func on():
	$Off.visible = false
	$On.visible = true

func off():
	$Off.visible = true
	$On.visible = false
