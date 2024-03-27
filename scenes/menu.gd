extends Node2D

func _on_view_progress_button_pressed():
	get_tree().change_scene_to_file("res://scenes/progress_page.tscn")

func _on_back_to_map_button_pressed():
	get_tree().change_scene_to_file(Attributes.location)

func _on_back_to_main_menu_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_customize_character_button_pressed():
	get_tree().change_scene_to_file("res://characters/Player.tscn")

<<<<<<< HEAD
func _ready():
	if (Attributes.serverName != ""):
		$HostServerButton.visible = false
		$JoinServerButton.visible = false
		$LineEdit.visible = false
		$GlobalChatButton.visible = true
		$ServerRosterButton.visible = true
#	multiplayer.peer_connected.connect(add_client)
#	multiplayer.peer_disconnected.connect(remove_client)

#func _process(_delta):
	#if serverOn:
	#	enet.poll()

#const PORT = 9999

=======
const PORT = 9999
>>>>>>> parent of 306e1de (Rewrote the code to utilize Attributes script)
@onready var address_entry = $LineEdit
#var enet = ENetMultiplayerPeer.new()
#var serverOn : bool = false;

func _on_join_server_button_pressed():
	if address_entry.text == "":
		$Label2.visible = true
	else:
		$Label2.visible = false
		$HostServerButton.visible = false
		$JoinServerButton.visible = false
		$LineEdit.visible = false
<<<<<<< HEAD
		$GlobalChatButton.visible = true
		$ServerRosterButton.visible = true
		#multiplayer.multiplayer_peer = enet
		#if enet.create_client("127.0.0.1", PORT):
		#	print("Error Client")
		#else:
		#	print("Client good")
		#enet.create_client(address_entry.text, PORT)
		Attributes.isServer = false
		Attributes.serverName = address_entry.text
		var data = {
			"username" = Attributes.username,
			"isHost" = Attributes.isServer
		}
		(Attributes.database).insert_row(Attributes.serverName, data)
		SaveUtils.save()
=======
		multiplayer.multiplayer_peer = enet
		#get_tree().change_scene_to_file(Attributes.location)
		enet.create_client("localhost", PORT)
		#enet.create_client(address_entry.text, PORT)
>>>>>>> parent of 306e1de (Rewrote the code to utilize Attributes script)

func _on_host_server_button_pressed():
	$Label2.visible = false
	$HostServerButton.visible = false
	$JoinServerButton.visible = false
	$GlobalChatButton.visible = true
	$ServerRosterButton.visible = true
	$LineEdit.visible = false
<<<<<<< HEAD
	#if enet.create_server(PORT):
	#	print("Error Host")
	#else:
	#	print("Host good")
	#multiplayer.multiplayer_peer = enet
	#serverOn = true
	#add_client(multiplayer.get_unique_id())
	Attributes.isServer = true
	Attributes.serverName = Attributes.username
	var table = {
		"username" : {"data_type":"text"},
		"isHost" : {"data_type":"bool"}
	}
	var data = {
		"username" = Attributes.username,
		"isHost" = Attributes.isServer
	}
	(Attributes.database).create_table(Attributes.serverName, table)
	(Attributes.database).drop_table(Attributes.serverName)
	(Attributes.database).create_table(Attributes.serverName, table)
	
	(Attributes.database).insert_row(Attributes.serverName, data)
	table = {
		"username" : {"data_type":"text"},
		"message" : {"data_type":"text"},
		"time" : {"data_type":"text"},
		"date" : {"data_type":"text"}
	}
	(Attributes.database).create_table("%s_Chat" % Attributes.serverName, table)
	(Attributes.database).drop_table("%s_Chat" % Attributes.serverName)
	(Attributes.database).create_table("%s_Chat" % Attributes.serverName, table)
	SaveUtils.save()
=======
	enet.create_server(PORT)
	multiplayer.multiplayer_peer = enet
	multiplayer.peer_connected.connect(add_client)
	multiplayer.peer_disconnected.connect(remove_client)
	#get_tree().change_scene_to_file(Attributes.location)
	#add_client(multiplayer.get_unique_id())
	
	#var upnp = UPNP.new()
	#var discover_status = upnp.discover()
	#assert(discover_status == UPNP.UPNP_RESULT_SUCCESS, "Discover Failed with Error %s" % discover_status)
	#assert(upnp.get_gateway() and upnp.get_gateway().is_valid_gateway(), "UPNP Invalid Gateway!")
	#var port_status = upnp.add_port_mapping(PORT)
	#assert(port_status == UPNP.UPNP_RESULT_SUCCESS, "Port Mapping Failed with Error %s" % port_status)
	#$Label3.text.set_text("Join Address: %s" % upnp.query_external_address())
>>>>>>> parent of 306e1de (Rewrote the code to utilize Attributes script)


#var player = preload("res://characters/Player.tscn")
#func add_client(id):
#	print("client connected " + str(id))
#	var client = player.instantiate()
#	add_child(client)
	
<<<<<<< HEAD
#func remove_client(id):
#	print("client disconnected " + str(id))
#	var client = get_node_or_null(str(id))
#	if client:
#		client.queue_free()

func _on_global_chat_button_pressed():
	get_tree().change_scene_to_file("res://scenes/global_chat.tscn")

func _on_server_roster_button_pressed():
	get_tree().change_scene_to_file("res://scenes/server_roster.tscn")
=======
func remove_client(id):
	var client = get_node_or_null(str(id))
	if client:
		client.queue_free()


func _on_global_chat_button_pressed():
	get_tree().change_scene_to_file("res://scenes/global_chat.tscn")
>>>>>>> parent of 306e1de (Rewrote the code to utilize Attributes script)
