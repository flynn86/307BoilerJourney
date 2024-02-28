extends Node

const SAVE_FILENAME = "res://save.bin"

func save():
	var file = FileAccess.open(SAVE_FILENAME, FileAccess.WRITE)
	var save_data: Dictionary = {
		"xp" : Attributes.xp,
		"xposition" : Attributes.xpos,
		"yposition" : Attributes.ypos,
		"location" : Attributes.location,
		"collectibles" : Attributes.collectibles,
		"hair" : Attributes.curr_hair,
		"body" : Attributes.curr_body,
		"eyes" : Attributes.curr_eyes,
		"outfit" : Attributes.curr_outfit,
		"filename" : Attributes.filename
	}
	var string_data = JSON.stringify(save_data)
	file.store_line(string_data)
	file.close()

#func initialize_game():
#	var file = FileAccess.open(SAVE_FILENAME, FileAccess.WRITE)
#	var save_data: Dictionary = {
#		"xp" : 0,
#		"xposition" : 0,
#		"yposition" : 0,
#		"location" : Attributes.Location.ACADEMIC,
#		"collectibles" : 0
#	}
#	var string_data = JSON.stringify(save_data)
#	file.store_line(string_data)
#	file.close()

func load():
	var file = FileAccess.open(SAVE_FILENAME, FileAccess.READ)
	if FileAccess.file_exists(SAVE_FILENAME) == true:
		if not file.eof_reached:
			var line = JSON.parse_string(file.get_line())
			if line:
				Attributes.xp = line["xp"]
				Attributes.xpos = line["xposition"]
				Attributes.ypos = line["yposition"]
				Attributes.location = line["location"]
				Attributes.collectibles = line["collectibles"]
				Attributes.curr_hair = line["hair"]
				Attributes.curr_body = line["body"]
				Attributes.curr_eyes = line["eyes"]
				Attributes.curr_outfit = line["outfit"]
	file.close()

