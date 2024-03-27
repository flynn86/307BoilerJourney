extends Area2D

var collected = false;


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("collect_button").visible = false;



func _on_body_entered(body):
	if body.name == "CharacterBody2D":
		get_node("collect_button").visible = true;
		SaveUtils.save()



func _on_collect_button_pressed():
	Attributes.iu_poster = true;
	Attributes.numCollected += 1;
	Attributes.items.append(ItemManager.Items.IU_SUCKS_POSTER)
	queue_free();
	SaveUtils.save()
	


func _on_body_exited(body):
	if body.name == "CharacterBody2D":
		get_node("collect_button").visible = false;
