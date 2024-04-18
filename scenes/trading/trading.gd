extends Node2D

@onready var trading_container = get_child(0)
@onready var inventory_container = get_child(1)

var temp_inventory : Array = []
var trade_return : Array = []
var temp_trade_inventory : Array = []
var sender : String
var receiver : String
var trading : bool = false
var vacant_trade : Array = []
var your_trade_size : int
var database_table : String = ""
var your_string : String = ""
var their_string : String = ""

var frame_counter = 0

@onready var your_slot_container = $Trading_container/Your_Offer_Container/Your_Offer_Inventory/your_slot_container
@onready var their_slot_container = $Trading_container/Their_Offer_Container/Their_Offer_Inventory/their_slot_container

func _ready():
	sender = Attributes.trade_sender
	receiver = Attributes.trade_receiver
	database_table = sender + "AND" + receiver
	if (sender == Attributes.username):
		your_string = sender + "_offer"
		their_string = receiver + "_offer"
	else:
		your_string = receiver + "_offer"
		their_string = sender + "_offer"
	var inventory_title = $Temp_Inventory/Inventory_container/inventory_patch/title_header/inventory_title
	var slot_container = $Temp_Inventory/Inventory_container/inventory_patch/slot_container
	var your_title = $Trading_container/Your_Offer_Container/Your_Offer_Inventory/your_offer_header/your_title
	var their_title = $Trading_container/Their_Offer_Container/Their_Offer_Inventory/other_player_offer_header/their_title
#	your_slot_container = $Trading_container/Your_Offer_Container/Your_Offer_Inventory/your_slot_container
#	their_slot_container = $Trading_container/Their_Offer_Container/Their_Offer_Inventory/their_slot_container
	$AcceptButton.modulate.a = 1
	$DeclineButton.modulate.a = 1
	your_trade_size = 0
	vacant_trade.resize(4)
	vacant_trade.fill(0) # 0 means vacant slot, 1 means occupied slot
	temp_inventory.resize(15)
	temp_inventory.fill(-1)
	for i in range(0,Attributes.items.size(),1):
		temp_inventory[i] = Attributes.items[i]
	trade_return.resize(4)
	trade_return.fill(-1)
	temp_trade_inventory.resize(4)
	temp_trade_inventory.fill(-1)
	inventory_title.text = "- Collectibles -"
	inventory_title.visible_characters = -1
	your_title.visible_characters = -1
	their_title.visible_characters = -1
	var size = Attributes.items.size()
	if (size > 0):
		for i in range(0, size, 1):
			var slot_sprite_i = slot_container.get_child(i).get_child(0).get_child(0)
			slot_sprite_i.texture = ItemManager.icons[Attributes.items[i]]
			slot_sprite_i.scale = Vector2(ItemManager.scale[Attributes.items[i]],ItemManager.scale[Attributes.items[i]])
			slot_sprite_i.position = Vector2(10,10)
			slot_sprite_i.visible = true
	trading = true

func _process(_delta):
	if (trading == true):
		frame_counter += 1
		if (frame_counter > 30):
			if (trading == true):
				check_trade_end()
			if (trading == true):
				check_trade_accept()
			if (trading == true):
				update_trade_slots()
			frame_counter = 0
#	if (trading == true):
#		check_trade_end()
#	if (trading == true):
#		check_trade_accept()
#	if (trading == true):
#		update_trade_slots()
			

