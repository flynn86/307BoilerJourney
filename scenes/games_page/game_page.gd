extends Panel

var items = {}
var total_items = {}
var popup

func _ready():
	#OS.shell_open("https://boilerlink.purdue.edu/events")
	$Popup.hide()
	_get_game_info("PMB_info")
	_get_game_info("MF_info")
	_get_game_info("WB_info")
	_get_game_info("WV_info")
	$PMB_bar.connect("text_changed", self._on_PMB_text_changed)
	$WB_bar.connect("text_changed", self._on_WB_text_changed)
	$MF_bar.connect("text_changed", self._on_MF_text_changed)
	$WV_bar.connect("text_changed", self._on_WV_text_changed)

func _get_game_info(file_name: String):
	var text_path = "res://scenes/games_page/%s.txt" % file_name
	if FileAccess.file_exists(text_path):
		var file = FileAccess.open(text_path, FileAccess.READ)
		var text_content = file.get_as_text()
		var lines = text_content.split("\n")
		for line in lines:
			var comma_index = line.find(",")
			if comma_index != -1:
				var name = line.substr(0, comma_index).strip_edges()
				var description = line.substr(comma_index + 1, line.length()).strip_edges()
				items[name] = description
		if file_name == "PMB_info":
			_generate_buttons("PMB")
			total_items.merge(items)
			items = {}
		elif file_name == "WB_info":
			_generate_buttons("WB")
			total_items.merge(items)
			items = {}
		elif file_name == "MF_info":
			_generate_buttons("MF")
			total_items.merge(items)
			items = {}
		else:
			_generate_buttons("WV")
			total_items.merge(items)
			items = {}

func _generate_buttons(cont_name: String):
	var container = get_node("%s_scroll/%s_container" % [cont_name, cont_name]) as VBoxContainer
	
	for name in items.keys():
		var button = Button.new()
		button.text = name
		button.connect("pressed",Callable(self,"_button_pressed").bind(button))
		container.add_child(button)

func _button_pressed(button):
	$Popup/popup_text.text = total_items[button.text]
	$Popup.show()

func _on_WV_text_changed(new_text):
	var container = get_node("WV_scroll/WV_container") as VBoxContainer
	for button in container.get_children():
		if  new_text.is_empty() or new_text.to_lower() in button.text.to_lower():
			button.show()
		else:
			button.hide()

func _on_PMB_text_changed(new_text):
	var container = get_node("PMB_scroll/PMB_container") as VBoxContainer
	for button in container.get_children():
		if new_text.is_empty() or new_text.to_lower() in button.text.to_lower():
			button.show()
		else:
			button.hide()

func _on_WB_text_changed(new_text):
	var container = get_node("WB_scroll/WB_container") as VBoxContainer
	for button in container.get_children():
		if  new_text.is_empty() or new_text.to_lower() in button.text.to_lower():
			button.show()
		else:
			button.hide()

func _on_MF_text_changed(new_text):
	var container = get_node("MF_scroll/MF_container") as VBoxContainer
	for button in container.get_children():
		if  new_text.is_empty() or new_text.to_lower() in button.text.to_lower():
			button.show()
		else:
			button.hide()

func _on_button_pressed():
	$Popup.hide()

func _on_close_button_pressed():
	get_tree().change_scene_to_file("res://scenes/PMU_page/pmu_panel.tscn")
