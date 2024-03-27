# Singleton Script used by Inventory
extends Node


# Preload item icons
var basketball = preload("res://scenes/Collectable_scenes/Collectables/Pixel-Art-Basketball-2-1015x1024.png") # ID = 0
var iu_sucks_poster = preload("res://scenes/Collectable_scenes/Collectables/fposter,small,wall_texture,product,750x1000.u2.jpg") # ID = 1
var purdue_symbol = preload("res://scenes/Collectable_scenes/Collectables/purdue-boilermakers-football-purdue-boilermakers-men-s-basketball-mackey-arena-purdue-pete-university-purdue-boilermakers-women-s-basketball-thumbnail.png") # ID = 2

# Variables
@onready var names : Array = ["Basketball", "IU Sucks Poster", "Purdue Symbol"]
@onready var icons : Array = [basketball, iu_sucks_poster, purdue_symbol]
@onready var scale : Array = [0.02, 0.014, 0.05]
@onready var descriptions : Array = [
	"A standard basketball, perfect for shooting hoops and practicing dribbling skills.",
	"A poster displaying the words “IU SUCKS\". This popular chant is yelled during basketball games at the end of the tune “Hail Fire\".",
	"Carry the spirit of Purdue University wherever you go using this iconic symbol!"
]

# Values correspond to index of array items in Attributes
enum Items {
	BASKETBALL,
	IU_SUCKS_POSTER,
	PURDUE_SYMBOL
}



#func get_item(id : int):
	#return items[id].instantiate()
