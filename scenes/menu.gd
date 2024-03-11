extends Node2D

func _on_view_progress_button_pressed():
	get_tree().change_scene_to_file("res://scenes/progress_page.tscn")

func _on_back_to_map_button_pressed():
	get_tree().change_scene_to_file(Attributes.location)

func _on_back_to_main_menu_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_customize_character_button_pressed():
	get_tree().change_scene_to_file("res://characters/Player.tscn")

const PORT = 5678
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
		enet.create_client(address_entry.text, PORT)

func _on_host_server_button_pressed():
	$Label2.visible = false
	$HostServerButton.visible = false
	$JoinServerButton.visible = false
	$LineEdit.visible = false
	enet.create_server(PORT)
	multiplayer.multiplayer_peer = enet
	multiplayer.peer_connected.connect(add_client)
	multiplayer.peer_disconnected.connect(remove_client)
	add_client(multiplayer.get_unique_id())
	setup_upnp()

func add_client(id):
	pass # Need to Implement
	
func remove_client(id):
	pass # Need to Implement
	
func setup_upnp():
	pass # Need to Implement
