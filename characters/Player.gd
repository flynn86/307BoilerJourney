extends Node2D

@onready var bodySprite = $CompositeSprites/Body
@onready var eyesSprite = $CompositeSprites/Eyes
@onready var hairstylesSprite = $CompositeSprites/Hairstyles
@onready var outfitSprite = $CompositeSprites/Outfit

const composite_sprites = preload("res://characters/assets/CompositeSprites.gd")


func _ready():
	bodySprite.texture = composite_sprites.body_spritesheet[0]
	eyesSprite.texture = composite_sprites.eyes_spritesheet[0]
	hairstylesSprite.texture = composite_sprites.hairstyles_spritesheet[0]
	outfitSprite.texture = composite_sprites.outfit_spritesheet[0]
	
	
