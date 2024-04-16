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
	visible = false
	
func _on_accept_choice_pressed():
	var trade_table = {
		Attributes.username + "_offer" : {"data_type":"text"},
		sender_username + "_offer" : {"data_type":"text"}
	}
	(Attributes.database).create_table(Attributes.username + "AND" + sender_username, trade_table)
	var trade_table2 = {
		sender_username + "_offer" : {"data_type":"text"},
		Attributes.username + "_offer" : {"data_type":"text"},
	}
	(Attributes.database).create_table(sender_username + "AND" + Attributes.username, trade_table)
	(Attributes.database).update_rows("Trade_Requests", "sender = '" + sender_username + "' AND receiver = '" + Attributes.username + "'", {"status": 1})
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
