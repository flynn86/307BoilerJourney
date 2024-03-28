extends Area2D

var collected = false;


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("collect_button").visible = false;



func _on_body_entered(body):
	print(body);
	if body.name == "CharacterBody2D":
		get_node("collect_button").visible = true;
		SaveUtils.save()



func _on_collect_button_pressed():
	Attributes.angry_pete = true;
	Attributes.numCollected += 1;
	#Attributes.items.append(ItemManager.Items.ANGRY_PETE)
	queue_free();
	SaveUtils.save()
	


func _on_body_exited(body):
	print(body);
	if body.name == "CharacterBody2D":
		get_node("collect_button").visible = false;