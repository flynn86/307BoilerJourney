extends Label

# Called when the node enters the scene tree for the first time.
func _ready():
	text = "Total Completion: " + str(Attributes.collectibles) + "/100"


func _on_back_to_menu_button_pressed():
		get_tree().change_scene_to_file("res://scenes/menu.tscn")
