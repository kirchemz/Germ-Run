extends Node2D

func _ready():
	$Label2.text = "Deaths: " + str(Globals.deaths)
