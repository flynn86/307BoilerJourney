extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$group1.visible = false
	$group2.visible = false
	$group3.visible = false
	$group4.visible = false
	$group5.visible = false
	$chat1.visible = false
	$chat2.visible = false
	$chat3.visible = false
	$chat4.visible = false
	$chat5.visible = false
	
	if Attributes.group1 != "":
		$group1.visible = true
		$group1.text = Attributes.group1
		$chat1.visible = true

	if Attributes.group2 != "":
		$group2.visible = true
		$group2.text = Attributes.group2
		$chat2.visible = true
	
	if Attributes.group3 != "":
		$group3.visible = true
		$group3.text = Attributes.group3
		$chat3.visible = true
		
	if Attributes.group4 != "":
		$group4.visible = true
		$group4.text = Attributes.group4
		$chat4.visible = true
		
	if Attributes.group5 != "":
		$group5.visible = true
		$group5.text = Attributes.group5
		$chat5.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_createnew_pressed():
	if Attributes.group1 == "":
		Attributes.group1 = $TextEdit.text
	elif Attributes.group2 == "":
		Attributes.group2 = $TextEdit.text
	elif Attributes.group3 == "":
		Attributes.group3 = $TextEdit.text
	elif Attributes.group4 == "":
		Attributes.group4 = $TextEdit.text
	elif Attributes.group5 == "":
		Attributes.group5 = $TextEdit.text
	SaveUtils.save()
	get_tree().change_scene_to_file("res://scenes/study_rooms.tscn")



func _on_join_pressed():
	(Attributes.database).query("SELECT group1, group2, group3, group4, group5 FROM Players WHERE username != '" + Attributes.username + "'")
	var check = 0
	var text = $TextEdit.text
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
			Attributes.group1 = $TextEdit.text
		elif Attributes.group2 == "":
			Attributes.group2 = $TextEdit.text
		elif Attributes.group3 == "":
			Attributes.group3 = $TextEdit.text
		elif Attributes.group4 == "":
			Attributes.group4 = $TextEdit.text
		elif Attributes.group5 == "":
			Attributes.group5 = $TextEdit.text
		SaveUtils.save()
		get_tree().change_scene_to_file("res://scenes/study_rooms.tscn")
	if check == 0:
		$InvalidUser.visible = true


func _on_goback_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")


func _on_chat_1_pressed():
	get_tree().change_scene_to_file("res://scenes/study_room1.tscn")
