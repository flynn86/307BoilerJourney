extends SubViewport

@onready var camera = $Camera2D
@onready var player = $"../../.."

func _physics_process(delta):
	var tilemap_size = Vector2(8160, 9792)
	var minimap_size = Vector2(992, 1328)  
	var player_ratio = player.global_position / tilemap_size
	var player_minimap_position = player_ratio * minimap_size
	camera.position = player_minimap_position + Vector2(275.9904, 815.1628)
