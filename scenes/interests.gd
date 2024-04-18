extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Panel/nterest1.text = Attributes.interest_1
	$Panel/interest2.text = Attributes.interest_2
	$Panel/interest3.text = Attributes.interest_3
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_interest_1_text_changed():
	Attributes.interest_1 = $Panel/interest1.text
	SaveUtils.save()



func _on_interest_2_text_changed():
	Attributes.interest_2 = $Panel/interest2.text
	SaveUtils.save()



func _on_interest_3_text_changed():
	Attributes.interest_3 = $Panel/interest3.text
	SaveUtils.save()


func _on_save_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
