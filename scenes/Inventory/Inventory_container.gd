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

@onready var item_info = get_child(3)
@onready var item_info_title_label = item_info.get_child(0).get_child(0)
@onready var item_info_icon_slot = item_info.get_child(1).get_child(0).get_child(0)
@onready var description = item_info.get_child(2).get_child(0)
@onready var item_info_close_button = item_info.get_child(3)

<<<<<<< HEAD
func _ready():
	var main_title = get_child(0)
	var main_title_label = main_title.get_child(0)
	var close_button = get_child(1)
	var inventory_container = get_child(2)
	var inventory_patch = inventory_container.get_child(0)
	var title_header = inventory_patch.get_child(0)
	var title = title_header.get_child(0)
	var slot_container = inventory_patch.get_child(1)
	
	item_info.visible = false
	title.text = "- Collectibles -"
	title.visible_characters = -1
	var size = Attributes.items.size()
	if (size > 0):
		for i in range(0, size, 1):
			var slot_sprite_i = slot_container.get_child(i).get_child(0).get_child(0)
			slot_sprite_i.texture = ItemManager.icons[Attributes.items[i]]
			var final_scale = Vector2(ItemManager.scale[Attributes.items[i]],ItemManager.scale[Attributes.items[i]])
			slot_sprite_i.scale = final_scale
			var final_position = Vector2(10,10)
			slot_sprite_i.position = final_position
			slot_sprite_i.visible = true

=======
>>>>>>> parent of 306e1de (Rewrote the code to utilize Attributes script)
func _on_close_pressed():
	item_info.visible = false
	close()
	
func close():
	var last_location = Attributes.location
	get_tree().change_scene_to_file(last_location)

func _on_item_info_close_pressed():
	item_info.visible = false

func _on_slot_1_pressed():
	var size = Attributes.items.size()
	if (size > 0):
		item_info_title_label.text = ItemManager.names[Attributes.items[0]]
		item_info_icon_slot.texture = ItemManager.icons[Attributes.items[0]]
		var final_scale = Vector2(ItemManager.scale[Attributes.items[0]],ItemManager.scale[Attributes.items[0]])
		item_info_icon_slot.scale = final_scale
		var final_position = Vector2(10,10)
		item_info_icon_slot.position = final_position
		description.text = "“" + ItemManager.descriptions[Attributes.items[0]] + "\""
		item_info.visible = true




func _on_slot_2_pressed():
	var size = Attributes.items.size()
	if (size > 1):
		item_info_title_label.text = ItemManager.names[Attributes.items[1]]
		item_info_icon_slot.texture = ItemManager.icons[Attributes.items[1]]
		var final_scale = Vector2(ItemManager.scale[Attributes.items[1]],ItemManager.scale[Attributes.items[1]])
		item_info_icon_slot.scale = final_scale
		var final_position = Vector2(10,10)
		item_info_icon_slot.position = final_position
		description.text = "“" + ItemManager.descriptions[Attributes.items[1]] + "\""
		item_info.visible = true


func _on_slot_3_pressed():
	var size = Attributes.items.size()
	if (size > 2):
		item_info_title_label.text = ItemManager.names[Attributes.items[2]]
		item_info_icon_slot.texture = ItemManager.icons[Attributes.items[2]]
		var final_scale = Vector2(ItemManager.scale[Attributes.items[2]],ItemManager.scale[Attributes.items[2]])
		item_info_icon_slot.scale = final_scale
		var final_position = Vector2(10,10)
		item_info_icon_slot.position = final_position
		description.text = "“" + ItemManager.descriptions[Attributes.items[2]] + "\""
		item_info.visible = true


func _on_slot_4_pressed():
	var size = Attributes.items.size()
	if (size > 3):
		item_info_title_label.text = ItemManager.names[Attributes.items[3]]
		item_info_icon_slot.texture = ItemManager.icons[Attributes.items[3]]
		var final_scale = Vector2(ItemManager.scale[Attributes.items[3]],ItemManager.scale[Attributes.items[3]])
		item_info_icon_slot.scale = final_scale
		var final_position = Vector2(10,10)
		item_info_icon_slot.position = final_position
		description.text = "“" + ItemManager.descriptions[Attributes.items[3]] + "\""
		item_info.visible = true


func _on_slot_5_pressed():
	var size = Attributes.items.size()
	if (size > 4):
		item_info_title_label.text = ItemManager.names[Attributes.items[4]]
		item_info_icon_slot.texture = ItemManager.icons[Attributes.items[4]]
		var final_scale = Vector2(ItemManager.scale[Attributes.items[4]],ItemManager.scale[Attributes.items[4]])
		item_info_icon_slot.scale = final_scale
		var final_position = Vector2(10,10)
		item_info_icon_slot.position = final_position
		description.text = "“" + ItemManager.descriptions[Attributes.items[4]] + "\""
		item_info.visible = true


func _on_slot_6_pressed():
	var size = Attributes.items.size()
	if (size > 5):
		item_info_title_label.text = ItemManager.names[Attributes.items[5]]
		item_info_icon_slot.texture = ItemManager.icons[Attributes.items[5]]
		var final_scale = Vector2(ItemManager.scale[Attributes.items[5]],ItemManager.scale[Attributes.items[5]])
		item_info_icon_slot.scale = final_scale
		var final_position = Vector2(10,10)
		item_info_icon_slot.position = final_position
		description.text = "“" + ItemManager.descriptions[Attributes.items[5]] + "\""
		item_info.visible = true


