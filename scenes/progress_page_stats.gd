extends Label

# Called when the node enters the scene tree for the first time.
func _ready():
	text = "Total Completion: " + str(int(Attributes.collectibleA) + int(Attributes.collectibleH)) + "/2"

func _on_back_to_menu_button_pressed():
	pass # Replace with function body.
