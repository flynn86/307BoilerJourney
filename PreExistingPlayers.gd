extends Node2D

@onready var bodySprite = $CompositeSprites/Body
@onready var eyesSprite = $CompositeSprites/Eyes
@onready var hairstylesSprite = $CompositeSprites/Hairstyles
@onready var outfitSprite = $CompositeSprites/Outfit

const composite_sprites = preload("res://characters/assets/CompositeSprites.gd")


func _ready():
	bodySprite.texture = composite_sprites.body_spritesheet[Attributes.curr_body]
	eyesSprite.texture = composite_sprites.eyes_spritesheet[Attributes.curr_eyes]
	hairstylesSprite.texture = composite_sprites.hairstyles_spritesheet[Attributes.curr_hair]
	outfitSprite.texture = composite_sprites.outfit_spritesheet[Attributes.curr_outfit]





func _on_prev_button_pressed():
	Attributes.curr_eyes = (Attributes.curr_eyes + 1) % 7
	eyesSprite.texture = composite_sprites.eyes_spritesheet[Attributes.curr_eyes]
	Attributes.curr_body = (Attributes.curr_body + 1) % 7
	bodySprite.texture = composite_sprites.body_spritesheet[Attributes.curr_body]
	Attributes.curr_hair = (Attributes.curr_hair + 1) % 7
	hairstylesSprite.texture = composite_sprites.hairstyles_spritesheet[Attributes.curr_hair]
	Attributes.curr_outfit = (Attributes.curr_outfit + 1) % 7
	outfitSprite.texture = composite_sprites.outfit_spritesheet[Attributes.curr_outfit]


func _on_next_pressed():
	if (Attributes.curr_eyes == 0) :
		Attributes.curr_eyes = 6
	else:
		Attributes.curr_eyes = (Attributes.curr_eyes - 1) % 7
	eyesSprite.texture = composite_sprites.eyes_spritesheet[Attributes.curr_eyes]
	
	if (Attributes.curr_body == 0):
		Attributes.curr_body = 6
	else:
		Attributes.curr_body = (Attributes.curr_body - 1) % 7
	bodySprite.texture = composite_sprites.body_spritesheet[Attributes.curr_body]
	
	if (Attributes.curr_hair == 0):
		Attributes.curr_hair = 6
	else:
		Attributes.curr_hair = (Attributes.curr_hair - 1) % 7
	hairstylesSprite.texture = composite_sprites.hairstyles_spritesheet[Attributes.curr_hair]
	
	if (Attributes.curr_outfit == 0):
		Attributes.curr_outfit = 6
	else:
		Attributes.curr_outfit = (Attributes.curr_outfit - 1) % 7
	outfitSprite.texture = composite_sprites.outfit_spritesheet[Attributes.curr_outfit]



func _on_select_pressed():
	SaveUtils.save()
	get_tree().change_scene_to_file(Attributes.location)
