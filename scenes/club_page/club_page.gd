extends Panel

var items = {}
var popup

func _ready():
	#OS.shell_open("https://boilerlink.purdue.edu/events")
	_get_club_info("sport_info")
	_get_club_info("frat_info")
	_get_club_info("sor_info")
	_get_club_info("other_info")
	$sport_bar.connect("text_changed", self._on_sport_text_changed)
	$other_bar.connect("text_changed", self._on_academic_text_changed)
	$sor_bar.connect("text_changed", self._on_sor_text_changed)
	$frat_bar.connect("text_changed", self._on_frat_text_changed)

func _get_club_info(file_name: String):
	var text_path = "res://scenes/club_page/%s.txt" % file_name
	if FileAccess.file_exists(text_path):
		var file = FileAccess.open(text_path, FileAccess.READ)
		var text_content = file.get_as_text()
		var lines = text_content.split("\n")
		for line in lines:
			var split_line = line.split(":")
			if split_line.size() >= 2:
				var name = split_line[0].strip_edges()
				var description = split_line[1].strip_edges()
				items[name] = description
		if file_name == "sport_info":
			_generate_buttons("sport")
			items = {}
		elif file_name == "other_info":
			_generate_buttons("academic")
			items = {}
		elif file_name == "sor_info":
			_generate_buttons("sor")
			items = {}
		else:
			_generate_buttons("frat")
			items = {}

func _generate_buttons(cont_name: String):
	var container = get_node("%s_scroll/%s_container" % [cont_name, cont_name]) as VBoxContainer
	
	for name in items.keys():
		var button = Button.new()
		button.text = name
		button.connect("pressed", self._button_pressed)
		container.add_child(button)

func _button_pressed():
	print("hello")

func _on_academic_text_changed(new_text):
	var container = get_node("academic_scroll/academic_container") as VBoxContainer
	for button in container.get_children():
		if  new_text.is_empty() or new_text.to_lower() in button.text.to_lower():
			button.show()
		else:
			button.hide()

func _on_sport_text_changed(new_text):
	var container = get_node("sport_scroll/sport_container") as VBoxContainer
	for button in container.get_children():
		if new_text.is_empty() or new_text.to_lower() in button.text.to_lower():
			button.show()
		else:
			button.hide()

func _on_sor_text_changed(new_text):
	var container = get_node("sor_scroll/sor_container") as VBoxContainer
	for button in container.get_children():
		if  new_text.is_empty() or new_text.to_lower() in button.text.to_lower():
			button.show()
		else:
			button.hide()

func _on_frat_text_changed(new_text):
	var container = get_node("frat_scroll/frat_container") as VBoxContainer
	for button in container.get_children():
		if  new_text.is_empty() or new_text.to_lower() in button.text.to_lower():
			button.show()
		else:
			button.hide()
