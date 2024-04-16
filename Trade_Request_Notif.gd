extends Node2D

@onready var accept_label = get_child(0).get_child(0).get_child(1).get_child(0).get_child(0)
@onready var decline_label = get_child(0).get_child(0).get_child(2).get_child(0).get_child(0)

func _ready():
	visible = false
	accept_label.visible_characters = -1
	decline_label.visible_characters = -1

func _on_close_pressed():
	visible = false
