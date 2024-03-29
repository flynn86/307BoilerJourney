extends CharacterBody2D


@export var move_speed : float = 300
func _ready():
	
	$Player/ChangeBody.visible = false
	$Player/Continue.visible = false
	$Player/Random.visible = false
	$Player/ChangeEyes.visible = false
	$Player/ChangeOutfit.visible = false
	$Player/ChangeHair.visible = false
	add_to_group("player")
	'''
	const composite_sprites = preload("res://characters/assets/CompositeSprites.gd")
	
	self.texture = load(composite_sprites.body_spritesheet[Attributes.curr_body])
	self.vframes = 20
	self.hframes = 58

	var walkAnimation = Animation.new()
	walkAnimation.add_track(0)
	walkAnimation.length = 0.8

	var path = String(self.get_path()) + ":frame"
	walkAnimation.track_set_path(0, path)
	walkAnimation.track_insert_key(0, 0.0, 116)
	walkAnimation.track_insert_key(0, 0.2, 117)
	walkAnimation.track_insert_key(0, 0.4, 118)
	walkAnimation.track_insert_key(0, 0.6, 119)
	walkAnimation.track_insert_key(0, 0.8, 120)
	walkAnimation.track_insert_key(0, 1.0, 121)
	
	walkAnimation.value_track_set_update_mode(0, Animation.UPDATE_DISCRETE)
	walkAnimation.loop = 1

	var aPlayer = AnimationPlayer.new()
	aPlayer.addChild
	aPlayer.add_animation("walk", walkAnimation)
	aPlayer.set_current_animation("walk")
	'''

func _on_eyes_frame_changed():
	_sync_frames($Player/CompositeSprites/Eyes.frame)
func _sync_frames(frame):
	$Player/CompositeSprites/Body.frame = frame
	$Player/CompositeSprites/Hairstyles.frame = frame
	$Player/CompositeSprites/Outfit.frame = frame
	

func _physics_process(_delta):
	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	if ((Input.get_action_strength("right") - Input.get_action_strength("left")) < 0):
		$Player/CompositeSprites/Body.frame = 2
		$Player/CompositeSprites/Hairstyles.frame = 2
		$Player/CompositeSprites/Eyes.frame = 2
		$Player/CompositeSprites/Outfit.frame = 2
	elif ((Input.get_action_strength("right") - Input.get_action_strength("left")) > 0):
		$Player/CompositeSprites/Body.frame = 0
		$Player/CompositeSprites/Hairstyles.frame = 0
		$Player/CompositeSprites/Eyes.frame = 0
		$Player/CompositeSprites/Outfit.frame = 0
	elif ((Input.get_action_strength("down") - Input.get_action_strength("up")) > 0):
		$Player/CompositeSprites/Body.frame = 3
		$Player/CompositeSprites/Hairstyles.frame = 3
		$Player/CompositeSprites/Eyes.frame = 3
		$Player/CompositeSprites/Outfit.frame = 3
	elif ((Input.get_action_strength("down") - Input.get_action_strength("up")) < 0):
		$Player/CompositeSprites/Body.frame = 1
		$Player/CompositeSprites/Hairstyles.frame = 1
		$Player/CompositeSprites/Eyes.frame = 1
		$Player/CompositeSprites/Outfit.frame = 1
	else:
		pass
	'''
	$Player/CompositeSprites/Body.frame = $Player/CompositeSprites/Body.frame + 116
	$Player/CompositeSprites/Hairstyles.frame = $Player/CompositeSprites/Hairstyles.frame + 116
	$Player/CompositeSprites/Eyes.frame = $Player/CompositeSprites/Eyes.frame + 116
	$Player/CompositeSprites/Outfit.frame = $Player/CompositeSprites/Outfit.frame + 116
	while ((Input.get_action_strength("right") - Input.get_action_strength("left")) > 0):
		if (($Player/CompositeSprites/Body.frame) == 121):
			$Player/CompositeSprites/Body.frame = 116
			$Player/CompositeSprites/Hairstyles.frame = 116
			$Player/CompositeSprites/Eyes.frame = 116
			$Player/CompositeSprites/Outfit.frame = 116
		else:
			$Player/CompositeSprites/Body.frame = $Player/CompositeSprites/Body.frame + 1
			$Player/CompositeSprites/Hairstyles.frame = $Player/CompositeSprites/Hairstyles.frame + 1
			$Player/CompositeSprites/Eyes.frame = $Player/CompositeSprites/Eyes.frame + 1
			$Player/CompositeSprites/Outfit.frame = $Player/CompositeSprites/Outfit.frame + 1
	'''
	velocity = input_direction * move_speed
	move_and_slide()
#	Attributes.walk_right


