class_name Inventory extends NinePatchRect
#var inventory_slot_res = preload("res://scenes/Inventory/inventory_slot.tscn")
#@export var name : String
#@export var size : int = 0 : set = set_inventory_size
#@onready var title = get_node("title")



# Called when the node enters the scene tree for the first time.
#func _ready():
	#var title = get_node("title")
	#for s in slots:
		#%slot_container.add_child(s)
		
	#%title.text = "- " + name + " -"
	#SignalManager.emit_signal("inventory_ready", self)
		
#func add_item(item):
	#Attributes.items.append(item)
	
#func remove_item(item):
	#Attributes.items.erase(item)
