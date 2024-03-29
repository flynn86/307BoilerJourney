extends Node2D


# Called when the node enters the scene tree for the first time.

@onready var bedSprite = $DormSprites/Bed
@onready var deskSprite = $DormSprites/Desk
@onready var windowSprite = $DormSprites/Window
@onready var sidetableSprite = $DormSprites/Sidetable

const dorm_sprites = preload("res://scenes/map/dorm_spritesheets.gd")

func _ready():
	bedSprite.texture = dorm_sprites.bed_spritesheet[Attributes.curr_bed]
	deskSprite.texture = dorm_sprites.desk_spritesheet[Attributes.curr_desk]
	windowSprite.texture = dorm_sprites.window_spritesheet[Attributes.curr_window]
	sidetableSprite.texture = dorm_sprites.sidetable_spritesheet[Attributes.curr_sidetable]


func _on_change_bed_pressed():
	Attributes.curr_bed = (Attributes.curr_bed + 1) % dorm_sprites.bed_spritesheet.size()
	bedSprite.texture = dorm_sprites.bed_spritesheet[Attributes.curr_bed]
	SaveUtils.save()


func _on_change_desk_pressed():
	Attributes.curr_desk = (Attributes.curr_desk + 1) % dorm_sprites.desk_spritesheet.size()
	deskSprite.texture = dorm_sprites.desk_spritesheet[Attributes.curr_desk]
	SaveUtils.save()

func _on_change_window_pressed():
	Attributes.curr_window = (Attributes.curr_window + 1) % dorm_sprites.desk_spritesheet.size()
	windowSprite.texture = dorm_sprites.window_spritesheet[Attributes.curr_window]
	SaveUtils.save()
	
	
func _on_change_sidetable_pressed():
	Attributes.curr_sidetable = (Attributes.curr_sidetable + 1) % dorm_sprites.sidetable_spritesheet.size()
	sidetableSprite.texture = dorm_sprites.sidetable_spritesheet[Attributes.curr_sidetable]
	SaveUtils.save()

func _on_view_schedule_pressed():
	Attributes.location = "res://scenes/map/dorm_room.tscn"
	SaveUtils.save()
	get_tree().change_scene_to_file("res://scenes/schedule.tscn")



func _on_menu_button_pressed():
	Attributes.location = "res://scenes/map/dorm_room.tscn"
	SaveUtils.save()
	get_tree().change_scene_to_file("res://scenes/menu.tscn")


func _on_exit_pressed():
	Attributes.location = "res://scenes/map/housing_map.tscn"
	SaveUtils.save()
	get_tree().change_scene_to_file(Attributes.location)



