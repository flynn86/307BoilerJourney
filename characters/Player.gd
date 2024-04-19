extends Node2D

@onready var bodySprite = $CompositeSprites/Body
@onready var eyesSprite = $CompositeSprites/Eyes
@onready var hairstylesSprite = $CompositeSprites/Hairstyles
@onready var outfitSprite = $CompositeSprites/Outfit

const composite_sprites = preload("res://characters/assets/CompositeSprites.gd")

var rng = RandomNumberGenerator.new()

func _ready():
	bodySprite.texture = composite_sprites.body_spritesheet[Attributes.curr_body]
	eyesSprite.texture = composite_sprites.eyes_spritesheet[Attributes.curr_eyes]
	hairstylesSprite.texture = composite_sprites.hairstyles_spritesheet[Attributes.curr_hair]
	outfitSprite.texture = composite_sprites.outfit_spritesheet[Attributes.curr_outfit]


func _on_change_hair_pressed():
	Attributes.curr_hair = (Attributes.curr_hair + 1) % composite_sprites.hairstyles_spritesheet.size()
	hairstylesSprite.texture = composite_sprites.hairstyles_spritesheet[Attributes.curr_hair]


func _on_change_body_pressed():
	Attributes.curr_body = (Attributes.curr_body + 1) % composite_sprites.body_spritesheet.size()
	bodySprite.texture = composite_sprites.body_spritesheet[Attributes.curr_body]

func _on_change_eyes_pressed():
	Attributes.curr_eyes = (Attributes.curr_eyes + 1) % composite_sprites.eyes_spritesheet.size()
	eyesSprite.texture = composite_sprites.eyes_spritesheet[Attributes.curr_eyes]


func _on_change_outfit_pressed():
	Attributes.curr_outfit = (Attributes.curr_outfit + 1) % composite_sprites.outfit_spritesheet.size()
	outfitSprite.texture = composite_sprites.outfit_spritesheet[Attributes.curr_outfit]


func _on_random_pressed():
	Attributes.curr_body = rng.randi_range(0, composite_sprites.body_spritesheet.size() - 1)
	Attributes.curr_eyes = rng.randi_range(0, composite_sprites.eyes_spritesheet.size() - 1)
	Attributes.curr_hair = rng.randi_range(0, composite_sprites.hairstyles_spritesheet.size() - 1)
	Attributes.curr_outfit = rng.randi_range(0, composite_sprites.outfit_spritesheet.size() - 1)
	hairstylesSprite.texture = composite_sprites.hairstyles_spritesheet[Attributes.curr_hair]
	bodySprite.texture = composite_sprites.body_spritesheet[Attributes.curr_body]
	eyesSprite.texture = composite_sprites.eyes_spritesheet[Attributes.curr_eyes]
	outfitSprite.texture = composite_sprites.outfit_spritesheet[Attributes.curr_outfit]



func _on_button_pressed():
	%Panel.visible = false
	SaveUtils.save()
	get_tree().change_scene_to_file(Attributes.location)
