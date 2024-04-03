extends Panel

var api_key := "pub_41252d0a4f7ccf0251cbaed195bb651da770e"
var base_url := "https://newsdata.io/api/1/news"

func get_news():
	var http_request = $HTTPRequest
	var query_string = "?apikey=" + api_key + "&q=" + "Purdue"
	var full_url = base_url + query_string
	http_request.request(full_url)

func _ready():
	get_news()

func _on_news_request_completed(result, response_code, headers, body):
	var response = body.get_string_from_utf8()
	print(response)

func _process(delta):
	pass

