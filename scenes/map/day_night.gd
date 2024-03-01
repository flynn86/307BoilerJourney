extends CanvasModulate

var state = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (state == 0):
		visible = false
	else:
		visible = true
