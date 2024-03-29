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
	max_scale_x = len(label.text) * scale_x_char_multiplier
	scale_x_increment = max_scale_x / 20.0
	label.position.x = 100 - (label.size.x / 2)
	header.position.x = label.position.x + (label.size.x / 4)
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
		label.text = "Stewart Center"
		header_animation_scene()


func _on_ellt_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = "Elliot Hall"
		header_animation_scene()


func _on_pmu_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = "Purdue Memorial Union"
		header_animation_scene()


func _on_wthr_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = "Wetherill Hall of Chemistry"
		header_animation_scene()


func _on_walc_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = "Wilmeth Active Learning Center"
		header_animation_scene()


func _on_hamp_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = "Hamptom Hall of Civil Engineering"
		header_animation_scene()


func _on_arms_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = "Neil Armstrong Hall of Engineering"
		header_animation_scene()


func _on_phys_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = "Physics Building"
		header_animation_scene()


func _on_ar_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = "Armory"
		header_animation_scene()



func _on_push_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = "Purdue University Student Health Center"
		header_animation_scene()

func _on_rnph_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = "Heine Pharmacy Building"
		header_animation_scene()
		
func _on_jnsn_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = "Johnson Hall of Nursing"
		header_animation_scene()

func _on_frny_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = "Forney Hall of Chemical Engineering"
		header_animation_scene()


func _on_dscb_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = "Schleman Hall of Student Services"
		header_animation_scene()
		
func _on_msee_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = "Materials and Electrical Engineering Building"
		header_animation_scene()
		
func _on_chas_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = "Chaney-Hale Hall of Science"
		header_animation_scene()
		
func _on_bhee_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = "Brown Family Hall"
		header_animation_scene()
		
func _on_hovd_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = "Hovde Hall of Administration"
		header_animation_scene()
		
func _on_me_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = "Mechanical Engineering Building"
		header_animation_scene()
		
func _on_brwn_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = "Brown Laboratory of Chemistry"
		header_animation_scene()
		
func _on_potr_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = "Potter Engineering Center"
		header_animation_scene()
		
func _on_lmbs_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = "Lambertus Hall"
		header_animation_scene()
		
func _on_knoy_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = "Knoy Hall of Technology"
		header_animation_scene()
		
func _on_dudl_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = "Dudley Hall"
		header_animation_scene()
		
func _on_haas_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = "Haas Hall"
		header_animation_scene()
		
func _on_psyc_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = "Psychological Sciences Building"
		header_animation_scene()
		
func _on_prce_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = "Peirce Hall"
		header_animation_scene()
		

		
func _on_math_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = "Mathematical Sciences Building"
		header_animation_scene()
		
func _on_sc_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = "Stanley Coulter Hall"
		header_animation_scene()
		
func _on_heav_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = "Heavilon Hall"
		header_animation_scene()

func _on_gris_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = "Grissom Hall"
		header_animation_scene()
		
func _on_BRNG_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = "Beering Hall of Liberal Arts and Education"
		header_animation_scene()
		
func _on_schm_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = "Schleman Hall"
		header_animation_scene()

func _on_univ_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = "University Hall"
		header_animation_scene()
		
func _on_mthw_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = "Matthews Hall"
		header_animation_scene()
		
func _on_ston_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = "Stone Hall"
		header_animation_scene()
		
func _on_hiks_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = "Hicks Undergraduate Library"
		header_animation_scene()


func _on_cl_50_area_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = "Class of 1950 Lecture Hall"
		header_animation_scene()

func _on_engineering_fountain_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = "Engineering Fountain"
		header_animation_scene()

func _on_bell_tower_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = "Bell Tower"
		header_animation_scene()

func _on_loeb_fountain_body_entered(body):
	if (body.is_in_group("player") && !in_execution):
		label.text = "Loeb Fountain"
		header_animation_scene()
