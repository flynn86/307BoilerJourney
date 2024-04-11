extends Panel

const API_KEY = "AIzaSyBL6GUlNHADw9doUkqDTruMpd_isSYmX4k"
const GOOGLE_PLACES_URL = "https://maps.googleapis.com/maps/api/place/details/json"

func _ready():
	get_node("Panel").visible = false

func _on_return_pressed():
	get_tree().change_scene_to_file("res://scenes/PMU_scene/pmu_scene.tscn")
	
func _on_exit_panel_pressed():
	get_node("Panel").visible = false

func _on_trippleXXX_pressed():
	_display_information("Tripple XXX Family Restaurant", "Tripple XXX Family Restaurant: 
Old-school institution for burgers, root beer & other soda-fountain treats, plus breakfast all day
Address: 2 N Salisbury St, West Lafayette, IN 47906
Hours: 
	Monday	7 AM–10 PM
	Tuesday	Closed
	Wednesday	7 AM–10 PM
	Thursday	7 AM–10 PM
	Friday	7 AM–10 PM
	Saturday	7 AM–10 PM
	Sunday	7 AM–10 PM")
	
func _on_811_pressed():
	_display_information("8Eleven Modern Bistro", "8Eleven Modern Bistro: 
Old-school institution for burgers, root beer & other soda-fountain treats, plus breakfast all day
Address: 2 N Salisbury St, West Lafayette, IN 47906
Hours: 
	Monday	7 AM–10 PM
	Tuesday	Closed
	Wednesday	7 AM–10 PM
	Thursday	7 AM–10 PM
	Friday	7 AM–10 PM
	Saturday	7 AM–10 PM
	Sunday	7 AM–10 PM")
	
func _display_information(name, description): 
	$Panel/RichTextLabel.text = description
	get_node("Panel").visible = true