func _on_slot_7_pressed():
	var size = Attributes.items.size()
	if (size > 6):
		item_info_title_label.text = ItemManager.names[Attributes.items[6]]
		item_info_icon_slot.texture = ItemManager.icons[Attributes.items[6]]
		var final_scale = Vector2(ItemManager.scale[Attributes.items[6]],ItemManager.scale[Attributes.items[6]])
		item_info_icon_slot.scale = final_scale
		var final_position = Vector2(10,10)
		item_info_icon_slot.position = final_position
		description.text = "“" + ItemManager.descriptions[Attributes.items[6]] + "\""
		item_info.visible = true


func _on_slot_8_pressed():
	var size = Attributes.items.size()
	if (size > 7):
		item_info_title_label.text = ItemManager.names[Attributes.items[7]]
		item_info_icon_slot.texture = ItemManager.icons[Attributes.items[7]]
		var final_scale = Vector2(ItemManager.scale[Attributes.items[7]],ItemManager.scale[Attributes.items[7]])
		item_info_icon_slot.scale = final_scale
		var final_position = Vector2(10,10)
		item_info_icon_slot.position = final_position
		description.text = "“" + ItemManager.descriptions[Attributes.items[7]] + "\""
		item_info.visible = true


func _on_slot_9_pressed():
	var size = Attributes.items.size()
	if (size > 8):
		item_info_title_label.text = ItemManager.names[Attributes.items[8]]
		item_info_icon_slot.texture = ItemManager.icons[Attributes.items[8]]
		var final_scale = Vector2(ItemManager.scale[Attributes.items[8]],ItemManager.scale[Attributes.items[8]])
		item_info_icon_slot.scale = final_scale
		var final_position = Vector2(10,10)
		item_info_icon_slot.position = final_position
		description.text = "“" + ItemManager.descriptions[Attributes.items[8]] + "\""
		item_info.visible = true


func _on_slot_10_pressed():
	var size = Attributes.items.size()
	if (size > 9):
		item_info_title_label.text = ItemManager.names[Attributes.items[9]]
		item_info_icon_slot.texture = ItemManager.icons[Attributes.items[9]]
		var final_scale = Vector2(ItemManager.scale[Attributes.items[9]],ItemManager.scale[Attributes.items[9]])
		item_info_icon_slot.scale = final_scale
		var final_position = Vector2(10,10)
		item_info_icon_slot.position = final_position
		description.text = "“" + ItemManager.descriptions[Attributes.items[9]] + "\""
		item_info.visible = true


func _on_slot_11_pressed():
	var size = Attributes.items.size()
	if (size > 10):
		item_info_title_label.text = ItemManager.names[Attributes.items[10]]
		item_info_icon_slot.texture = ItemManager.icons[Attributes.items[10]]
		var final_scale = Vector2(ItemManager.scale[Attributes.items[10]],ItemManager.scale[Attributes.items[10]])
		item_info_icon_slot.scale = final_scale
		var final_position = Vector2(10,10)
		item_info_icon_slot.position = final_position
		description.text = "“" + ItemManager.descriptions[Attributes.items[10]] + "\""
		item_info.visible = true


func _on_slot_12_pressed():
	var size = Attributes.items.size()
	if (size > 11):
		item_info_title_label.text = ItemManager.names[Attributes.items[11]]
		item_info_icon_slot.texture = ItemManager.icons[Attributes.items[11]]
		var final_scale = Vector2(ItemManager.scale[Attributes.items[11]],ItemManager.scale[Attributes.items[11]])
		item_info_icon_slot.scale = final_scale
		var final_position = Vector2(10,10)
		item_info_icon_slot.position = final_position
		description.text = "“" + ItemManager.descriptions[Attributes.items[11]] + "\""
		item_info.visible = true


func _on_slot_13_pressed():
	var size = Attributes.items.size()
	if (size > 12):
		item_info_title_label.text = ItemManager.names[Attributes.items[12]]
		item_info_icon_slot.texture = ItemManager.icons[Attributes.items[12]]
		var final_scale = Vector2(ItemManager.scale[Attributes.items[12]],ItemManager.scale[Attributes.items[12]])
		item_info_icon_slot.scale = final_scale
		var final_position = Vector2(10,10)
		item_info_icon_slot.position = final_position
		description.text = "“" + ItemManager.descriptions[Attributes.items[12]] + "\""
		item_info.visible = true


func _on_slot_14_pressed():
	var size = Attributes.items.size()
	if (size > 13):
		item_info_title_label.text = ItemManager.names[Attributes.items[13]]
		item_info_icon_slot.texture = ItemManager.icons[Attributes.items[13]]
		var final_scale = Vector2(ItemManager.scale[Attributes.items[13]],ItemManager.scale[Attributes.items[13]])
		item_info_icon_slot.scale = final_scale
		var final_position = Vector2(10,10)
		item_info_icon_slot.position = final_position
		description.text = "“" + ItemManager.descriptions[Attributes.items[13]] + "\""
		item_info.visible = true


func _on_slot_15_pressed():
	var size = Attributes.items.size()
	if (size > 14):
		item_info_title_label.text = ItemManager.names[Attributes.items[14]]
		item_info_icon_slot.texture = ItemManager.icons[Attributes.items[14]]
		var final_scale = Vector2(ItemManager.scale[Attributes.items[14]],ItemManager.scale[Attributes.items[14]])
		item_info_icon_slot.scale = final_scale
		var final_position = Vector2(10,10)
		item_info_icon_slot.position = final_position
		description.text = "“" + ItemManager.descriptions[Attributes.items[14]] + "\""
		item_info.visible = true
