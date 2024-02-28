extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)

func _input(event):
	if event is InputEventMouseMotion or event is InputEventMouseButton:
		# Convert the event's global position to the tilemap's local space.
		var mouse_pos = event.position

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch and event.pressed:
		var building_name = get_name().replace("_area", "")
		open_location_tab(building_name)

func open_location_tab(building_name: String):
	self.visible = false
	var scene = load("res://scenes/location_tab/location_page.tscn")
	var scene_instance = scene.instance()
	scene_instance.initialize_with_name(building_name)
	scene_instance.connect("panel_closed", self, "_on_panel_closed")
	get_tree().get_root().add_child(scene_instance)
	
func _on_panel_closed():
	self.visible = true
