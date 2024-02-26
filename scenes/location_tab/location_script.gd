extends Panel

const API_KEY = "AIzaSyBL6GUlNHADw9doUkqDTruMpd_isSYmX4k"
const GOOGLE_PLACES_URL = "https://maps.googleapis.com/maps/api/place/details/json"

var name_to_place_id = {
	"WALC": "ChIJBwU-Qjf9EogRcxMcZBGjqzY",  
	"ARMS": "ChIJRxJn0bLiEogR-1xB2rxwk2s",
	"ELLT": "ChIJCaIHWLHiEogRdcn9QShJb4o",
	"PHYS":  "ChIJAWzjuLLiEogRKTU5J1H2Qpc",
	"WTHR":  "ChIJadYFELLiEogRtcTAIpFtifo",
	"STEW": "ChIJMVeK5LHiEogRhSHpglGKgyc",
	"HAMP": "ChIJrzuOKLPiEogR4cE1Pz-tOao",
}

func display_content(name: String) -> void:
	var name_label = get_node("location_name") as RichTextLabel
	var picture = get_node("location_picture") as TextureRect
	var info_text = get_node("location_information") as RichTextLabel 
	
	if (name == "WALC"):
		name_label.text = "Wilmeth Active Learning Center"
	elif (name == "ARMS"):
		name_label.text = "Neil Armstrong Hall of Engineering"
	elif (name == "ELLT"):
		name_label.text = "Elliot Hall of Music"
	elif (name == "PHYS"):
		name_label.text = "Purdue Physics Building"
	elif (name == "WTHR"):
		name_label.text = "Wetherill Hall of Chemistry"
	elif (name == "STEW"):
		name_label.text = "Stewart Center"
	elif (name == "HAMP"):
		name_label.text = "Hampton Hall"
	else:
		name_label.text = name
	
	# Load and display the picture
	var image_path = "res://location_information/loc_image/%s.jpeg" % name
	var image = load(image_path)
	if image:
		picture.texture = image
		picture.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		picture.expand = true
	else:
		print("Image not found: %s" % image_path)
	
	# Load and display the text
	var text_path = "res://location_information/loc_text/%s.txt" % name
	if FileAccess.file_exists(text_path):
		var file = FileAccess.open(text_path, FileAccess.READ)
		var text_content = file.get_as_text()
		info_text.text = text_content
		file.close()
	else:
		print("Text file not found: %s" % text_path)
		
	fetch_star_rating(name)
		
func fetch_star_rating(name: String) -> void:
	if name in name_to_place_id:
		var place_id = name_to_place_id[name]
		var url = "%s?place_id=%s&fields=rating&key=%s" % [GOOGLE_PLACES_URL, place_id, API_KEY]
		$ReviewRequest.request(url)
	else:
		print("Place ID not found for the given name.")

func _on_review_request_request_completed(result, response_code, headers, body):
	var response = body.get_string_from_utf8()
	var rating_index = response.find("\"rating\" :") + 11
	var rating_str = response.substr(rating_index).strip_edges(true, false)
	var rating_end = min(rating_str.find("\n"), rating_str.find("}"))
	rating_str = rating_str.substr(0, rating_end).strip_edges(true)
	var rating = float(rating_str)
	display_rating(rating)

func display_rating(rating: float) -> void:
	var picture = get_node("rating_picture") as TextureRect
	var rating_text = get_node("rating_desc") as RichTextLabel 
	
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
		
	rating_text.text = "%0.1f Stars" % rating

func _ready():
	display_content("ELLT")

