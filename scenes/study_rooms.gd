extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Panel/group1.visible = false
	$Panel/group2.visible = false
	$Panel/group3.visible = false
	$Panel/group4.visible = false
	$Panel/group5.visible = false
	$Panel/chat1.visible = false
	$Panel/chat2.visible = false
	$panel/chat3.visible = false
	$Panel/chat4.visible = false
	$Panel/chat5.visible = false
	
	if Attributes.group1 != "":
		$Panel/group1.visible = true
		$Panel/group1.text = Attributes.group1
		$Panel/chat1.visible = true

	if Attributes.group2 != "":
		$group2.visible = true
		$group2.text = Attributes.group2
		$chat2.visible = true
	
	if Attributes.group3 != "":
		$Panel/group3.visible = true
		$Panel/group3.text = Attributes.group3
		$Panel/chat3.visible = true
		
	if Attributes.group4 != "":
		$Panel/group4.visible = true
		$Panel/group4.text = Attributes.group4
		$Panel/chat4.visible = true
		
	if Attributes.group5 != "":
		$Panel/group5.visible = true
		$Panel/group5.text = Attributes.group5
		$Panel/chat5.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_createnew_pressed():
	if Attributes.group1 == "":
		Attributes.group1 = $Panel/TextEdit.text
	elif Attributes.group2 == "":
		Attributes.group2 = $Panel/TextEdit.text
	elif Attributes.group3 == "":
		Attributes.group3 = $Panel/TextEdit.text
	elif Attributes.group4 == "":
		Attributes.group4 = $Panel/TextEdit.text
	elif Attributes.group5 == "":
		Attributes.group5 = $Panel/TextEdit.text
	SaveUtils.save()
	get_tree().change_scene_to_file("res://scenes/study_rooms.tscn")



func _on_join_pressed():
	(Attributes.database).query("SELECT group1, group2, group3, group4, group5 FROM Players WHERE username != '" + Attributes.username + "'")
	var check = 0
	var text = $Panel/TextEdit.text
	for i in (Attributes.database).query_result:
		if i["group1"] == text:
			check = 1
			break
		elif i["group2"] == text:
			check = 1
			break
		elif i["group3"] == text:
			check = 1
			break
		elif i["group4"] == text:
			check = 1
			break
		elif i["group5"] == text:
			check = 1
			break
	
	if check == 1:
		(Attributes.database).query("SELECT group1, group2, group3, group4, group5 FROM Players WHERE username = '" + Attributes.username + "'")
		if Attributes.group1 == "":
			Attributes.group1 = $Panel/TextEdit.text
		elif Attributes.group2 == "":
			Attributes.group2 = $Panel/TextEdit.text
		elif Attributes.group3 == "":
			Attributes.group3 = $Panel/TextEdit.text
		elif Attributes.group4 == "":
			Attributes.group4 = $Panel/TextEdit.text
		elif Attributes.group5 == "":
			Attributes.group5 = $Panel/TextEdit.text
		SaveUtils.save()
		get_tree().change_scene_to_file("res://scenes/study_rooms.tscn")
	if check == 0:
		$Panel/InvalidUser.visible = true


func _on_goback_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")


func _on_chat_1_pressed():
	get_tree().change_scene_to_file("res://scenes/study_room1.tscn")


func _on_chat_2_pressed():
	get_tree().change_scene_to_file("res://scenes/study_room2.tscn")
	pass # Replace with function body.


func _on_chat_3_pressed():
	get_tree().change_scene_to_file("res://scenes/study_room3.tscn")
	pass # Replace with function body.


func _on_chat_4_pressed():
	get_tree().change_scene_to_file("res://scenes/study_room4.tscn")
	pass # Replace with function body.


func _on_chat_5_pressed():
	get_tree().change_scene_to_file("res://scenes/study_room5.tscn")
	pass # Replace with function body.
