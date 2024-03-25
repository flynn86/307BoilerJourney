extends Node2D

func _on_view_progress_button_pressed():
	get_tree().change_scene_to_file("res://scenes/progress_page.tscn")

func _on_back_to_map_button_pressed():
	get_tree().change_scene_to_file(Attributes.location)

func _on_back_to_main_menu_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_customize_character_button_pressed():
	get_tree().change_scene_to_file("res://characters/Player.tscn")

const PORT = 9999
@onready var address_entry = $LineEdit
var enet = ENetMultiplayerPeer.new()

func _on_join_server_button_pressed():
	if address_entry.text == "":
		$Label2.visible = true
	else:
		$Label2.visible = false
		$HostServerButton.visible = false
		$JoinServerButton.visible = false
		$LineEdit.visible = false
		multiplayer.multiplayer_peer = enet
		#get_tree().change_scene_to_file(Attributes.location)
		enet.create_client("localhost", PORT)
		#enet.create_client(address_entry.text, PORT)

func _on_host_server_button_pressed():
	$Label2.visible = false
	$HostServerButton.visible = false
	$JoinServerButton.visible = false
	$LineEdit.visible = false
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

var player = preload("res://characters/Player.tscn")
func add_client(id):
	var client = player.instantiate()
	add_child(client)
	
func remove_client(id):
	var client = get_node_or_null(str(id))
	if client:
		client.queue_free()


func _on_global_chat_button_pressed():
	get_tree().change_scene_to_file("res://scenes/global_chat.tscn")
