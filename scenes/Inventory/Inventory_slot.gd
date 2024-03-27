#extends TextureRect

#var item : Item
#var item_container = get_child(0)

# 
#func _ready():
	#if item:
		#item_container.add_child(item)
		
#func get_item(item):
	#return item

#func set_item(new_item):#
	#item = new_item

#func pick_item():
	#item_container.remove_child(item)
	#item = null

#func put_item(new_item):
	#item = new_item
	#item_container.add_child(item)
