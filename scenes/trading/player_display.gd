extends NinePatchRect

var username : String
var y_coord : float

# Called when the node enters the scene tree for the first time.
func _ready():
	$player_username.visible_characters = -1
	$player_username.text = username
	position = Vector2(position.x, y_coord)
