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

