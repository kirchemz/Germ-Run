extends Area2D

var activated = false
var wait_time = 0

func _process(delta):
	if activated:
		on()
		light_time()
func on():
	$Off.visible = false
	$On.visible = true

func off():
	$Off.visible = true
	$On.visible = false

func light_time():
	await get_tree().create_timer(wait_time).timeout
	Globals.lightbulb_on_2 = false
	activated = false
	off()
