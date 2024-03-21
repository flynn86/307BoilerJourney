extends SubViewport

@onready var camera = $Camera2D
@onready var player = $"../.."

func _physics_process(delta):
	var tilemap_size = Vector2(7280, 10752)
	var minimap_size = Vector2(1066, 1354)  
	var player_ratio = player.global_position / tilemap_size
	var player_minimap_position = player_ratio * minimap_size
	camera.position = player_minimap_position + Vector2(259.32232, 655.2879)
