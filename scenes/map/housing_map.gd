extends Node2D

func _ready():
	$CharacterBody2D.global_position = Vector2(float(Attributes.xhousing),float(Attributes.yhousing))
	set_process_input(true)


func _on_panel_closed():
	Attributes.xhousing = $CharacterBody2D.global_position.x
	Attributes.yhousing = $CharacterBody2D.global_position.y
	SaveUtils.save()
	self.visible = true

func _on_return_button_pressed():
	Attributes.xhousing = $CharacterBody2D.global_position.x
	Attributes.yhousing = $CharacterBody2D.global_position.y
	Attributes.location = "res://scenes/map/academic_map.tscn"
	get_tree().change_scene_to_file("res://scenes/map/academic_map.tscn")
	SaveUtils.save()


func _on_change_summer_pressed():
	get_node("SummerVariantH").visible = true
	get_node("FallVariantH").visible = false
	get_node("SpringVariantH").visible = false
	get_node("WinterVariantH").visible = false



func _on_change_winter_pressed():
	get_node("SummerVariantH").visible = false
	get_node("FallVariantH").visible = false
	get_node("SpringVariantH").visible = false
	get_node("WinterVariantH").visible = true


func _on_change_fall_pressed():
	get_node("SummerVariantH").visible = false
	get_node("FallVariantH").visible = true
	get_node("SpringVariantH").visible = false
	get_node("WinterVariantH").visible = false


func _on_change_spring_pressed():
	get_node("SummerVariantH").visible = true
	get_node("FallVariantH").visible = false
	get_node("SpringVariantH").visible = true
	get_node("WinterVariantH").visible = false
