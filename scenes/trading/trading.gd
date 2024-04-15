extends Node2D

@onready var table_index = 0;
# Called when the node enters the scene tree for the first time.
func _ready():
	var trade = {
		"player1_items" : {"data_type":"text"},
		"player2_items" : {"data_type":"text"}
	}
	(Attributes.database).create_table("Trade", trade)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
