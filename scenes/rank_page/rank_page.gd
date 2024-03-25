extends Control

func _ready():
	$pivot/Shield/Label.text = Attributes.rank
	$Label2.text = "Remaining XP Until Next Rank: " + str(30 - Attributes.xp) + ("XP")
	$ProgressBar.value = Attributes.xp

func _on_close_button_pressed():
	get_tree().change_scene_to_file(Attributes.location)
