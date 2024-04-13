extends Control

var currentUser : String
var friend : String

# Called when the node enters the scene tree for the first time.
func _ready():
	$ColorRect/Username.text = friend


func _on_delete_pressed():
	pass # Replace with function body.
