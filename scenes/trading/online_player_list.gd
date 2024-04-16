extends Node2D

# Define an online player as a player who is in the academic scene.
# Define an offline player as otherwise.

func _ready():
	update_player_list()
	
func _process(_delta):
	await get_tree().create_timer(0.5).timeout
	update_player_list()
	
func update_player_list():
	var player_displays = $OnlinePlayerListPanel/OnlinePlayerListInnerPanel.get_children()
	for player_display in player_displays:
		$OnlinePlayerListPanel/OnlinePlayerListInnerPanel.remove_child(player_display)
	#(Attributes.database).query("DELETE FROM Online_Players")
	#var data = {
		#"players" = Attributes.username
	#}
	#(Attributes.database).insert_row("Online_Players", data)
	var y_coord = 5.0
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