func update_trade_slots():
	var index = 0
	var ret = (Attributes.database).query("SELECT * FROM " + database_table)
	if (ret == false):
		return
	var trade_slots = (Attributes.database).query_result
	for trade_slot in trade_slots:
		var your_item : String = trade_slot[your_string]
		var their_item : String = trade_slot[their_string]
		var your_slot_i = your_slot_container.get_child(index).get_child(0).get_child(0)
		var their_slot_i = their_slot_container.get_child(index).get_child(0).get_child(0)
		if ! (your_item == "empty"):
			var your_item_index = ItemManager.name_to_index(your_item)
			your_slot_i.texture = ItemManager.icons[your_item_index]
			your_slot_i.scale = Vector2(ItemManager.scale[your_item_index],ItemManager.scale[your_item_index])
			your_slot_i.position = Vector2(10,10)
		else:
			your_slot_container.get_child(index).get_child(0).get_child(0).texture = null
		if ! (their_item == "empty"):
			var their_item_index = ItemManager.name_to_index(their_item)
			their_slot_i.texture = ItemManager.icons[their_item_index]
			their_slot_i.scale = Vector2(ItemManager.scale[their_item_index],ItemManager.scale[their_item_index])
			their_slot_i.position = Vector2(10,10)
		else:
			their_slot_container.get_child(index).get_child(0).get_child(0).texture = null
		index += 1
		

func inventory_to_trade(slot_num : int):
	if (your_trade_size < 4): # If not all trade slots are occupied
		if (temp_inventory[slot_num - 1] != -1): # If you have an item at this inventory slot
			var vacant_slot : int = vacant_trade.find(0) + 1 # Find a vacant trade slot
			(Attributes.database).update_rows(database_table, "slot = " + str(vacant_slot), {your_string : ItemManager.names[Attributes.items[slot_num - 1]]})
			your_trade_size += 1
			temp_trade_inventory[vacant_slot - 1] = temp_inventory[slot_num - 1]
			temp_inventory[slot_num - 1] = -1
			trade_return[vacant_slot - 1] = slot_num - 1
			vacant_trade[vacant_slot - 1] = 1
			
func trade_to_inventory(slot_num : int):
	if (vacant_trade[slot_num - 1] == 1): # If this trade slot is occupied
		(Attributes.database).update_rows(database_table, "slot = " + str(slot_num), {your_string : "empty"})
		your_trade_size -= 1
		temp_inventory[trade_return[slot_num - 1]] = temp_trade_inventory[slot_num - 1]
		temp_trade_inventory[slot_num - 1] = -1
		trade_return[slot_num - 1] = -1
		vacant_trade[slot_num - 1] = 0

func _on_slot_1_pressed():
	inventory_to_trade(1)
func _on_slot_2_pressed():
	inventory_to_trade(2)
func _on_slot_3_pressed():
	inventory_to_trade(3)
func _on_slot_4_pressed():
	inventory_to_trade(4)
func _on_slot_5_pressed():
	inventory_to_trade(5)
func _on_slot_6_pressed():
	inventory_to_trade(6)
func _on_slot_7_pressed():
	inventory_to_trade(7)
func _on_slot_8_pressed():
	inventory_to_trade(8)
func _on_slot_9_pressed():
	inventory_to_trade(9)
func _on_slot_10_pressed():
	inventory_to_trade(10)
func _on_slot_11_pressed():
	inventory_to_trade(11)
func _on_slot_12_pressed():
	inventory_to_trade(12)
func _on_slot_13_pressed():
	inventory_to_trade(13)
func _on_slot_14_pressed():
	inventory_to_trade(14)
func _on_slot_15_pressed():
	inventory_to_trade(15)
	
func _on_your_1_pressed():
	trade_to_inventory(1)
func _on_your_2_pressed():
	trade_to_inventory(2)
func _on_your_3_pressed():
	trade_to_inventory(3)
func _on_your_4_pressed():
	trade_to_inventory(4)

func check_trade_end():
	var ret = (Attributes.database).query("SELECT sender FROM Trade_Requests WHERE sender = '" + sender + "' AND receiver = '" + receiver + "'")
	while (ret == false):
		await get_tree().create_timer(0.02).timeout
		ret = (Attributes.database).query("SELECT sender FROM Trade_Requests WHERE sender = '" + sender + "' AND receiver = '" + receiver + "'")
	if ! ((Attributes.database).query_result):
		trading = false
		get_tree().change_scene_to_file(Attributes.location)
		Attributes.database.query("DROP TABLE " + sender + "AND" + receiver)

