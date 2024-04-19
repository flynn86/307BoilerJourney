extends Node2D


@onready var bodySprite = $CompositeSprites/Body
@onready var eyesSprite = $CompositeSprites/Eyes
@onready var hairstylesSprite = $CompositeSprites/Hairstyles
@onready var outfitSprite = $CompositeSprites/Outfit

# Called when the node enters the scene tree for the first time.
const player_customized = preload("res://characters/Player.gd")
const composite_sprites = preload("res://characters/assets/CompositeSprites.gd")

@onready var changbody = $Player/ChangeBody



'''
var hair = player.curr_hair
var body = player.curr_body
var eyes = player.curr_eyes
var outfit = player.outfit
'''


func _ready():
	$Player/Panel.visible = true
	'''
	bodySprite.texture = composite_sprites.body_spritesheet[8]
	eyesSprite.texture = composite_sprites.eyes_spritesheet[5]
	hairstylesSprite.texture = composite_sprites.hairstyles_spritesheet[10]
	outfitSprite.texture = composite_sprites.outfit_spritesheet[10]
	'''
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	




func _on_player_hair(value):
		hairstylesSprite.texture = composite_sprites.hairstyles_spritesheet[value]


func _on_player_body(value):
	bodySprite.texture = composite_sprites.body_spritesheet[value]



func _on_player_eyes(value):
	eyesSprite.texture = composite_sprites.eyes_spritesheet[value]



func _on_player_outfit(value):
	outfitSprite.texture = composite_sprites.outfit_spritesheet[value]
