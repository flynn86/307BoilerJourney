class_name Inventory extends NinePatchRect

func _ready():
	%title.text = "- Collectibles -"
	%title.visible_characters = -1

#var inventory_slot_res = preload("res://scenes/Inventory/inventory_slot.tscn")
#@export var name : String
#@export var size : int = 0 : set = set_inventory_size
#@onready var title = get_node("title")

var slots : Array = []

# Called when the node enters the scene tree for the first time.
#func _ready():
	#var title = get_node("title")
	#for s in slots:
		#%slot_container.add_child(s)
		
	#%title.text = "- " + name + " -"
	#SignalManager.emit_signal("inventory_ready", self)


#func set_inventory_size(value):
	#size = value
	#custom_minimum_size.y = 40 + (ceil(size/5.0) - 1) * 22
	
	#for s in size:
		#var new_slot = inventory_slot_res.instance()
		#slots.append(new_slot)
		
func add_item(item):
	for s in slots:
		if not s.item:
			$slotcontainer/slot1/TextureRect.visible = true
			return
