extends Control

func _ready():
	$pivot/Shield/Label.text = Attributes.rank
	if (Attributes.rank == "Senior"):
		$Label2.text = "Remaining XP Until Next Rank: You are the highest rank"
		$ProgressBar.value = 100
	else: 
		$Label2.text = "Remaining XP Until Next Rank: " + str(30 - (Attributes.xp % 30)) + ("XP")
		$ProgressBar.value = 100 * (Attributes.xp % 30) / 30
	$Label3.text = "Total XP: " + str(Attributes.xp)


func _on_close_button_pressed():
	get_tree().change_scene_to_file(Attributes.location)


func _on_leaderboard_button_pressed():
	get_tree().change_scene_to_file("res://scenes/rank_page/leaderboard.tscn")
