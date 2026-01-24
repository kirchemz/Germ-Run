extends Area2D

var activated = false
var wait_time = 0

func _process(delta):
	if activated:
		on()
		await get_tree().create_timer(wait_time).timeout
		activated = false
		Globals.lightbulb_on_3 = false
		off()
func on():
	$Off.visible = false
	$On.visible = true

func off():
	$Off.visible = true
	$On.visible = false
