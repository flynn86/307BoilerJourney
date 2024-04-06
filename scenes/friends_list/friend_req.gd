extends Control

var Username : String

# Called when the node enters the scene tree for the first time.
func _ready():
	$ColorRect/Username.text = Username
