extends Node2D

@onready var label = get_child(0)
@onready var scale_x : float = 0.008
@onready var scale_y : float = 0.008
@onready var header = get_child(1)
var scale_x_increment : float = 0.0375
var transparency_increment : float = 0.1
var max_scale_x : float = 0.75
var scale_x_char_multiplier = 0.0682

# Used to handle signals calling function while function is not finished with execution
var in_execution : bool = false 


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	scale_x = 0.008
	label.modulate = Color(255, 255, 255, 0)
	label.visible_characters = -1
	var final_scale = Vector2(0, 0.008)
	if header is Sprite2D:
		header.scale = final_scale

func header_animation_scene():
	in_execution = true
	label.visible_characters = -1
	scale_x = 0
	label.modulate.a = 0
	scale_x_increment = max_scale_x / 20.0
	label.position.x = 100 - (label.size.x / 2)
	header.position.x = label.position.x + (label.size.x / 4)
	max_scale_x = len(label.text) * scale_x_char_multiplier
	visible = true
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
	in_execution = false


func _on_stew_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = "Stewart Center\n" + $"../../../STEW".text
		
		
		header_animation_scene()


func _on_ellt_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = "Elliot Hall\n" + $"../../../ELLT".text
		
		
		header_animation_scene()


func _on_pmu_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = "Purdue Memorial Union\n" + $"../../../PMU".text
		
		
		header_animation_scene()


func _on_wthr_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = "Wetherill Hall of Chemistry\n" + $"../../../WTHR".text
		
		
		header_animation_scene()


func _on_walc_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = "Wilmeth Active Learning Center\n" + $"../../../WALC".text
		label.position.x = 60 - (label.size.x / 2)
		
		header_animation_scene()


func _on_hamp_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = "Hamptom Hall of Civil Engineering\n" + $"../../../HAMP".text
		
		
		header_animation_scene()


func _on_arms_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = "Neil Armstrong Hall of Engineering\n" + $"../../../ARMS".text
		
		
		header_animation_scene()


func _on_phys_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = "Physics Building\n" + $"../../../PHYS".text
		
		
		header_animation_scene()


func _on_ar_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = "Armory\n" + $"../../../AR".text
		
		
		header_animation_scene()



func _on_push_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = $"../../../PUSH".text
		
		
		header_animation_scene()

func _on_rnph_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = $"../../../RNPH".text
		
		
		header_animation_scene()
		
func _on_jnsn_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = $"../../../JNSN".text
		
		
		header_animation_scene()

func _on_frny_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = $"../../../FRNY".text
		
		
		header_animation_scene()


func _on_dscb_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = $"../../../DSCB".text
		
		
		header_animation_scene()
		
func _on_msee_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = $"../../../MSEE".text
		
		
		header_animation_scene()
		
func _on_chas_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = $"../../../CHAS".text
		
		
		header_animation_scene()
		
func _on_bhee_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = $"../../../BHEE".text
		
		
		header_animation_scene()
		
func _on_hovd_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = $"../../../HOVD".text
		
		
		header_animation_scene()
		
func _on_me_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = $"../../../ME".text
		
		
		header_animation_scene()
		
func _on_brwn_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = $"../../../BRWN".text
		
		
		header_animation_scene()
		
func _on_potr_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = $"../../../POTR".text
		
		
		header_animation_scene()
		
func _on_lmbs_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = $"../../../LMBS".text
		
		
		header_animation_scene()
		
func _on_knoy_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = $"../../../KNOY".text
		
		
		header_animation_scene()
		
func _on_dudl_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = $"../../../DUDL".text
		
		
		header_animation_scene()
		
func _on_haas_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = $"../../../HAAS".text
		
		
		header_animation_scene()
		
func _on_psyc_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = $"../../../PSYC".text
		
		
		header_animation_scene()
		
func _on_prce_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = $"../../../PRCE".text
		
		
		header_animation_scene()
		

		
func _on_math_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = $"../../../MATH".text
		
		
		header_animation_scene()
		
func _on_sc_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = $"../../../SC".text
		
		
		header_animation_scene()
		
func _on_heav_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = $"../../../HEAV".text
		
		
		header_animation_scene()

func _on_gris_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = $"../../../GRIS".text
		
		
		header_animation_scene()
		
func _on_BRNG_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = $"../../../BRNG".text
		
		
		header_animation_scene()
		
func _on_schm_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = $"../../../SCHM".text
		
		
		header_animation_scene()

func _on_univ_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = $"../../../UNIV".text
		
		
		header_animation_scene()
		
func _on_mthw_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = $"../../../MTHW".text
		
		
		header_animation_scene()
		
func _on_ston_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = $"../../../STON".text
		
		
		header_animation_scene()
		
func _on_hiks_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = $"../../../HIKS".text
		
		
		header_animation_scene()


func _on_cl_50_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = $"../../../CL50".text
		
		
		header_animation_scene()



