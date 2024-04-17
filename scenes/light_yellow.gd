extends Node2D

func _ready():
	visible = false

func _process(_delta):
	if (Attributes.day_night_enabled == false):
		visible = false
	elif (GlobalTime.hour >= 19) || (GlobalTime.hour <= 4):
		visible = true
	else:
		visible = false
