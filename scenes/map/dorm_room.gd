extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.





func _on_view_schedule_pressed():
	Attributes.location = "res://scenes/map/dorm_room.tscn"
	SaveUtils.save()
	get_tree().change_scene_to_file("res://scenes/schedule.tscn")



func _on_menu_button_pressed():
	Attributes.location = "res://scenes/map/dorm_room.tscn"
	SaveUtils.save()
	get_tree().change_scene_to_file("res://scenes/menu.tscn")


func _on_exit_pressed():
	Attributes.location = "res://scenes/map/housing_map.tscn"
	SaveUtils.save()
	get_tree().change_scene_to_file(Attributes.location)
