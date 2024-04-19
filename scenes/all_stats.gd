extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Panel/Label.visible = false
	$Panel/Label2.text = Attributes.rank
	$Panel/Label6.text = Attributes.xp
	$Panel/Label5.text = Attributes.numCollected
	$Panel/Label4.text = Attributes.questsCompleted
	$Panel/Label3.text = 0


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
