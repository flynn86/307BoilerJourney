extends Panel


# Called when the node enters the scene tree for the first time.
func _ready():
	OS.shell_open("https://boilerlink.purdue.edu/events")
	#$ClubRequest.request("https://www.pnw.edu/student-life/get-involved/organizations-listing/")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func _on_club_request_request_completed(result, response_code, headers, body):
	var response = body.get_string_from_utf8()
	print(response)
