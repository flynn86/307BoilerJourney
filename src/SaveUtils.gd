extends Node

const SAVE_FILENAME = "res://save.bin"
# To be implemented later when player is made
func save():
	var file = FileAccess.open(SAVE_FILENAME, FileAccess.WRITE)
	var save_data: Dictionary = {
		"xp" : Attributes.xp,
		"xposition" : Attributes.xpos,
		"yposition" : Attributes.ypos,
		"hasCollectible" : Attributes.hasCollectible
	}
	var string_data = JSON.stringify(save_data)
	file.store_line(string_data)
	file.close()

# To be implemented later when player is made
func initialize_game():
	var file = FileAccess.open(SAVE_FILENAME, FileAccess.WRITE)
	#var save_data: Dictionary {
	#	"xposition" : 0
	#	"yposition" : 0
	#}
	file.close()

# To be implemented later when player is made
func load():
	var file = FileAccess.open(SAVE_FILENAME, FileAccess.READ)
	if FileAccess.file_exists(SAVE_FILENAME) == true:
		#
		#
		pass
	file.close()

