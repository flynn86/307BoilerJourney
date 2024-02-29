extends CharacterBody2D


const speed =  30
var curr_state = IDLE

var dir = Vector2.RIGHT
var start_pos

var is_roaming = true

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
	elif curr_state == 2:
		if dir.x == -1:
			$AnimatedSprite2D.play("Walking Left")
		if dir.x == 1:
			$AnimatedSprite2D.play("Walking Right")
		if dir.y == -1:
			$AnimatedSprite2D.play("Walking Forward")
		
	if is_roaming:
		match curr_state:
			IDLE:
				pass
			NEW_DIR:
				dir = choose([Vector2.RIGHT, Vector2.LEFT, Vector2.DOWN])
			MOVE:
				move(delta)

func choose(array):
	array.shuffle()
	return array.front()

func move(delta):
	position += dir * speed  * delta
	

func _on_timer_timeout():
	$Timer.wait_time = choose([1, 2, 5, 10])
	curr_state = choose([IDLE, NEW_DIR, MOVE])
