extends Control

func _ready():
	$pivot/Shield/Label.text = Attributes.rank
	(Attributes.database).query("SELECT xp FROM Players WHERE username = '" + Attributes.username + "'")
	var curXP
	for i in (Attributes.database).query_result:
		curXP = i["xp"]
	if (Attributes.rank == "Senior"):
		$Label2.text = "Remaining XP Until Next Rank: You are the highest rank"
		$ProgressBar.value = 100
	else: 
		$Label2.text = "Remaining XP Until Next Rank: " + str(30 - (curXP % 30)) + ("XP")
		$ProgressBar.value = 100 * (curXP % 30) / 30
	$Label3.text = "Total XP: " + str(curXP)


func _on_close_button_pressed():
	get_tree().change_scene_to_file(Attributes.location)


func _on_leaderboard_button_pressed():
	get_tree().change_scene_to_file("res://scenes/rank_page/leaderboard.tscn")
