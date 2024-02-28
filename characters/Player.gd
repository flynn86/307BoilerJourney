extends Node2D
signal hair(value)
signal body(value)
signal eyes(value)
signal outfit(value)
@onready var bodySprite = $CompositeSprites/Body
@onready var eyesSprite = $CompositeSprites/Eyes
@onready var hairstylesSprite = $CompositeSprites/Hairstyles
@onready var outfitSprite = $CompositeSprites/Outfit

const composite_sprites = preload("res://characters/assets/CompositeSprites.gd")
var cont: int = 0
var curr_hair: int = 0
var curr_eyes: int = 0
var curr_body: int = 0
var curr_outfit: int = 0

var rng = RandomNumberGenerator.new()

func _ready():
	if (cont == 1):
		$ChangeBody.visible = false
	bodySprite.texture = composite_sprites.body_spritesheet[curr_body]
	eyesSprite.texture = composite_sprites.eyes_spritesheet[curr_eyes]
	hairstylesSprite.texture = composite_sprites.hairstyles_spritesheet[curr_hair]
	outfitSprite.texture = composite_sprites.outfit_spritesheet[curr_outfit]
	


func _on_change_hair_pressed():
	curr_hair = (curr_hair + 1) % composite_sprites.hairstyles_spritesheet.size()
	hairstylesSprite.texture = composite_sprites.hairstyles_spritesheet[curr_hair]


func _on_change_body_pressed():
	curr_body = (curr_body + 1) % composite_sprites.body_spritesheet.size()
	bodySprite.texture = composite_sprites.body_spritesheet[curr_body]

func _on_change_eyes_pressed():
	curr_eyes = (curr_eyes + 1) % composite_sprites.eyes_spritesheet.size()
	eyesSprite.texture = composite_sprites.eyes_spritesheet[curr_eyes]


func _on_change_outfit_pressed():
	curr_outfit = (curr_outfit + 1) % composite_sprites.outfit_spritesheet.size()
	outfitSprite.texture = composite_sprites.outfit_spritesheet[curr_outfit]


func _on_random_pressed():
	curr_body = rng.randi_range(0, composite_sprites.body_spritesheet.size() - 1)
	curr_eyes = rng.randi_range(0, composite_sprites.eyes_spritesheet.size() - 1)
	curr_hair = rng.randi_range(0, composite_sprites.hairstyles_spritesheet.size() - 1)
	curr_outfit = rng.randi_range(0, composite_sprites.outfit_spritesheet.size() - 1)
	hairstylesSprite.texture = composite_sprites.hairstyles_spritesheet[curr_hair]
	bodySprite.texture = composite_sprites.body_spritesheet[curr_body]
	eyesSprite.texture = composite_sprites.eyes_spritesheet[curr_eyes]
	outfitSprite.texture = composite_sprites.outfit_spritesheet[curr_outfit]



func _on_button_pressed():
	emit_signal("hair", curr_hair)
	emit_signal("body", curr_body)
	emit_signal("eyes", curr_eyes)
	emit_signal("outfit", curr_outfit)
	cont = 1
	get_tree().change_scene_to_file("res://scenes/map/academic_map.tscn")
	
