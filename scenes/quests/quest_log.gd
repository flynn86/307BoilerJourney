extends Node2D


func _on_back_to_map_pressed():
	get_tree().change_scene_to_file(Attributes.location)

func _process(delta):
	if Attributes.quest1_active and !Attributes.quest1_completed:
		$StartQuest1.visible = false
		$Quest1Status.visible = true
	elif !Attributes.quest1_active and Attributes.quest1_completed:
		$StartQuest1.visible = false
		$Quest1Status.visible = true
		$Quest1Status.text = "Completed"
	else:
		$StartQuest1.visible = true
		$Quest1Status.visible = false


func _on_start_quest_1_pressed():
	print("quest1 started")
	Attributes.quest1_active = true
	Attributes.engineering_ftn_visited = false
	Attributes.loeb_ftn_visited = false


func _on_start_quest_2_pressed():
	pass # Replace with function body.


func _on_start_quest_3_pressed():
	pass # Replace with function body.
