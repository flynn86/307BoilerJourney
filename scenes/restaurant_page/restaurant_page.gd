extends Panel

const API_KEY = "AIzaSyBL6GUlNHADw9doUkqDTruMpd_isSYmX4k"
const GOOGLE_PLACES_URL = "https://maps.googleapis.com/maps/api/place/details/json"

var name_to_place_id = {
	"TrippleXXX": "ChIJGWbG_KjiEogRwgDvrfdd0so", 
	"8Eleven": "ChIJkaLFi37jEogR6CEvzfZDMQg",
	"Harrys": "ChIJNx4C967iEogRjyKJNWYeSjs",
	"Bru": "ChIJrSUtTj8dE4gRhyF-fJsSshM",
}

func _ready():
	get_node("Panel").visible = false

func _on_return_pressed():
	get_tree().change_scene_to_file("res://scenes/PMU_scene/pmu_scene.tscn")
	
func _on_exit_panel_pressed():
	get_node("Panel").visible = false

func _on_trippleXXX_pressed():
	_display_information("TrippleXXX", "Tripple XXX Family Restaurant: 
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
	_display_information("8Eleven", "8Eleven Modern Bistro: 
Comfortable restaurant offering multi-cuisine classics from locally sourced ingredients.
Address: 201 S Grant St Ste 100, West Lafayette, IN 47906
Hours: 
	Monday	7 AM–2 PM, 5–11 PM
	Tuesday	7 AM–2 PM, 5–11 PM
	Wednesday	7 AM–2 PM, 5–11 PM
	Thursday	7 AM–2 PM, 5–11 PM
	Friday	7 AM–2 PM, 5–11 PM
	Saturday	7 AM–2 PM, 5–11 PM
	Sunday	7 AM–2 PM, 5–11 PM")
	
func _on_harrys_pressed():
	_display_information("Harrys", "Harry's Chocolate Shop: 
Boisterous, campus-adjacent pub serving American bar fare in a vintage setting since 1919.
Address: 329 W State St, West Lafayette, IN 47906
Hours: 
	Monday	11 AM–3 AM
	Tuesday	11 AM–3 AM
	Wednesday	11 AM–3 AM
	Thursday	11 AM–3 AM
	Friday	11 AM–3 AM
	Saturday	11 AM–3 AM
	Sunday	12 PM–3 AM")

func _on_bru_pressed():
	_display_information("Bru", "Bru Burger Bar: 
Our goal is to bring you great burgers made from the best local meats, topped with the freshest ingredients and placed in our freshly baked buns.
Address: 101 Main St Suite 100, Lafayette, IN 47901
Hours:
	Monday	11 AM–9 PM
	Tuesday	11 AM–9 PM
	Wednesday	11 AM–9 PM
	Thursday	11 AM–9 PM
	Friday	11 AM–10 PM
	Saturday	11 AM–10 PM
	Sunday	11 AM–9 PM")

func _display_information(name, description): 
	print(name)
	_make_place_request(name)
	$Panel/RichTextLabel.text = description
	get_node("Panel").visible = true
	
func _make_place_request(name):
	print(name)
	if name in name_to_place_id:
		var place_id = name_to_place_id[name]
		var url = "%s?place_id=%s&fields=rating&key=%s" % [GOOGLE_PLACES_URL, place_id, API_KEY]
		$HTTPRequest.request(url)
	else:
		print("Place ID not found for the given name.")

func _on_http_request_request_completed(result, response_code, headers, body):
	var response = body.get_string_from_utf8()
	var rating_index = response.find("\"rating\" :") + 11
	var rating_str = response.substr(rating_index).strip_edges(true, false)
	var rating_end = min(rating_str.find("\n"), rating_str.find("}"))
	rating_str = rating_str.substr(0, rating_end).strip_edges(true)
	var rating = float(rating_str)
	print(rating)
	display_rating(rating)
	
func display_rating(rating: float) -> void:
	var picture = get_node("Panel/rating_picture") as TextureRect
	
	if rating < 0.5:
		var image_path = "res://images/0_star.png"
		var image = load(image_path)
		picture.texture = image
		picture.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		picture.expand = true
	elif rating < 1:
		var image_path = "res://images/0.5_star.png"
		var image = load(image_path)
		picture.texture = image
		picture.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		picture.expand = true
	elif rating < 1.5:
		var image_path = "res://images/1_star.png"
		var image = load(image_path)
		picture.texture = image
		picture.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		picture.expand = true
	elif rating < 2:
		var image_path = "res://images/1.5_star.png"
		var image = load(image_path)
		picture.texture = image
		picture.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		picture.expand = true
	elif rating < 2.5:
		var image_path = "res://images/2_star.png"
		var image = load(image_path)
		picture.texture = image
		picture.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		picture.expand = true
	elif rating < 3:
		var image_path = "res://images/2.5_star.png"
		var image = load(image_path)
		picture.texture = image
		picture.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		picture.expand = true
	elif rating < 3.5: 
		var image_path = "res://images/3_star.png"
		var image = load(image_path)
		picture.texture = image
		picture.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		picture.expand = true
	elif rating < 4:
		var image_path = "res://images/3.5_star.png"
		var image = load(image_path)
		picture.texture = image
		picture.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		picture.expand = true
	elif rating < 4.5:
		var image_path = "res://images/4_star.png"
		var image = load(image_path)
		picture.texture = image
		picture.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		picture.expand = true
	elif rating < 5:
		var image_path = "res://images/4.5_star.png"
		var image = load(image_path)
		picture.texture = image
		picture.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		picture.expand = true
	else:
		var image_path = "res://images/5_star.png"
		var image = load(image_path)
		picture.texture = image
		picture.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		picture.expand = true
		
	$Panel/Label2.text = "%0.1f Stars" % rating


func _on_leave_pressed(extra_arg_0):
	Attributes.currentRest = extra_arg_0
	get_tree().change_scene_to_file("res://scenes/restaurant_page/review_page.tscn")
