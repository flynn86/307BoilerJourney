extends NinePatchRect

#var current_inventories : Array = []
# Called when the node enters the scene tree for the first time.
#func _ready():
	#SignalManager.inventory_opened.connect( _on_inventory_opened )
	
#func close():
	#for i in current_inventories:
		#%inventory_container.remove_child(i)
	
	#current_inventories = []
	#hide()
	
#func _on_inventory_opened(inventory : Inventory):
	#if current_inventories.size() == 0:
		#custom_minimum_size.y = 20
		
	#if current_inventories.has(inventory):
		#return
		
	#%inventory_container.add_child(inventory)
	#current_inventories.append(inventory)
	#custom_minimum_size.y += inventory.custom_minimum_size.y + %inventory_container.get_constant("separation")
	#show()
	
#func _on_close_pressed():
	#close()


func _on_close_pressed():
	close()
	
func close():
	get_tree().change_scene_to_file("res://scenes/map/academic_map.tscn")
