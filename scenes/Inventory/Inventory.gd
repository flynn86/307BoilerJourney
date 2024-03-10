class_name Inventory extends NinePatchRect

export( String ) var inventory_name
export( int ) var size = 0 setget set_inventory_size

export(NodePath) onready var title = get_node(title) as Label
export(NodePath) onready var slot_container = get_node(slot_container) as Control

var slots : Array = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func set_inventory_size(value):
	pass
