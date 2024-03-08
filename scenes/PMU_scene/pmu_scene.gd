extends Node2D

func _ready():
	print($CharacterBody2D.global_position)
	$CharacterBody2D.global_position.x = 0
	$CharacterBody2D.global_position.y = 0
	print($CharacterBody2D.global_position)

func _input(event):
	if event is InputEventMouseMotion or event is InputEventMouseButton:
		var mouse_pos = event.position

func _on_menu_button_pressed():
	SaveUtils.save()
	get_tree().change_scene_to_file("res://scenes/menu.tscn")


func _on_collectible_button_pressed():
	Attributes.collectibleA = true
	get_node("CharacterBody2D/Player/CollectibleButton").visible = false

func _on_exit_button_pressed():
	get_tree().change_scene_to_file("res://scenes/map/academic_map.tscn")
