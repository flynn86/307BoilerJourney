extends Node2D


func _ready():
	#var data : Array = (Attributes.database).select_rows("%s_Chat" % Attributes.gc_temp, "username != 'null'", ["*"])
	#var data_line : String = ""
	#for i in data.size():
	#	data_line += "From " + data[i].username + " at " + data[i].time + " on " + data[i].date + ": " + data[i].message + '\n'
	#$Label.text = data_line
	pass


func _process(_delta):
	_ready()

func _on_back_to_menu_pressed():
	pass # Replace with function body.


func _on_send_message_pressed():
	pass # Replace with function body.
