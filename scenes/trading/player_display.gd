extends NinePatchRect

var username : String
var y_coord : float
var traded : bool
var frame_counter : int

# Called when the node enters the scene tree for the first time.
func _ready():
	$player_username.visible_characters = -1
	$player_username.text = username
	
func _process(_delta):
	frame_counter += 1
	if (frame_counter > 30):
		update_trade_button()
		frame_counter = 0
	

func update_trade_button():
	position = Vector2(position.x, y_coord)
	(Attributes.database).query("SELECT * FROM Trade_Requests WHERE sender = '" + Attributes.username + "'" + " AND receiver = '" + username + "'")
	if ! (Attributes.database).query_result:
		traded = false
		$trade_button.modulate.a = 1
	else:
		traded = true
		$trade_button.modulate.a = 0.25
		

func _on_trade_button_pressed():
	if traded == false:
		$trade_button.modulate.a = 0.25
		var data = {
			"sender" = Attributes.username,
			"receiver" = username,
			"status" = 0 # 0 for pending, 1 for in_trade
		}
		(Attributes.database).insert_row("Trade_Requests", data)
		traded = true
