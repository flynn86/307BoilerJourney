extends NinePatchRect

var username : String
var y_coord : float
var traded : bool

# Called when the node enters the scene tree for the first time.
func _ready():
	$player_username.visible_characters = -1
	$player_username.text = username
	position = Vector2(position.x, y_coord)
	
func _process(_delta):
	position = Vector2(position.x, y_coord)
	if traded == true:
		$trade_button.modulate.a = 0.25
	else:
		$trade_button.modulate.a = 1


func _on_trade_button_pressed():
	$player_username.text = "Traded"
	if traded == false:
		$trade_button.modulate.a = 0.25
		var data = {
			"sender" = Attributes.username,
			"receiver" = username
		}
		(Attributes.database).insert_row("Trade_Requests", data)
		traded = true
