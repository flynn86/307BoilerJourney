extends Panel

var api_key := "pub_41252d0a4f7ccf0251cbaed195bb651da770e"
var base_url := "https://newsdata.io/api/1/news"
var article_data_dict = {}
var curtitle = ""

func get_news():
	var http_request = $HTTPRequest
	var query_string = "?apikey=" + api_key + "&q=" + "Purdue"
	var full_url = base_url + query_string + "&language=en"
	http_request.request(full_url)

func _ready():
	get_node("Panel").visible = false
	get_news()

func _on_news_request_completed(result, response_code, headers, body):
	var dict = {}
	var response = body.get_string_from_utf8()
	dict = JSON.parse_string(response)
	var vbox = $ScrollContainer/VBoxContainer
	var prev_title = "not"
	if "results" in response:
		var articles = dict["results"]
		for article in articles:
			var button = Button.new()
			var title = article.get("title", "No title provided")
			if title != prev_title:
				var description = article.get("description", "No description provided")
				var link = article.get("link", "No link provided")
				button.text = title
				vbox.add_child(button)
				button.connect("pressed",Callable(self,"_button_pressed").bind(button))
				article_data_dict[title] = {
					"description": description,
					"link": link
				}
			prev_title = title

func _process(delta):
	pass

func _on_return_button_pressed():
	get_tree().change_scene_to_file("res://scenes/PMU_scene/pmu_scene.tscn")

func _on_page_pressed():
	OS.shell_open("https://www.purdue.edu/newsroom/archive.html")
	
func _button_pressed(button):
	get_node("Panel").visible = true
	var article_info = article_data_dict[button.text]
	var article_description = article_info["description"]
	if article_description == null:
		$Panel/RichTextLabel.text = "No Description"
	else:
		$Panel/RichTextLabel.text = article_description
	curtitle = button.text
	
func _on_exit_panel_pressed():
	get_node("Panel").visible = false

func _on_link_pressed():
	var article_info = article_data_dict[curtitle]
	var article_link = article_info["link"]
	OS.shell_open(article_link)
