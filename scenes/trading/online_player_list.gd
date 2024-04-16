extends Node2D

# Define an online player as a player who is in the academic scene.
# Define an offline player as otherwise.

var frame_counter : int = 0

func _ready():
	update_player_list()
	
func _process(_delta):
	frame_counter += 1
	if (frame_counter > 30):
		update_player_list()
		frame_counter = 0
	
#func update_player_list():
	#var y_coord = 5.0
	#var player_displays = $OnlinePlayerListPanel/OnlinePlayerListInnerPanel.get_children()
	#for player_display in player_displays:
	#	$OnlinePlayerListPanel/OnlinePlayerListInnerPanel.remove_child(player_display)
	#(Attributes.database).query("SELECT players FROM Online_Players")
	#for player in (Attributes.database).query_result:
	#	var scene = preload("res://scenes/trading/player_display.tscn")
	#	var player_display = scene.instantiate()
	#	player_display.username = player["players"]
	#	player_display.y_coord = y_coord
	#	$OnlinePlayerListPanel/OnlinePlayerListInnerPanel.add_child(player_display)
	#	y_coord += 20.0
	
func update_player_list():
	var y_coord : float = 5.0
	var not_in_string : String = ""
	var player_displays = $OnlinePlayerListPanel/OnlinePlayerListInnerPanel.get_children()
	if (player_displays.size() > 0):
		not_in_string += "("
		for player_display in player_displays:
			(Attributes.database).query("SELECT players FROM Online_Players WHERE players = '"  + player_display.username + "'")
			if ! (Attributes.database).query_result:
				$OnlinePlayerListPanel/OnlinePlayerListInnerPanel.remove_child(player_display)
			else:
				player_display.y_coord = y_coord
				y_coord += 20
				not_in_string += "'" + player_display.username + "',"
		not_in_string = not_in_string.left(not_in_string.length() - 1)
		not_in_string += ")"
		(Attributes.database).query("SELECT players FROM Online_Players WHERE players NOT IN" + not_in_string)
	else:
		(Attributes.database).query("SELECT players FROM Online_Players")
	for player in (Attributes.database).query_result:
		var scene = preload("res://scenes/trading/player_display.tscn")
		var player_display = scene.instantiate()
		player_display.username = player["players"]
		player_display.y_coord = y_coord
		$OnlinePlayerListPanel/OnlinePlayerListInnerPanel.add_child(player_display)
		y_coord += 20.0

func _on_close_pressed():
	visible = false
