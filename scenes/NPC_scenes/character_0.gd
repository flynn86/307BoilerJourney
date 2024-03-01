extends CharacterBody2D


const speed =  30
var curr_state = IDLE

var dir = Vector2.RIGHT
var start_pos

var is_roaming = true
var is_chatting = false

var player
var player_in_chat_zone

enum {
	IDLE,
	NEW_DIR,
	MOVE
}

func _ready():
	randomize()
	start_pos = position
func _process(delta):
	if curr_state == 0 or curr_state == 1:
		$AnimatedSprite2D.play("Idle")
	elif curr_state == 2 and !is_chatting:
		if dir.x == -1:
			$AnimatedSprite2D.play("Walking Left")
		if dir.x == 1:
			$AnimatedSprite2D.play("Walking Right")
		if dir.y == 1:
			$AnimatedSprite2D.play("Walking Forward")
		
	if is_roaming:
		match curr_state:
			IDLE:
				pass
			NEW_DIR:
				dir = choose([Vector2.RIGHT, Vector2.LEFT, Vector2.DOWN])
			MOVE:
				move(delta)
	if Input.is_action_just_pressed("chat"):
		print("chatting")
		$dialogue_character_0.start()
		is_roaming = false
		is_chatting = true
		$AnimatedSprite2D.play("Idle")

func choose(array):
	array.shuffle()
	return array.front()

func move(delta):
	if !is_chatting:
		position += dir * speed  * delta
		

func _on_timer_timeout():
	$Timer.wait_time = choose([1, 2, 5, 10])
	curr_state = choose([IDLE, NEW_DIR, MOVE])

func _on_chat_detection_area_body_entered(body):
	if body.has_method("Player"):
		player = body
		player_in_chat_zone = true
	



func _on_chat_detection_area_body_exited(body):
	if body.has_method("Player"):
		player_in_chat_zone = false



func _on_dialogue_character_0_dialogue_finished():
	is_chatting = false
	is_roaming = true
