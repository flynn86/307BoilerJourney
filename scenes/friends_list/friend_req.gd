extends Control

var f_sender : String
var f_recipient : String

# Called when the node enters the scene tree for the first time.
func _ready():
	$ColorRect/Username.text = f_sender


func _on_accept_pressed():
	(Attributes.database).query("DELETE FROM Friend_Reqs WHERE sender = '" + f_sender + "' AND recipient = '" + f_recipient + "'")
	var data1 = {
		"friend1" = f_sender,
		"friend2" = f_recipient
	}
	var data2 = {
		"friend1" = f_recipient,
		"friend2" = f_sender
	}
	(Attributes.database).insert_row("Friend_List", data1)
	(Attributes.database).insert_row("Friend_List", data2)
	self.visible = false
	


func _on_deny_pressed():
	(Attributes.database).query("DELETE FROM Friend_Reqs WHERE sender = '" + f_sender + "' AND recipient = '" + f_recipient + "'")
	self.visible = false
