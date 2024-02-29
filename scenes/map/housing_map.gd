extends Node2D

func _ready():
	var text_path1 = "res://scenes/map/char_pos_house.txt"
	if FileAccess.file_exists(text_path1):
		var file = FileAccess.open(text_path1, FileAccess.READ)
		var position_string = file.get_line()
		var position_xy = position_string.split(",")
		if position_xy.size() != 2:
			var x = float(256)
			var y = float(256)
			var position = Vector2(x, y)
			$CharacterBody2D.global_position = position
		else:
			var x = float(position_xy[0])
			var y = float(position_xy[1])
			var position = Vector2(x, y)
			$CharacterBody2D.global_position = position
	else: 
		var x = float(256)
		var y = float(256)
		var position = Vector2(x, y)
		$CharacterBody2D.global_position = position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_return_button_pressed():
	var text_path1 = "res://scenes/map/char_pos_house.txt"
	if FileAccess.file_exists(text_path1):
		var file = FileAccess.open(text_path1, FileAccess.WRITE)
		var position_string = str($CharacterBody2D.global_position.x) + ", " + str($CharacterBody2D.global_position.y)
		file.store_string(position_string)
		file.close()
		get_tree().change_scene_to_file("res://scenes/map/academic_map.tscn")
