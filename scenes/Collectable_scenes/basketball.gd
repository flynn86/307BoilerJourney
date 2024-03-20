extends Area2D

var collected = false;


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("collect_button").visible = false;



func _on_body_entered(body):
	print(body);
	get_node("collect_button").visible = true;
	SaveUtils.save()



func _on_collect_button_pressed():
	Attributes.basketball = true;
	queue_free();
	SaveUtils.save()
	
	


func _on_body_exited(body):
	print(body);
	get_node("collect_button").visible = false;
