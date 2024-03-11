extends Node2D

var quest1_active = false
var quest1_completed = false
var engineering_visited = false
var loeb_visited = false
var quest2_active = false
var quest2_completed = false
var quest3_active = false
var quest3_completed = false


func _on_back_to_map_pressed():
	get_tree().change_scene_to_file(Attributes.location)

func _process(delta):
	if quest1_active:
		if engineering_visited and loeb_visited:
			quest1_completed = true
			print("quest1 completed")

func _on_start_quest_1_pressed():
	quest1_active = true
	engineering_visited = false
	loeb_visited = false
	


func _on_start_quest_2_pressed():
	pass # Replace with function body.


func _on_start_quest_3_pressed():
	pass # Replace with function body.
