extends Node2D

@onready var bodySprite1 = $CompositeSprite1/Body
@onready var eyesSprite1 = $CompositeSprite1/Eyes
@onready var hairstylesSprite1 = $CompositeSprite1/Hairstyles
@onready var outfitSprite1 = $CompositeSprite1/Outfit

@onready var bodySprite2 = $CompositeSprite2/Body
@onready var eyesSprite2 = $CompositeSprite2/Eyes
@onready var hairstylesSprite2 = $CompositeSprite2/Hairstyles
@onready var outfitSprite2 = $CompositeSprite2/Outfit

@onready var bodySprite3 = $CompositeSprite3/Body
@onready var eyesSprite3 = $CompositeSprite3/Eyes
@onready var hairstylesSprite3 = $CompositeSprite3/Hairstyles
@onready var outfitSprite3 = $CompositeSprite3/Outfit

@onready var bodySprite4 = $CompositeSprite4/Body
@onready var eyesSprite4 = $CompositeSprite4/Eyes
@onready var hairstylesSprite4 = $CompositeSprite4/Hairstyles
@onready var outfitSprite4 = $CompositeSprite4/Outfit

@onready var bodySprite5 = $CompositeSprite5/Body
@onready var eyesSprite5 = $CompositeSprite5/Eyes
@onready var hairstylesSprite5 = $CompositeSprite5/Hairstyles
@onready var outfitSprite5 = $CompositeSprite5/Outfit

@onready var bodySprite6 = $CompositeSprite6/Body
@onready var eyesSprite6 = $CompositeSprite6/Eyes
@onready var hairstylesSprite6 = $CompositeSprite6/Hairstyles
@onready var outfitSprite6 = $CompositeSprite6/Outfit

@onready var bodySprite7 = $CompositeSprite7/Body
@onready var eyesSprite7 = $CompositeSprite7/Eyes
@onready var hairstylesSprite7 = $CompositeSprite7/Hairstyles
@onready var outfitSprite7 = $CompositeSprite7/Outfit

@onready var bodySprite8 = $CompositeSprite8/Body
@onready var eyesSprite8 = $CompositeSprite8/Eyes
@onready var hairstylesSprite8 = $CompositeSprite8/Hairstyles
@onready var outfitSprite8 = $CompositeSprite8/Outfit

const composite_sprites = preload("res://characters/assets/CompositeSprites.gd")


func _ready():
	bodySprite1.texture = composite_sprites.body_spritesheet[0]
	eyesSprite1.texture = composite_sprites.eyes_spritesheet[0]
	hairstylesSprite1.texture = composite_sprites.hairstyles_spritesheet[0]
	outfitSprite1.texture = composite_sprites.outfit_spritesheet[0]

	bodySprite2.texture = composite_sprites.body_spritesheet[1]
	eyesSprite2.texture = composite_sprites.eyes_spritesheet[1]
	hairstylesSprite2.texture = composite_sprites.hairstyles_spritesheet[30]
	outfitSprite2.texture = composite_sprites.outfit_spritesheet[10]

	bodySprite3.texture = composite_sprites.body_spritesheet[2]
	eyesSprite3.texture = composite_sprites.eyes_spritesheet[2]
	hairstylesSprite3.texture = composite_sprites.hairstyles_spritesheet[60]
	outfitSprite3.texture = composite_sprites.outfit_spritesheet[20]

	bodySprite4.texture = composite_sprites.body_spritesheet[3]
	eyesSprite4.texture = composite_sprites.eyes_spritesheet[3]
	hairstylesSprite4.texture = composite_sprites.hairstyles_spritesheet[90]
	outfitSprite4.texture = composite_sprites.outfit_spritesheet[30]
	
	bodySprite5.texture = composite_sprites.body_spritesheet[4]
	eyesSprite5.texture = composite_sprites.eyes_spritesheet[4]
	hairstylesSprite5.texture = composite_sprites.hairstyles_spritesheet[120]
	outfitSprite5.texture = composite_sprites.outfit_spritesheet[40]
	
	bodySprite6.texture = composite_sprites.body_spritesheet[5]
	eyesSprite6.texture = composite_sprites.eyes_spritesheet[5]
	hairstylesSprite6.texture = composite_sprites.hairstyles_spritesheet[150]
	outfitSprite6.texture = composite_sprites.outfit_spritesheet[50]
	
	bodySprite7.texture = composite_sprites.body_spritesheet[6]
	eyesSprite7.texture = composite_sprites.eyes_spritesheet[5]
	hairstylesSprite7.texture = composite_sprites.hairstyles_spritesheet[180]
	outfitSprite7.texture = composite_sprites.outfit_spritesheet[60]

	bodySprite8.texture = composite_sprites.body_spritesheet[7]
	eyesSprite8.texture = composite_sprites.eyes_spritesheet[0]
	hairstylesSprite8.texture = composite_sprites.hairstyles_spritesheet[199]
	outfitSprite8.texture = composite_sprites.outfit_spritesheet[70]
	$Panel.visible = true





func _on_select_pressed():
	SaveUtils.save()
	get_tree().change_scene_to_file(Attributes.location)


func _on_button_1_pressed():
	Attributes.curr_body = 0
	Attributes.curr_eyes = 0
	Attributes.curr_hair = 0
	Attributes.curr_outfit = 0
	$Panel.visible = false
	SaveUtils.save()
	get_tree().change_scene_to_file(Attributes.location)
	


func _on_button_2_pressed():
	Attributes.curr_body = 1
	Attributes.curr_eyes = 1
	Attributes.curr_hair = 30
	Attributes.curr_outfit = 10
	$Panel.visible = false
	SaveUtils.save()
	get_tree().change_scene_to_file(Attributes.location)


func _on_button_3_pressed():
	Attributes.curr_body = 2
	Attributes.curr_eyes = 2
	Attributes.curr_hair = 60
	Attributes.curr_outfit = 20
	$Panel.visible = false
	SaveUtils.save()
	get_tree().change_scene_to_file(Attributes.location)


func _on_button_4_pressed():
	Attributes.curr_body = 3
	Attributes.curr_eyes = 3
	Attributes.curr_hair = 90
	Attributes.curr_outfit = 30
	$Panel.visible = false
	SaveUtils.save()
	get_tree().change_scene_to_file(Attributes.location)


func _on_button_5_pressed():
	Attributes.curr_body = 4
	Attributes.curr_eyes = 4
	Attributes.curr_hair = 120
	Attributes.curr_outfit = 40
	$Panel.visible = false
	SaveUtils.save()
	get_tree().change_scene_to_file(Attributes.location)


func _on_button_6_pressed():
	Attributes.curr_body = 5
	Attributes.curr_eyes = 5
	Attributes.curr_hair = 150
	Attributes.curr_outfit = 50
	$Panel.visible = false
	SaveUtils.save()
	get_tree().change_scene_to_file(Attributes.location)


func _on_button_7_pressed():
	Attributes.curr_body = 6
	Attributes.curr_eyes = 5
	Attributes.curr_hair = 180
	Attributes.curr_outfit = 60
	$Panel.visible = false
	SaveUtils.save()
	get_tree().change_scene_to_file(Attributes.location)


func _on_button_8_pressed():
	Attributes.curr_body = 7
	Attributes.curr_eyes = 0
	Attributes.curr_hair = 199
	Attributes.curr_outfit = 70
	$Panel.visible = false
	SaveUtils.save()
	get_tree().change_scene_to_file(Attributes.location)
