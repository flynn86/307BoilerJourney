extends Node2D

@onready var accept_label = get_child(0).get_child(0).get_child(1).get_child(0).get_child(0)
@onready var decline_label = get_child(0).get_child(0).get_child(2).get_child(0).get_child(0)
@onready var question = get_child(0).get_child(0).get_child(0).get_child(0)
var sender_username : String

func _ready():
	visible = false
	accept_label.visible_characters = -1
	decline_label.visible_characters = -1

func _on_close_pressed():
	(Attributes.database).delete_rows("Trade_Requests", "sender = '" + sender_username + "' AND receiver = '" + Attributes.username + "'")
	self.visible = false
	Attributes.trade_req = false
	
func _on_accept_choice_pressed():
	var string1 = sender_username + "_offer"
	var string2 = Attributes.username + "_offer"
	var trade_table = {
		string1 : {"data_type":"text"},
		string2 : {"data_type":"text"},
		"slot" : {"data_type":"int"}
	}
	(Attributes.database).query("DROP TABLE " + sender_username + "AND" + Attributes.username)
	var ret = (Attributes.database).create_table(sender_username + "AND" + Attributes.username, trade_table)
	print(ret)
	for i in range(1, 5, 1):
		var data = {}
		data[string1] = "empty"
		data[string2] = "empty"
		data["slot"] = i
		(Attributes.database).insert_row(sender_username + "AND" + Attributes.username, data)
	(Attributes.database).query("SELECT * FROM " + sender_username + "AND" + Attributes.username)
	print((Attributes.database).query_result)
	(Attributes.database).update_rows("Trade_Requests", "sender = '" + sender_username + "' AND receiver = '" + Attributes.username + "'", {"status": 1})
	Attributes.trade_sender = sender_username
	Attributes.trade_receiver = Attributes.username
	Attributes.location = "res://scenes/map/academic_map.tscn"
	get_tree().change_scene_to_file("res://scenes/trading/trading.tscn")
	Attributes.trade_req = false
	
func send_trade_request(sender : String):
	sender_username = sender
	question.text = sender + " would like to trade items"
	self.visible = true


func _on_decline_choice_pressed():
	(Attributes.database).delete_rows("Trade_Requests", "sender = '" + sender_username + "' AND receiver = '" + Attributes.username + "'")
	self.visible = false
	Attributes.trade_req = false
