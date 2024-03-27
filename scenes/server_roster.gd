extends Node2D

func _ready():
	var data_line : String = ""
	var data : Array = (Attributes.database).select_rows(Attributes.serverName, "isHost == true", ["*"])
	data_line += "Host: " + data[0].username + '\n'
	data = (Attributes.database).select_rows(Attributes.serverName, "isHost == false", ["*"])
	for i in data.size():
		data_line += "Client " + str(i + 1) + ": " + data[i].username + '\n'
	$Label.text = data_line

func _process(_delta):
	_ready()

func _on_back_to_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
