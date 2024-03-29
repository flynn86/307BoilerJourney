extends Control

func _ready():
	(Attributes.database).query("SELECT username,xp FROM Players ORDER BY xp DESC LIMIT 5")
	var count = 0
	for i in (Attributes.database).query_result:
		if (count == 0):
			$First.text = "1.  " + str(i["username"]) + "         " + str(i["xp"]) + " XP"
		if (count == 1):
			$Second.text = "2.  " + str(i["username"]) + "         " + str(i["xp"]) + " XP"
		if (count == 2):
			$Third.text = "3.  " + str(i["username"]) + "         " + str(i["xp"]) + " XP"
		if (count == 3):
			$Fourth.text = "4.  " + str(i["username"]) + "         " + str(i["xp"]) + " XP"
		if (count == 4):
			$Fifth.text = "5.  " + str(i["username"]) + "         " + str(i["xp"]) + " XP"
		count += 1

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://scenes/rank_page/rank_page.tscn")
