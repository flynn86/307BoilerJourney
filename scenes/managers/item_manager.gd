extends Node

onready var items = {
	"tree" : preload("res://items/data/tree.tscn")
}

func get_item(id : String):
	return items[id].instance()
