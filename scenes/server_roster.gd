extends Node2D

func _ready():
	$Panel/ServerDisconnect.visible = Attributes.isHost
	$Panel/ClientDisconnect.visible = !Attributes.isHost
	var data_line : String = ""
	var data : Array = (Attributes.database).select_rows("Players", "serverName == '%s' and isHost == true" % Attributes.serverName, ["*"])
	if (data.size() == 0):
		Attributes.serverName = ""
		Attributes.isHost = false
		SaveUtils.save()
		get_tree().change_scene_to_file("res://scenes/menu.tscn")
	else:
		data_line += "Host: " + data[0].username + " , xp: " + str(data[0].xp) + " , class rank: " + data[0].rank + '\n'
		data = (Attributes.database).select_rows("Players", "serverName == '%s' and isHost == false" % Attributes.serverName, ["*"])
		for i in data.size():
			data_line += "Client " + str(i + 1) + ": " + data[i].username + " , xp: " + str(data[i].xp) + " , class rank: " + data[i].rank + '\n'
		$Panel/Label.text = data_line

func _process(_delta):
	_ready()

func _on_back_to_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")

func _on_client_disconnect_pressed():
	Attributes.serverName = ""
	Attributes.isHost = false
	SaveUtils.save()
	get_tree().change_scene_to_file("res://scenes/menu.tscn")

func _on_server_disconnect_pressed():
	var data : Array = (Attributes.database).select_rows("Players", "serverName == '%s' and isHost == false" % Attributes.serverName, ["*"])
	for i in data:
		i.serverName = ""
		i.isHost = false
		(Attributes.database).update_rows("Players", "username == '%s'" % i.username, i)
	Attributes.serverName = ""
	Attributes.isHost = false
	SaveUtils.save()
	(Attributes.database).drop_table("%s_Chat" % Attributes.username)
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
