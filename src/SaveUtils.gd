extends Node

func save():
	var file = FileAccess.open(Attributes.filename, FileAccess.WRITE)
	var save_data: Dictionary = {
		"xp" : Attributes.xp,
		"xhousing" : Attributes.xhousing,
		"yhousing" : Attributes.yhousing,
		"xacademic" : Attributes.xacademic,
		"yacademic" : Attributes.yacademic,
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


func load():
	if FileAccess.file_exists(Attributes.filename):
		var file = FileAccess.open(Attributes.filename, FileAccess.READ)
		var line = JSON.parse_string(file.get_line())
		if line:
			Attributes.xp = line["xp"]
			Attributes.xhousing = line["xhousing"]
			Attributes.yhousing = line["yhousing"]
			Attributes.xacademic = line["xacademic"]
			Attributes.yacademic = line["yacademic"]
			Attributes.location = line["location"]
			Attributes.collectibles = line["collectibles"]
			Attributes.curr_hair = line["hair"]
			Attributes.curr_body = line["body"]
			Attributes.curr_eyes = line["eyes"]
			Attributes.curr_outfit = line["outfit"]
			Attributes.filename = line["filename"]
		file.close()
