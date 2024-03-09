extends Node

func save():
	var file = FileAccess.open(Attributes.filename, FileAccess.WRITE)
	var save_data: Dictionary = {
		#"xp" : Attributes.xp,
		"username" : Attributes.username,
		"xhousing" : Attributes.xhousing,
		"yhousing" : Attributes.yhousing,
		"xacademic" : Attributes.xacademic,
		"yacademic" : Attributes.yacademic,
		"location" : Attributes.location,
		"collectibleA" : Attributes.collectibleA,
		"collectibleH" : Attributes.collectibleH,
		"hair" : Attributes.curr_hair,
		"body" : Attributes.curr_body,
		"eyes" : Attributes.curr_eyes,
		"outfit" : Attributes.curr_outfit,
		"filename" : Attributes.filename,
		"season" : Attributes.season,
		"isNight" : Attributes.night
	}
	var string_data = JSON.stringify(save_data)
	file.store_line(string_data)
	file.close()


func load(savefile: String):
	if FileAccess.file_exists(savefile):
		var file = FileAccess.open(savefile, FileAccess.READ)
		var line = JSON.parse_string(file.get_line())
		if line:
			#Attributes.xp = line["xp"]
			Attributes.username = line["username"]
			Attributes.xhousing = line["xhousing"]
			Attributes.yhousing = line["yhousing"]
			Attributes.xacademic = line["xacademic"]
			Attributes.yacademic = line["yacademic"]
			Attributes.location = line["location"]
			Attributes.collectibleA = line["collectibleA"]
			Attributes.collectibleH = line["collectibleH"]
			Attributes.curr_hair = line["hair"]
			Attributes.curr_body = line["body"]
			Attributes.curr_eyes = line["eyes"]
			Attributes.curr_outfit = line["outfit"]
			Attributes.filename = savefile
			Attributes.season = line["season"]
			Attributes.night = line["isNight"]
		file.close()

func delete(savefile: String):
	if FileAccess.file_exists(savefile):
		FileAccess.open(savefile, FileAccess.WRITE)
