extends Control

var currentUser : String
var friend : String

# Called when the node enters the scene tree for the first time.
func _ready():
	$ColorRect/Username.text = friend


func _on_delete_pressed():
	(Attributes.database).delete_rows("Friend_List", "friend1 = '" + currentUser + "' AND friend2 = '" + friend + "'")
	(Attributes.database).delete_rows("Friend_List", "friend2 = '" + currentUser + "' AND friend1 = '" + friend + "'")
	Attributes.friends_list_changed = true
