extends Node2D
var rng = RandomNumberGenerator.new()

var users = []
# Called when the node enters the scene tree for the first time.
func _ready():
	(Attributes.database).query("SELECT username, interest_1, interest_2, interest_3 FROM Players WHERE username != '" + Attributes.username + "'")
	var randomlist = []
	var n = 0
	users = []
	for i in range(0,5):
		n = rng.randi_range(0,(Attributes.database).query_result.size())
		randomlist.append(n)
	var str = ""
	for i in (Attributes.database).query_result:
		users.append(i["username"])
		str += "Username : " + i["username"] + "\n" + "Interests : " + i["interest_1"] + ", " + i["interest_2"] + ", " + i["interest_3"] + "\n"
	$suggestion1.text = str


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_add_friend_1_pressed():
	var username = users[0]
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
		$InvalidUser.text = "Request Sent!"
		var data = {
			"sender" = Attributes.username,
			"recipient" = username
		}
		(Attributes.database).insert_row("Friend_Reqs", data)





func _on_add_friend_2_pressed():
	var username = users[1]
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
		$InvalidUser.text = "Request Sent!"
		var data = {
			"sender" = Attributes.username,
			"recipient" = username
		}
		(Attributes.database).insert_row("Friend_Reqs", data)
		
func _on_add_friend_3_pressed():
	var username = users[2]
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
		$InvalidUser.text = "Request Sent!"
		var data = {
			"sender" = Attributes.username,
			"recipient" = username
		}
		(Attributes.database).insert_row("Friend_Reqs", data)
		
func _on_add_friend_4_pressed():
	var username = users[3]
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
		$InvalidUser.text = "Request Sent!"
		var data = {
			"sender" = Attributes.username,
			"recipient" = username
		}
		(Attributes.database).insert_row("Friend_Reqs", data)
		
func _on_add_friend_5_pressed():
	var username = users[4]
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
		$InvalidUser.text = "Request Sent!"
		var data = {
			"sender" = Attributes.username,
			"recipient" = username
		}
		(Attributes.database).insert_row("Friend_Reqs", data)




func _on_refresh_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")


func _on_go_back_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
