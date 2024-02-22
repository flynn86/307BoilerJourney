extends Panel

var items = {}
# Called when the node enters the scene tree for the first time.
func _ready():
	#OS.shell_open("https://boilerlink.purdue.edu/events")
	_get_club_info()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func _get_club_info():
	var text_path = "res://scenes/club_page/club_info.txt"
	if FileAccess.file_exists(text_path):
		var file = FileAccess.open(text_path, FileAccess.READ)
		var text_content = file.get_as_text()
		var lines = text_content.split("\n")
		for line in lines:
			var split_line = line.split(":")  # Assuming the format is 'name:description'
			if split_line.size() >= 2:
				var name = split_line[0].strip_edges()
				var description = split_line[1].strip_edges()
				items[name] = description

func _clean_items():
	var cleaned_items = {}
	for key in items:
		print(key)
		var cleaned_key = key.replace("\\", "")
		print(cleaned_key)
		var cleaned_value = items[key].replace("\\", "")
		cleaned_items[cleaned_key] = cleaned_value
