extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("collect_button").visible = false;
	pass # Replace with function body.




func _on_body_entered(body):
	print(body);
	get_node("collect_button").visible = true;



func _on_collect_button_pressed():
	queue_free();
	


func _on_body_exited(body):
	print(body);
	get_node("collect_button").visible = false;
