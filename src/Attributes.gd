extends Node

#var xp: int = 0
var username: String = ""
var xhousing: float = float(256)
var yhousing: float = float(256)
var xacademic: float = float(-855.100219726562)
var yacademic: float = float(-1381.95544433594)
var location: String = "res://scenes/map/academic_map.tscn"
var collectibleA: bool = false
var collectibleH: bool = false
var curr_hair: int = 0
var curr_eyes: int = 0
var curr_body: int = 0
var curr_outfit: int = 0
var filename: String = "res://savefiles/save1.bin"
var season: String = "Summer"
var night: bool = false
#var walk_right: AnimationPlayer

func reset(file: String):
	username = ""
	xhousing = float(256)
	yhousing = float(256)
	xacademic = float(-855.100219726562)
	yacademic = float(-1381.95544433594)
	location = "res://scenes/map/academic_map.tscn"
	collectibleA = false
	collectibleH = false
	curr_hair = 0
	curr_eyes = 0
	curr_body = 0
	curr_outfit = 0
	filename = file
	season = "Summer"
	night = false
