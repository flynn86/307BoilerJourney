extends Panel

func _ready():
	if (Attributes.currentRest == "XXX"):
		$Title.text = "Tripple XXX Family Restaurant: Reviews"
		var image_path = "res://images/triple-xxx-drive-in.jpeg"
		var image = load(image_path)
		$TextureRect.texture = image
	elif (Attributes.currentRest == "eleven"):
		$Title.text = "8Eleven Modern Bistro: Reviews"
		var image_path = "res://images/8_eleven.jpeg"
		var image = load(image_path)
		$TextureRect.texture = image
	elif (Attributes.currentRest == "bru"):
		$Title.text = "Bru Burger Bar: Reviews"
		var image_path = "res://images/bru_update.jpeg"
		var image = load(image_path)
		$TextureRect.texture = image
	elif (Attributes.currentRest == "WALC"):
		$Title.text = "Wilmeth Active Learning Center"
		var image_path = "res://location_information/loc_image/%s.jpeg" % Attributes.currentRest
		var image = load(image_path)
		$TextureRect.texture = image
	elif (Attributes.currentRest == "ARMS"):
		$Title.text = "Neil Armstrong Hall of Engineering"
		var image_path = "res://location_information/loc_image/%s.jpeg" % Attributes.currentRest
		var image = load(image_path)
		$TextureRect.texture = image
	elif (Attributes.currentRest == "ELLT"):
		$Title.text = "Elliot Hall of Music"
		var image_path = "res://location_information/loc_image/%s.jpeg" % Attributes.currentRest
		var image = load(image_path)
		$TextureRect.texture = image
	elif (Attributes.currentRest == "PHYS"):
		$Title.text = "Purdue Physics Building"
		var image_path = "res://location_information/loc_image/%s.jpeg" % Attributes.currentRest
		var image = load(image_path)
		$TextureRect.texture = image
	elif (Attributes.currentRest == "WTHR"):
		$Title.text = "Wetherill Hall of Chemistry"
		var image_path = "res://location_information/loc_image/%s.jpeg" % Attributes.currentRest
		var image = load(image_path)
		$TextureRect.texture = image
	elif (Attributes.currentRest == "STEW"):
		$Title.text = "Stewart Center"
		var image_path = "res://location_information/loc_image/%s.jpeg" % Attributes.currentRest
		var image = load(image_path)
		$TextureRect.texture = image
	elif (Attributes.currentRest == "HAMP"):
		$Title.text = "Hampton Hall"
		var image_path = "res://location_information/loc_image/%s.jpeg" % Attributes.currentRest
		var image = load(image_path)
		$TextureRect.texture = image
	else: 
		$Title.text = "Harry's Choclate Shop: Reviews"
		var image_path = "res://images/Harrys.jpeg"
		var image = load(image_path)
		$TextureRect.texture = image
	var data : Array = (Attributes.database).select_rows("%s_review" % Attributes.currentRest, "username != 'null'", ["*"])
	if (Attributes.database).error_message.contains("no such table:"):
		var table = {
		"username" : {"data_type":"text"},
		"description" : {"data_type":"text"},
		"date" : {"data_type":"text"},
		"rating" : {"data_type":"text"}
		}
		(Attributes.database).create_table("%s_review" % Attributes.currentRest, table)
		(Attributes.database).drop_table("%s_review" % Attributes.currentRest)
		(Attributes.database).create_table("%s_review" % Attributes.currentRest, table)
		SaveUtils.save()
	else: 
		var data_line : String = ""
		for i in data.size():
			data_line += "Review From: " + data[i].username + " on " + data[i].date + '\n' + "Description: " + data[i].description + '\n' + "Rating: " + data[i].rating + " Stars" + '\n' + '\n'
		if data.size() == 0:
			data_line = "No Reviews"
		$Reviews.text = data_line
	
func _process(_delta):
	_ready()

func _leave_review_pressed():
	var timedate : Dictionary = Time.get_datetime_dict_from_system()
	var given_r = $LineEdit2.text
	var number = float(given_r)
	var final_val
	if str(number) == given_r and number >= 0 and number <= 5:
		final_val = number
	else:
		final_val = 3
	var data = {
		"username" = Attributes.username,
		"description" = $LineEdit.text,
		"date" = str(timedate.month) + "/" + str(timedate.day) + "/" + str(timedate.year),
		"rating" = str(final_val)
	}
	print(Attributes.currentRest)
	(Attributes.database).insert_row("%s_review" % Attributes.currentRest, data)

func _on_back_to_menu_pressed():
	if Attributes.currentRest == "XXX" ||  Attributes.currentRest == "eleven" ||   Attributes.currentRest == "bru" ||   Attributes.currentRest == "harrys":
		get_tree().change_scene_to_file("res://scenes/restaurant_page/restaurant_page.tscn")
	else: 
		get_tree().change_scene_to_file("res://scenes/location_tab/location_page.tscn")
