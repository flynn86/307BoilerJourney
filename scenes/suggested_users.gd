extends Node2D
var rng = RandomNumberGenerator.new()

var users = []
# Called when the node enters the scene tree for the first time.
func _ready():
	(Attributes.database).query("SELECT username, interest_1, interest_2, interest_3 FROM Players WHERE username != '" + Attributes.username + "'")
	var n = 0
	users = []
	var str = ""
	var num = (Attributes.database).query_result.size()
	while users.size() < 5 && users.size() < num:
		n = rng.randi_range(0,(Attributes.database).query_result.size() - 1)
		if (Attributes.database).query_result[n]["username"] not in users:
			if (Attributes.database).query_result[n]["interest_1"] != "":
				users.append((Attributes.database).query_result[n]["username"])
				str += "Username : " + (Attributes.database).query_result[n]["username"] + "\n" + "Interests : " + (Attributes.database).query_result[n]["interest_1"] + ", " + (Attributes.database).query_result[n]["interest_2"] + ", " + (Attributes.database).query_result[n]["interest_3"] + "\n"
				str += "\n"
			else:
				num-=1
	$suggestion1.text = str
	$AddFriend1.visible = true
	$AddFriend2.visible = true
	$AddFriend3.visible = true
	$AddFriend4.visible = true
	$AddFriend5.visible = true
	if users.size() < 5:
		$AddFriend5.visible = false
	if users.size() < 4:
		$AddFriend4.visible = false
	if users.size() < 3:
		$AddFriend3.visible = false
	if users.size() < 2:
		$AddFriend2.visible = false
	if users.size() < 1:
		$AddFriend1.visible = false
	


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
	get_tree().change_scene_to_file("res://scenes/suggested_users.tscn")


func _on_go_back_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
