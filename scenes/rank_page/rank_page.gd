extends Control

func _ready():
	$pivot/Shield/Label.text = Attributes.rank
	$Label2.text = "Remaining XP Until Next Rank: " + str(30 - (Attributes.xp % 30)) + ("XP")
	$ProgressBar.value = (Attributes.xp % 30) / 30

func _on_close_button_pressed():
	get_tree().change_scene_to_file(Attributes.location)
