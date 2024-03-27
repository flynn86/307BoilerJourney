class_name Inventory extends NinePatchRect

var slots : Array = []

func _ready():
	var title = get_child(0).get_child(0)
	title.text = "- Collectibles -"
	title.visible_characters = -1
	slots.append($slot_container/slot1)
	slots.append($slot_container/slot2)
	slots.append($slot_container/slot3)
	slots.append($slot_container/slot4)
	slots.append($slot_container/slot5)
	slots.append($slot_container/slot6)
	slots.append($slot_container/slot7)
	slots.append($slot_container/slot8)
	slots.append($slot_container/slot9)
	slots.append($slot_container/slot10)
	slots.append($slot_container/slot11)
	slots.append($slot_container/slot12)
	slots.append($slot_container/slot13)
	slots.append($slot_container/slot14)
	slots.append($slot_container/slot15)

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
		
func add_item(item):
	for s in slots:
		if not s.item:
			var sprite 
			#get_node(string).visible = true
			return
