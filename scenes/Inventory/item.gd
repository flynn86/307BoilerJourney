class_name Item extends TextureRect

var id : String
var item_name : String

func pick_item():
	mouse_filter = Control.MOUSE_FILTER_IGNORE

func put_item():
	mouse_filter = Control.MOUSE_FILTER_PASS
