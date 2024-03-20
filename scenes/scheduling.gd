extends Node2D

@export var dropdown_path:NodePath
@onready var dropdown = get_node(dropdown_path)
# Called when the node enters the scene tree for the first time.
var building_list = ["ARMS", "PUSH", "HAMP", "PHYS", "RNPH", "JSN", "FRNY", "DSCB", "MSEE", "CHAS", "BHEE", "AR", "ELLT", 
					"HOVD", "ME", "WALC", "POTR", "LMBS", "KNOY", "DUDL", "HAAS", "PSYC", "PRCE", "CL50", "MATH", "SC", 
					"WTHR", "BRWN", "HEAV", "GRIS", "BRNG", "SCHM", "UNIV", "MTHW", "STON", "STEW", "HIKS", "PMU"]
func _ready():
	add_items()

func add_items():
	for building in building_list:
		dropdown.add_item(building)
