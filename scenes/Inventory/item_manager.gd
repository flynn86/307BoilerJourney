# Singleton Script used by Inventory
extends Node


# Preload item icons
var basketball = preload("res://scenes/Collectable_scenes/Collectables/Pixel-Art-Basketball-2-1015x1024.png") # ID = 0
var iu_sucks_poster = preload("res://scenes/Collectable_scenes/Collectables/fposter,small,wall_texture,product,750x1000.u2.jpg") # ID = 1
var purdue_symbol = preload("res://scenes/Collectable_scenes/Collectables/purdue-boilermakers-football-purdue-boilermakers-men-s-basketball-mackey-arena-purdue-pete-university-purdue-boilermakers-women-s-basketball-thumbnail.png") # ID = 2
var angry_pete = preload("res://scenes/Collectable_scenes/Collectables/purdue-university-pete-4-logo-png-transparent.png") # ID = 3
var bell_tower = preload("res://scenes/Collectable_scenes/Collectables/bell tower full.png") # ID = 4
var boilermaker_train = preload("res://scenes/Collectable_scenes/Collectables/Boilermaker train.webp") # ID = 5
var go_boilers = preload("res://scenes/Collectable_scenes/Collectables/go boilers.png") # ID = 6
var purdue_cap = preload("res://scenes/Collectable_scenes/Collectables/Purdue_Cap_Transparent.png") # ID = 7
var purdue_helmet = preload("res://scenes/Collectable_scenes/Collectables/Purdue_Helmet_Transparent.png") # ID = 8

# Variables
@onready var names : Array = ["Basketball", "IU Sucks Poster", "Purdue Symbol", "Angry Pete", "Bell Tower", "Boilermaker Special", "Go Boilers!", "Purdue Cap", "Purdue Helmet"]
@onready var icons : Array = [basketball, iu_sucks_poster, purdue_symbol, angry_pete, bell_tower, boilermaker_train, go_boilers, purdue_cap, purdue_helmet]
@onready var scale : Array = [0.02, 0.014, 0.05, 0.007, 0.035, 0.035, 0.025, 0.08, 0.045]
@onready var descriptions : Array = [
	"A standard basketball, perfect for shooting hoops and practicing dribbling skills.",
	"A poster displaying the words “IU SUCKS\". This popular chant is yelled during basketball games at the end of the tune “Hail Fire\".",
	"Carry the spirit of Purdue University wherever you go using this iconic symbol!",
	"The athletic mascot of Purdue University. His hammer resembles the mallets used to mold steel by boilermakers.",
	"Constructed in 1995, the Purdue Bell Tower towers 160 feet. Legends state that the seal underneath it is cursed.",
	"The official mascot of Purdue. Resembling the Victorian-era railroad locomotive, it is operated by the Purdue Reamer Club.",
	"Emblazoned with the words 'Let's go Purdue', this emblem encapsulates the spirit and unwavering pride of Purdue University.",
	"A stylish cap with the Purdue University logo embroidered at the front.",
	"Gear up for game day or show your pride with this Purdue University football helmet."
]

# Values correspond to index of array items in Attributes
enum Items {
	BASKETBALL,
	IU_SUCKS_POSTER,
	PURDUE_SYMBOL,
	ANGRY_PETE,
	BELL_TOWER,
	BOILERMAKER_TRAIN,
	GO_BOILERS,
	PURDUE_CAP,
	PURDUE_HELMET
}



#func get_item(id : int):
	#return items[id].instantiate()
