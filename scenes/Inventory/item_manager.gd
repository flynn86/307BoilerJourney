# Singleton Script used by Inventory
extends Node


# Preload item icons
var basketball = preload("res://scenes/Collectable_scenes/Collectables/Pixel-Art-Basketball-2-1015x1024.png") # ID = 0
var iu_sucks_poster = preload("res://scenes/Collectable_scenes/Collectables/fposter,small,wall_texture,product,750x1000.u2.jpg") # ID = 1
var purdue_symbol = preload("res://scenes/Collectable_scenes/Collectables/purdue-boilermakers-football-purdue-boilermakers-men-s-basketball-mackey-arena-purdue-pete-university-purdue-boilermakers-women-s-basketball-thumbnail.png") # ID = 2

# Variables
@onready var icons : Array = [basketball, iu_sucks_poster, purdue_symbol]
@onready var scale : Array = [0.02, 0.014, 0.05]
enum Items {
	BASKETBALL,
	IU_SUCKS_POSTER,
	PURDUE_SYMBOL
}



#func get_item(id : int):
	#return items[id].instantiate()
