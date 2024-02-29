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
		$AnimatedSprite2D.play("idle")
	elif curr_state == 2:
		if dir.x == -1:
			$AnimatedSprite2D.play("Jump left")
		if dir.x == 1:
			$AnimatedSprite2D.play("Jump right")
		if dir.y == -1:
			$AnimatedSprite2D.play("Jump forward")
		if dir.y == 1:
			$AnimatedSprite2D.play("Jump back")
		
	if is_roaming:
		match curr_state:
			IDLE:
				pass
			NEW_DIR:
				dir = choose([Vector2.RIGHT, Vector2.UP, Vector2.LEFT, Vector2.DOWN])
			MOVE:
				move(delta)

func choose(array):
	array.shuffle()
	return array.front()

func move(delta):
	position += dir * speed  * delta
	



func _on_timer_timeout():
	$Timer.wait_time = choose([.5, 1, 1.5])
	curr_state = choose([IDLE, NEW_DIR, MOVE])
