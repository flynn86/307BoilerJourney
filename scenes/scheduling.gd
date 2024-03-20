extends Node2D

@export var dropdown_path:NodePath
@onready var dropdown = get_node(dropdown_path)
# Called when the node enters the scene tree for the first time.
var building_list = ["ARMS", "PUSH", "HAMP", "PHYS", "RNPH", "JSN", "FRNY", "DSCB", "MSEE", "CHAS", "BHEE", "AR", "ELLT", 
					"HOVD", "ME", "WALC", "POTR", "LMBS", "KNOY", "DUDL", "HAAS", "PSYC", "PRCE", "CL50", "MATH", "SC", 
					"WTHR", "BRWN", "HEAV", "GRIS", "BRNG", "SCHM", "UNIV", "MTHW", "STON", "STEW", "HIKS", "PMU", "OTHER"]
func _ready():
	add_items()

func add_items():
	for building in building_list:
		dropdown.add_item(building)


func _on_course_name_text_changed():
	pass # Replace with function body.


func _on_course_time_text_changed():
	pass # Replace with function body.


func _on_monday_pressed():
	pass # Replace with function body.


func _on_tuesday_pressed():
	pass # Replace with function body.


func _on_wednesday_pressed():
	pass # Replace with function body.


func _on_thursday_pressed():
	pass # Replace with function body.


func _on_friday_pressed():
	pass # Replace with function body.


func _on_submit_pressed():
	pass # Replace with function body.
