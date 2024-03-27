extends NinePatchRect

var slots : Array = []


func _ready():
	var main_title = get_child(0)
	var main_title_label = main_title.get_child(0)
	var close_button = get_child(1)
	var inventory_container = get_child(2)
	var inventory_patch = inventory_container.get_child(0)
	var title_header = inventory_patch.get_child(0)
	var title = title_header.get_child(0)
	var slot_container = inventory_patch.get_child(1)
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

func _on_close_pressed():
	close()
	
func close():
	get_tree().change_scene_to_file("res://scenes/map/academic_map.tscn")
