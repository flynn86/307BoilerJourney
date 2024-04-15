extends Node2D

@onready var user = $LineEdit


func _process(delta):
	if (Attributes.friends_list_changed):
		_ready()
		Attributes.friends_list_changed = 0

func _ready():
	var children1 = $FriendReqList/ScrollContainer/VBoxContainer.get_children()
	var children2 = $Friends/ScrollContainer/VBoxContainer.get_children()
	for child in children1:
		$FriendReqList/ScrollContainer/VBoxContainer.remove_child(child)
	for child in children2:
		$Friends/ScrollContainer/VBoxContainer.remove_child(child)
	(Attributes.database).query("SELECT sender FROM Friend_Reqs WHERE recipient = '" + Attributes.username + "'")
	for i in (Attributes.database).query_result:
		var scene = preload("res://scenes/friends_list/friend_req.tscn")
		var friend_req = scene.instantiate()
		friend_req.f_sender = i["sender"]
		friend_req.f_recipient = Attributes.username
		friend_req.custom_minimum_size = Vector2(0, 135)
		$FriendReqList/ScrollContainer/VBoxContainer.add_child(friend_req)
	(Attributes.database).query("SELECT friend2 FROM Friend_List WHERE friend1 = '" + Attributes.username + "'")
	for j in (Attributes.database).query_result:
		var scene = preload("res://scenes/friends_list/friend.tscn")
		var friend = scene.instantiate()
		friend.friend = j["friend2"]
		friend.currentUser = Attributes.username
		friend.custom_minimum_size = Vector2(0, 60)
		$Friends/ScrollContainer/VBoxContainer.add_child(friend)


func _on_send_request_pressed():
	var username = user.text
	if (username == Attributes.username):
		$InvalidUser.text = "Cannot friend yourself :("
		$InvalidUser.visible = true
	elif (!((Attributes.database).select_rows("Players", "username = '" + username + "'", ["*"]))):
		$InvalidUser.text = "User does not exist"
		$InvalidUser.visible = true
	elif ((Attributes.database).select_rows("Friend_Reqs", "sender = '" + Attributes.username + "' AND recipient = '" + username + "'", ["*"])):
		$InvalidUser.text = "Already an outgoing request to this user"
		$InvalidUser.visible = true
	elif ((Attributes.database).select_rows("Friend_List", "friend1 = '" + Attributes.username + "' AND friend2 = '" + username + "'", ["*"])):
		$InvalidUser.text = "Already friends with this user"
		$InvalidUser.visible = true
	else:
		$InvalidUser.visible = false
		$LineEdit.text = ""
		var data = {
			"sender" = Attributes.username,
			"recipient" = username
		}
		(Attributes.database).insert_row("Friend_Reqs", data)


func _on_close_pressed():
	get_tree().change_scene_to_file(Attributes.location)

func _on_refresh_pressed():
	_ready()
