extends Node2D

func _on_view_progress_button_pressed():
	get_tree().change_scene_to_file("res://scenes/progress_page.tscn")

func _on_back_to_map_button_pressed():
	get_tree().change_scene_to_file(Attributes.location)

func _on_back_to_main_menu_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_customize_character_button_pressed():
	get_tree().change_scene_to_file("res://characters/Player.tscn")

func _ready():
	SaveUtils.load()
	$Panel/HostServerButton.visible = !(Attributes.serverName != "")
	$Panel/JoinServerButton.visible = !(Attributes.serverName != "")
	$Panel/LineEdit.visible = !(Attributes.serverName != "")
	$Panel/GlobalChatButton.visible = (Attributes.serverName != "")
	$Panel/ServerRosterButton.visible = (Attributes.serverName != "")
#	multiplayer.peer_connected.connect(add_client)
#	multiplayer.peer_disconnected.connect(remove_client)

#func _process(_delta):
	#if serverOn:
	#	enet.poll()

#const PORT = 9999

@onready var address_entry = $Panel/LineEdit
#var enet = ENetMultiplayerPeer.new()
#var serverOn : bool = false;

func _on_join_server_button_pressed():
	if address_entry.text == "":
		$Label2.visible = true
	else:
		$Label2.visible = false
		$Panel/HostServerButton.visible = false
		$Panel/JoinServerButton.visible = false
		$Panel/LineEdit.visible = false
		$Panel/GlobalChatButton.visible = true
		$Panel/ServerRosterButton.visible = true
		#multiplayer.multiplayer_peer = enet
		#if enet.create_client("127.0.0.1", PORT):
		#	print("Error Client")
		#else:
		#	print("Client good")
		#enet.create_client(address_entry.text, PORT)
		if (Attributes.database).select_rows("Players", "serverName == '%s' and isHost == true" % address_entry.text, ["*"]).size() != 0:
			Attributes.isHost = false
			Attributes.serverName = address_entry.text
			SaveUtils.save()

func _on_host_server_button_pressed():
	$Label2.visible = false
	$Panel/HostServerButton.visible = false
	$Panel/JoinServerButton.visible = false
	$Panel/GlobalChatButton.visible = true
	$Panel/ServerRosterButton.visible = true
	$Panel/LineEdit.visible = false
	#if enet.create_server(PORT):
	#	print("Error Host")
	#else:
	#	print("Host good")
	#multiplayer.multiplayer_peer = enet
	#serverOn = true
	#add_client(multiplayer.get_unique_id())
	Attributes.isHost = true
	Attributes.serverName = Attributes.username
	var table = {
		"username" : {"data_type":"text"},
		"message" : {"data_type":"text"},
		"time" : {"data_type":"text"},
		"date" : {"data_type":"text"}
	}
	(Attributes.database).create_table("%s_Chat" % Attributes.serverName, table)
	(Attributes.database).drop_table("%s_Chat" % Attributes.serverName)
	(Attributes.database).create_table("%s_Chat" % Attributes.serverName, table)
	SaveUtils.save()


#var player = preload("res://characters/Player.tscn")
#func add_client(id):
#	print("client connected " + str(id))
#	var client = player.instantiate()
#	add_child(client)
	
#func remove_client(id):
#	print("client disconnected " + str(id))
#	var client = get_node_or_null(str(id))
#	if client:
#		client.queue_free()

func _on_global_chat_button_pressed():
	get_tree().change_scene_to_file("res://scenes/global_chat.tscn")

func _on_server_roster_button_pressed():
	get_tree().change_scene_to_file("res://scenes/server_roster.tscn")

func _on_message_button_pressed():
	get_tree().change_scene_to_file("res://scenes/messages.tscn")

func _on_interests_button_pressed():
	get_tree().change_scene_to_file("res://scenes/interests.tscn")


func _on_bug_report_button_pressed():
	get_tree().change_scene_to_file("res://scenes/bug_reports/bug_report.tscn")

func _on_find_friends_pressed():
	get_tree().change_scene_to_file("res://scenes/suggested_users.tscn")


func _on_studyroom_pressed():
	get_tree().change_scene_to_file("res://scenes/study_rooms.tscn")
	



func _on_all_stats_pressed():
	get_tree().change_scene_to_file("res://scenes/all_stats.tscn")
