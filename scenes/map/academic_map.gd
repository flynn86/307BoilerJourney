extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)

func _input(event):
	if event is InputEventMouseMotion or event is InputEventMouseButton:
		# Convert the event's global position to the tilemap's local space.
		var mouse_pos = event.position

func _on_Area2D_input_event(viewport, event, shape_idx, build_name: String):
	if event is InputEventScreenTouch and event.pressed:
		open_location_tab(build_name)
	elif event is InputEventMouseButton and event.pressed:
		open_location_tab(build_name)

func open_location_tab(building_name: String):
	var text_path = "res://location_information/loc_text/DISPLAY_NAME.txt"
	if FileAccess.file_exists(text_path):
		var file = FileAccess.open(text_path, FileAccess.WRITE)
		file.store_string(building_name)
		file.close()
	get_tree().change_scene_to_file("res://scenes/location_tab/location_page.tscn")
	
func _on_panel_closed():
	self.visible = true
