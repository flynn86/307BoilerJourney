class_name Inventory_Slot extends TextureRect

var item

# Called when the node enters the scene tree for the first time.
func _ready():
	if item:
		%item_container.add_child(item)

func set_item(new_item):
	item = new_item
	
func pick_item():
	%item_container.remove_child(item)
	item = null

func put_item(new_item):
	item = new_item
	#item.put_item()
	%item_container.add_child(item)
