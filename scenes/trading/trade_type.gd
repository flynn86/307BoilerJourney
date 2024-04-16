extends Node2D

@onready var online_label = get_child(0).get_child(0).get_child(1).get_child(0).get_child(0)
@onready var offline_label = get_child(0).get_child(0).get_child(2).get_child(0).get_child(0)

func _ready():
	visible = false
	online_label.visible_characters = -1
	offline_label.visible_characters = -1

func _on_close_pressed():
	visible = false
