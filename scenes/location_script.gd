extends Panel

func display_content(name: String) -> void:

	var name_label = get_node("location_name") as RichTextLabel
	var picture = get_node("location_picture") as TextureRect
	var info_text = get_node("location_information") as RichTextLabel 
	
	if (name == "WALC"):
		name_label.text = "Wilmeth Active Learning Center"
	elif (name == "ARMS"):
		name_label.text = "Neil Armstrong Hall of Engineering"
	else:
		name_label.text = name
	
	# Load and display the picture
	var image_path = "res://location_information/loc_image/%s.jpeg" % name
	var image = load(image_path)
	if image:
		picture.texture = image
		picture.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		picture.expand = true
	else:
		print("Image not found: %s" % image_path)
	
	# Load and display the text
	var text_path = "res://location_information/loc_text/%s.txt" % name
	if FileAccess.file_exists(text_path):
		var file = FileAccess.open(text_path, FileAccess.READ)
		var text_content = file.get_as_text()
		info_text.text = text_content
		file.close()
	else:
		print("Text file not found: %s" % text_path)

func _ready():
	display_content("WALC")

