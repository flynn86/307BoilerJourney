extends Node2D

@onready var label = get_child(0)
@onready var scale_x : float = 0.008
@onready var scale_y : float = 0.008
@onready var header = get_child(1)
var scale_x_increment : float = 0.0375
var transparency_increment : float = 0.1
var max_scale_x : float = 0.75
var scale_x_char_multiplier = 0.0682


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	scale_x = 0.008
	label.modulate = Color(255, 255, 255, 0)
	label.visible_characters = -1
	var final_scale = Vector2(0.008, 0.008)
	if header is Sprite2D:
		header.scale = final_scale

func header_animation_scene():
	visible = true
	label.visible_characters = -1
	scale_x = 0
	label.modulate.a = 0
	scale_x_increment = max_scale_x / 20.0
	for i in range(0,20,1):
		scale_x += scale_x_increment
		var final_scale = Vector2(scale_x, scale_y)
		header.scale = final_scale
		label.modulate.a += transparency_increment
		await get_tree().create_timer(0.01).timeout
		if (scale_x >= max_scale_x):
			scale_x = max_scale_x
		if (label.modulate.a >= 1):
			label.modulate.a = 1
	await get_tree().create_timer(5).timeout
	for i in range(0,20,1):
		scale_x -= scale_x_increment
		var final_scale = Vector2(scale_x, scale_y)
		header.scale = final_scale
		label.modulate.a -= transparency_increment
		await get_tree().create_timer(0.01).timeout
		if (scale_x <= 0):
			scale_x = 0
		if (label.modulate.a <= 0):
			label.modulate.a = 0
	visible = false


func _on_stew_area_body_entered(body):
	if (body is CharacterBody2D) && (body.get_meta("Player")):
		label.text = "Stewart Center\n" + $"../../../STEW".text
		label.position.x = 100 - (label.size.x / 2)
		max_scale_x = len(label.text) * scale_x_char_multiplier
		header_animation_scene()


func _on_ellt_area_body_entered(body):
	if (body is CharacterBody2D) && (body.get_meta("Player")):
		label.text = "Elliot Hall\n" + $"../../../ELLT".text
		label.position.x = 100 - (label.size.x / 2)
		max_scale_x = len(label.text) * scale_x_char_multiplier
		header.position.x = 70 - (header.texture.get_width() / 2)
		header_animation_scene()


func _on_pmu_area_body_entered(body):
	if (body is CharacterBody2D) && (body.get_meta("Player")):
		label.text = "Purdue Memorial Union\n" + $"../../../PMU".text
		label.position.x = 100 - (label.size.x / 2)
		max_scale_x = len(label.text) * scale_x_char_multiplier
		header_animation_scene()


func _on_wthr_area_body_entered(body):
	if (body is CharacterBody2D) && (body.get_meta("Player")):
		label.text = "Wetherill Hall of Chemistry\n" + $"../../../WTHR".text
		label.position.x = 100 - (label.size.x / 2)
		max_scale_x = len(label.text) * scale_x_char_multiplier
		header_animation_scene()


func _on_walc_area_body_entered(body):
	if (body is CharacterBody2D) && (body.get_meta("Player")):
		label.text = "Wilmeth Active Learning Center\n" + $"../../../WALC".text
		label.position.x = 60 - (label.size.x / 2)
		max_scale_x = len(label.text) * scale_x_char_multiplier
		header_animation_scene()


func _on_hamp_area_body_entered(body):
	if (body is CharacterBody2D) && (body.get_meta("Player")):
		label.text = "Hamptom Hall of Civil Engineering\n" + $"../../../HAMP".text
		label.position.x = 100 - (label.size.x / 2)
		max_scale_x = len(label.text) * scale_x_char_multiplier
		header_animation_scene()


func _on_arms_area_body_entered(body):
	if (body is CharacterBody2D) && (body.get_meta("Player")):
		label.text = "Neil Armstrong Hall of Engineering\n" + $"../../../ARMS".text
		label.position.x = 100 - (label.size.x / 2)
		max_scale_x = len(label.text) * scale_x_char_multiplier
		header_animation_scene()


func _on_phys_area_body_entered(body):
	if (body is CharacterBody2D) && (body.get_meta("Player")):
		label.text = "Physics Building\n" + $"../../../PHYS".text
		label.position.x = 100 - (label.size.x / 2)
		max_scale_x = len(label.text) * scale_x_char_multiplier
		header_animation_scene()


func _on_ar_area_body_entered(body):
	if (body is CharacterBody2D) && (body.get_meta("Player")):
		label.text = "Armory\n" + $"../../../AR".text
		label.position.x = 100 - (label.size.x / 2)
		max_scale_x = len(label.text) * scale_x_char_multiplier
		header_animation_scene()



func _on_push_area_body_entered(body):
	if (body is CharacterBody2D) && (body.get_meta("Player")):
		label.text = $"../../../PUSH".text
		label.position.x = 100 - (label.size.x / 2)
		max_scale_x = len(label.text) * scale_x_char_multiplier
		header_animation_scene()
