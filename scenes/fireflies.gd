extends Node2D

@onready var particle = $GPUParticles2D

func _ready():
	particle.emitting = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Attributes.day_night_enabled == false):
		particle.emitting = false
	elif (GlobalTime.hour >= 20) || (GlobalTime.hour <= 3):
		particle.emitting = true
	else:
		particle.emitting = false
