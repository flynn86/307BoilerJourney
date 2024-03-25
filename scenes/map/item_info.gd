class_name item_info extends NinePatchRect

const Inventory_Slot = preload("res://scenes/Inventory/Inventory_slot.gd")

func display(slot : Inventory_Slot):
	global_position = slot.rect_size + slot.global_position
	%item_name.text = slot.item.item_name
	show()