func _on_close_pressed():
	trading = false
	get_tree().change_scene_to_file(Attributes.location)
	(Attributes.database).delete_rows("Trade_Requests", "sender = '" + sender + "' AND receiver = '" + receiver + "'")

func _on_decline_button_pressed():
	$DeclineButton.modulate.a = 0.5
	trading = false
	get_tree().change_scene_to_file(Attributes.location)
	(Attributes.database).delete_rows("Trade_Requests", "sender = '" + sender + "' AND receiver = '" + receiver + "'")
	
func _notification(notif): 
	if notif == NOTIFICATION_WM_CLOSE_REQUEST: 
		(Attributes.database).delete_rows("Trade_Requests", "sender = '" + sender + "' AND receiver = '" + receiver + "'")
		Attributes.database.query("DROP TABLE " + sender + "AND" + receiver)

func check_trade_accept():
	var ret = Attributes.database.query("SELECT status FROM Trade_Requests WHERE sender = '" + sender + "' AND receiver = '" + receiver + "'")
	if (ret == false):
		return
	var status : int = (Attributes.database).query_result[0]["status"]
	if (status == 3):
		trading = false
		Attributes.database.query("SELECT " + your_string + " FROM " + sender + "AND" + receiver)
		var your_offers = (Attributes.database).query_result
		for your_offer in your_offers:
			if (your_offer[your_string] != "empty"):
				Attributes.items.erase(ItemManager.name_to_index(your_offer[your_string]))
		# Add their items
		Attributes.database.query("SELECT " + their_string + " FROM " + sender + "AND" + receiver)
		var their_offers = (Attributes.database).query_result
		for their_offer in their_offers:
			if (their_offer[their_string] != "empty"):
				Attributes.items.append(ItemManager.name_to_index(their_offer[their_string]))
		SaveUtils.save()
		get_tree().change_scene_to_file(Attributes.location)
		(Attributes.database).delete_rows("Trade_Requests", "sender = '" + sender + "' AND receiver = '" + receiver + "'")
		Attributes.database.query("DROP TABLE " + sender + "AND" + receiver)

func _on_accept_button_pressed():
	$AcceptButton.modulate.a = 0.5
	var ret = Attributes.database.query("SELECT status FROM Trade_Requests WHERE sender = '" + sender + "' AND receiver = '" + receiver + "'")
	while (ret == false):
		await get_tree().create_timer(0.01).timeout
		ret = Attributes.database.query("SELECT status FROM Trade_Requests WHERE sender = '" + sender + "' AND receiver = '" + receiver + "'")
	var status : int = (Attributes.database).query_result[0]["status"]
	if (status == 2):
		trading = false
		# Remove your items
		Attributes.database.query("SELECT " + your_string + " FROM " + sender + "AND" + receiver)
		var your_offers = (Attributes.database).query_result
		for your_offer in your_offers:
			if (your_offer[your_string] != "empty"):
				Attributes.items.erase(ItemManager.name_to_index(your_offer[your_string]))
		# Add their items
		Attributes.database.query("SELECT " + their_string + " FROM " + sender + "AND" + receiver)
		var their_offers = (Attributes.database).query_result
		for their_offer in their_offers:
			if (their_offer[their_string] != "empty"):
				Attributes.items.append(ItemManager.name_to_index(their_offer[their_string]))
		SaveUtils.save()
		get_tree().change_scene_to_file(Attributes.location)
		(Attributes.database).update_rows("Trade_Requests", "sender = '" + sender + "' AND receiver = '" + receiver + "'", {"status": 3})
	elif (status == 1):
		(Attributes.database).update_rows("Trade_Requests", "sender = '" + sender + "' AND receiver = '" + receiver + "'", {"status": 2})
