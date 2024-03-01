extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	connect_area2d_signals()

func connect_area2d_signals():
	# Obtain references to Area2D nodes representing buildings
	var building1 = get_node("STEW_area")
	# Add more buildings as needed...

	# Connect the body_entered signals of buildings to update_location_name function of AnimatedText
	#building1.connect("body_entered", self, '_play_animation')
	# Connect more buildings as needed...

func play_animation(body):
	print('show text')
