extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Attributes.questsCompleted = (int(Attributes.quest1_completed) + int(Attributes.quest2_completed) + int(Attributes.quest3_completed)
		 + int(Attributes.quest4_completed) + int(Attributes.quest5_completed) + int(Attributes.quest6_completed))
	var count = 1
	(Attributes.database).query("SELECT username,xp FROM Players ORDER BY xp DESC")
	for i in (Attributes.database).query_result:
		if (str(i["username"]) == Attributes.username):
			break
		count += 1
	
	$Panel/Label.visible = false
	$Panel/Label2.text = Attributes.rank
	$Panel/Label6.text = str(Attributes.xp)
	$Panel/Label5.text = str(Attributes.numCollected)
	$Panel/Label4.text = str(Attributes.questsCompleted)
	$Panel/Label3.text = str(count)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_close_pressed():
	$Panel/Label.visible = false

func _on_current_rank_pressed():
	$Panel/Label.visible = true
	$Panel/Label/info.text = "Your rank tell you your current standing in a game as a 'Freshman', 'Sophomore', 'Junior', or 'Senior' depending on the amount of xp you have gathered at this point"


func _on_total_xp_pressed():
	$Panel/Label.visible = true
	$Panel/Label/info.text = "This indicates the total xp you have accumulated throught you time playing the game by things such as collecting collectables, completing quests and correctly answering daily trivia"



func _on_total_collectables_pressed():
	$Panel/Label.visible = true
	$Panel/Label/info.text = "This indicates the total number of collectables you have collected at this point of the game"



func _on_quests_completed_pressed():
	$Panel/Label.visible = true
	$Panel/Label/info.text = "This tells you the total number of quests you have completed at this point of the game"



func _on_leaderboard_pressed():
	$Panel/Label.visible = true
	$Panel/Label/info.text = "Your leaderboard ranking tells you where you stand compared to other users playing this game depending sorted by xp"


func _on_back_pressed():
	get_tree().change_scene_to_file(Attributes.location)
