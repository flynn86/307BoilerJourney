extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Attributes.questsCompleted = (int(Attributes.quest1_completed) + int(Attributes.quest2_completed) + int(Attributes.quest3_completed)
		 + int(Attributes.quest4_completed) + int(Attributes.quest5_completed) + int(Attributes.quest6_completed))
	$Panel/Label.visible = false
	$Panel/Label2.text = Attributes.rank
	$Panel/Label6.text = str(Attributes.xp)
	$Panel/Label5.text = str(Attributes.numCollected)
	$Panel/Label4.text = str(Attributes.questsCompleted)
	$Panel/Label3.text = ""


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_close_pressed():
	$Panel/Label.visible = false
	$Panel/Label/info.text = ""

func _on_current_rank_pressed():
	$Panel/Label.visible = true
	$Panel/Label/info.text = ""



func _on_total_xp_pressed():
	$Panel/Label.visible = true
	$Panel/Label/info.text = ""



func _on_total_collectables_pressed():
	$Panel/Label.visible = true
	$Panel/Label/info.text = ""



func _on_quests_completed_pressed():
	$Panel/Label.visible = true
	$Panel/Label/info.text = ""



func _on_leaderboard_pressed():
	$Panel/Label.visible = true
	$Panel/Label/info.text = ""


func _on_back_pressed():
	get_tree().change_scene_to_file(Attributes.location)
