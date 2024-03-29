extends Node2D

@onready var location_name = get_child(0)
var transparency_increment : float = 1.0

func _ready():
	visible = false
	location_name.modulate = Color(255, 255, 255, 0)
	location_name.visible_characters = -1

func header_animation_scene():
	visible = true
	location_name.modulate = Color(255, 255, 255, 0)
	while (location_name.modulate.a < 255):
		location_name.modulate.a += transparency_increment


func _on_stew_area_body_entered(_body):
	location_name.text = "Stewart Center"
	header_animation_scene()


func _on_ellt_area_body_entered(body):
	if (body == $CharacterBody2D):
		location_name.text = "Elliot Hall"
		header_animation_scene()
