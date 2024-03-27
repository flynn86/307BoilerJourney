extends Node2D

func _ready():
	$ServerDisconnect.visible = Attributes.isServer
	$ClientDisconnect.visible = !Attributes.isServer
	var data_line : String = ""
	var data : Array = (Attributes.database).select_rows(Attributes.serverName, "isHost == true", ["*"])
	if (data.size() != 0):
		data_line += "Host: " + data[0].username + '\n'
		data = (Attributes.database).select_rows(Attributes.serverName, "isHost == false", ["*"])
		for i in data.size():
			data_line += "Client " + str(i + 1) + ": " + data[i].username + '\n'
		$Label.text = data_line

func _process(_delta):
	_ready()

func _on_back_to_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")

func _on_client_disconnect_pressed():
	(Attributes.database).delete_rows(Attributes.serverName, "username == '%s'" % Attributes.username)
	Attributes.serverName = ""
	get_tree().change_scene_to_file("res://scenes/menu.tscn")

func _on_server_disconnect_pressed():
	pass # Replace with function body.
