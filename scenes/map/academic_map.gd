extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)

func _input(event):
	if event is InputEventMouseMotion or event is InputEventMouseButton:
		# Convert the event's global position to the tilemap's local space.
		var mouse_pos = event.position
		#print("Tile Position: ", mouse_pos)
