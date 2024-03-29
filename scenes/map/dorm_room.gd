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
	
	if (int(Attributes.display_item_1) != -1):
		%collectable.texture = ItemManager.icons[Attributes.items[int(Attributes.display_item_1)]]
		print(ItemManager.names[Attributes.items[int(Attributes.display_item_1)]])
		if (ItemManager.names[Attributes.items[int(Attributes.display_item_1)]] == "Angry Pete"):
			%collectable.scale = Vector2(0.05, 0.05)
		elif (ItemManager.names[Attributes.items[int(Attributes.display_item_1)]] == "Basketball"):
			%collectable.scale = Vector2(0.1, 0.1)
		elif (ItemManager.names[Attributes.items[int(Attributes.display_item_1)]] == "IU Sucks Poster"):
			%collectable.scale = Vector2(0.1, 0.1)
		elif (ItemManager.names[Attributes.items[int(Attributes.display_item_1)]] == "Purdue Helmet"):
			%collectable.scale = Vector2(0.5, 0.5)
		elif (ItemManager.names[Attributes.items[int(Attributes.display_item_1)]] == "Go Boilers!"):
			%collectable.scale = Vector2(0.25, 0.25)
		elif (ItemManager.names[Attributes.items[int(Attributes.display_item_1)]] == "Bell Tower"):
			%collectable.scale = Vector2(0.35, 0.35)
		elif (ItemManager.names[Attributes.items[int(Attributes.display_item_1)]] == "Purdue Symbol"):
			%collectable.scale = Vector2(0.35, 0.35)
		elif (ItemManager.names[Attributes.items[int(Attributes.display_item_1)]] == "Boilermaker Special"):
			%collectable.scale = Vector2(0.35, 0.35)
		elif (ItemManager.names[Attributes.items[int(Attributes.display_item_1)]] == "Purdue Helmet"):
			%collectable.scale = Vector2(0.1, 0.1)
	
	if (int(Attributes.display_item_2) != -1):
		get_node("Node2D/collectable_1").texture = ItemManager.icons[Attributes.items[int(Attributes.display_item_2)]]
		print(ItemManager.names[Attributes.items[int(Attributes.display_item_2)]])
		if (ItemManager.names[Attributes.items[int(Attributes.display_item_2)]] == "Angry Pete"):
			get_node("Node2D/collectable_1").scale = Vector2(0.05, 0.05)
		elif (ItemManager.names[Attributes.items[int(Attributes.display_item_2)]] == "Basketball"):
			get_node("Node2D/collectable_1").scale = Vector2(0.1, 0.1)
		elif (ItemManager.names[Attributes.items[int(Attributes.display_item_2)]] == "IU Sucks Poster"):
			get_node("Node2D/collectable_1").scale = Vector2(0.1, 0.1)
		elif (ItemManager.names[Attributes.items[int(Attributes.display_item_2)]] == "Purdue Helmet"):
			get_node("Node2D/collectable_1").scale = Vector2(0.5, 0.5)
		elif (ItemManager.names[Attributes.items[int(Attributes.display_item_2)]] == "Go Boilers!"):
			get_node("Node2D/collectable_1").scale = Vector2(0.25, 0.25)
		elif (ItemManager.names[Attributes.items[int(Attributes.display_item_2)]] == "Bell Tower"):
			get_node("Node2D/collectable_1").scale = Vector2(0.35, 0.35)
		elif (ItemManager.names[Attributes.items[int(Attributes.display_item_2)]] == "Purdue Symbol"):
			get_node("Node2D/collectable_1").scale = Vector2(0.35, 0.35)
		elif (ItemManager.names[Attributes.items[int(Attributes.display_item_2)]] == "Boilermaker Special"):
			get_node("Node2D/collectable_1").scale = Vector2(0.35, 0.35)
		elif (ItemManager.names[Attributes.items[int(Attributes.display_item_2)]] == "Purdue Helmet"):
			get_node("Node2D/collectable_1").scale = Vector2(0.1, 0.1)

	if (int(Attributes.display_item_3) != -1):
		get_node("Node2D/collectable_2").texture = ItemManager.icons[Attributes.items[int(Attributes.display_item_3)]]
		print(ItemManager.names[Attributes.items[int(Attributes.display_item_3)]])
		if (ItemManager.names[Attributes.items[int(Attributes.display_item_3)]] == "Angry Pete"):
			get_node("Node2D/collectable_2").scale = Vector2(0.05, 0.05)
		elif (ItemManager.names[Attributes.items[int(Attributes.display_item_3)]] == "Basketball"):
			get_node("Node2D/collectable_2").scale = Vector2(0.1, 0.1)
		elif (ItemManager.names[Attributes.items[int(Attributes.display_item_3)]] == "IU Sucks Poster"):
			get_node("Node2D/collectable_2").scale = Vector2(0.1, 0.1)
		elif (ItemManager.names[Attributes.items[int(Attributes.display_item_3)]] == "Purdue Helmet"):
			get_node("Node2D/collectable_2").scale = Vector2(0.5, 0.5)
		elif (ItemManager.names[Attributes.items[int(Attributes.display_item_3)]] == "Go Boilers!"):
			get_node("Node2D/collectable_2").scale = Vector2(0.25, 0.25)
		elif (ItemManager.names[Attributes.items[int(Attributes.display_item_3)]] == "Bell Tower"):
			get_node("Node2D/collectable_2").scale = Vector2(0.35, 0.35)
		elif (ItemManager.names[Attributes.items[int(Attributes.display_item_3)]] == "Purdue Symbol"):
			get_node("Node2D/collectable_2").scale = Vector2(0.35, 0.35)
		elif (ItemManager.names[Attributes.items[int(Attributes.display_item_3)]] == "Boilermaker Special"):
			get_node("Node2D/collectable_2").scale = Vector2(0.35, 0.35)
		elif (ItemManager.names[Attributes.items[int(Attributes.display_item_3)]] == "Purdue Helmet"):
			get_node("Node2D/collectable_2").scale = Vector2(0.1, 0.1)
		
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






func _on_display_collectable_pressed():
	Attributes.dorm_display = true
	Attributes.location = "res://scenes/map/dorm_room.tscn"
	SaveUtils.save()
	get_tree().change_scene_to_file("res://scenes/Inventory/player_inventory.tscn")
