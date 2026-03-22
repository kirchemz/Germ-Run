extends Node2D

var text_speed = 0

func _process(delta: float) -> void:
	$NinePatchRect/Label.visible_ratio += text_speed
