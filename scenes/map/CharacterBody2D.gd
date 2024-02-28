extends CharacterBody2D


@export var move_speed : float = 300
func _ready():
	$Player/ChangeBody.visible = false
	$Player/Continue.visible = false
	$Player/Random.visible = false
	$Player/ChangeEyes.visible = false
	$Player/ChangeOutfit.visible = false
	$Player/ChangeHair.visible = false

func _physics_process(_delta):
	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	
	velocity = input_direction * move_speed
	move_and_slide()
