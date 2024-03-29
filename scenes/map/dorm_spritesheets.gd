extends Node



const bed_spritesheet = {
	0 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_1.png"),
	1 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_2.png"),
	2 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_3.png"),
	3 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_4.png"),
	4 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_5.png"),
	5 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_6.png"),
	6 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_7.png"),
	7 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_8.png"),
	8 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_9.png"),
	9 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_10.png"),
	10 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_11.png"),
	11 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_12.png"),
	12 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_13.png"),
	13 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_14.png"),
	14 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_15.png"),
	15 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_16.png"),
	16 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_17.png"),
	17 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_18.png"),
	18 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_19.png"),
	19 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_20.png"),
	20 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_21.png"),
	21 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_22.png"),
	22 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_23.png"),
	23 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_24.png"),
	24 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_25.png"),
	25 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_26.png"),
	26 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_27.png"),
	27 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_28.png"),
	28 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_29.png"),
	29 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_30.png"),
	30 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_31.png"),
	31 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_32.png"),
	32 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_33.png"),
	33 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_34.png"),
	34 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_35.png"),
	35 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_36.png"),
	36 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_37.png"),
	37 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_38.png"),
	38 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_39.png"),
	39 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_40.png"),
	40 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_41.png"),
	41 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_42.png"),
	42 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_43.png"),
	43 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_44.png"),
	44 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_45.png"),
	45 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_46.png"),
	46 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_47.png"),
	47 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_48.png"),
	48 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_49.png"),
	49 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_50.png"),
	50 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_51.png"),
	51 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_52.png"),
	52 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_53.png"),
	53 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_54.png"),
	54 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_55.png"),
	55 : preload("res://scenes/map/dorm_bed_assets/Bedroom_Singles_56.png"),
}



const desk_spritesheet = {
	0 : preload("res://scenes/map/dorm_desk_assets/Bedroom_Singles_429.png"),
	1 : preload("res://scenes/map/dorm_desk_assets/Bedroom_Singles_430.png"),
	2 : preload("res://scenes/map/dorm_desk_assets/Bedroom_Singles_431.png"),
	3 : preload("res://scenes/map/dorm_desk_assets/Bedroom_Singles_432.png"),
}

const window_spritesheet = {
	0 : preload("res://scenes/map/dorm_window_assets/Bedroom_Singles_421.png"),
	1 : preload("res://scenes/map/dorm_window_assets/Bedroom_Singles_57.png"),
	2 : preload("res://scenes/map/dorm_window_assets/Bedroom_Singles_58.png"),
	3 : preload("res://scenes/map/dorm_window_assets/Bedroom_Singles_59.png"),
	4 : preload("res://scenes/map/dorm_window_assets/Bedroom_Singles_60.png"),
	5 : preload("res://scenes/map/dorm_window_assets/Bedroom_Singles_61.png"),
	6 : preload("res://scenes/map/dorm_window_assets/Bedroom_Singles_62.png")
}

const sidetable_spritesheet = {
	0 : preload("res://scenes/map/dorm_room_assets/Bedroom_Singles_393.png"),
	1 : preload("res://scenes/map/dorm_room_assets/Bedroom_Singles_394.png"),
	2 : preload("res://scenes/map/dorm_room_assets/Bedroom_Singles_395.png"),
	3 : preload("res://scenes/map/dorm_room_assets/Bedroom_Singles_396.png"),
	4 : preload("res://scenes/map/dorm_room_assets/Bedroom_Singles_397.png"),
	5 : preload("res://scenes/map/dorm_room_assets/Bedroom_Singles_398.png"),
	6 : preload("res://scenes/map/dorm_room_assets/Bedroom_Singles_399.png"),
	7 : preload("res://scenes/map/dorm_room_assets/Bedroom_Singles_400.png"),
	8 : preload("res://scenes/map/dorm_room_assets/Bedroom_Singles_401.png"),
	9 : preload("res://scenes/map/dorm_room_assets/Bedroom_Singles_402.png"),
	10 : preload("res://scenes/map/dorm_room_assets/Bedroom_Singles_403.png"),
	11 : preload("res://scenes/map/dorm_room_assets/Bedroom_Singles_404.png"),
	12 : preload("res://scenes/map/dorm_room_assets/Bedroom_Singles_405.png"),
	13 : preload("res://scenes/map/dorm_room_assets/Bedroom_Singles_406.png"),
	14 : preload("res://scenes/map/dorm_room_assets/Bedroom_Singles_407.png"),
	15 : preload("res://scenes/map/dorm_room_assets/Bedroom_Singles_408.png"),
	16 : preload("res://scenes/map/dorm_room_assets/Bedroom_Singles_409.png"),
	17 : preload("res://scenes/map/dorm_room_assets/Bedroom_Singles_410.png"),
	18 : preload("res://scenes/map/dorm_room_assets/Bedroom_Singles_411.png"),
	19 : preload("res://scenes/map/dorm_room_assets/Bedroom_Singles_412.png"),
	20 : preload("res://scenes/map/dorm_room_assets/Bedroom_Singles_413.png"),
	21 : preload("res://scenes/map/dorm_room_assets/Bedroom_Singles_414.png"),
	22 : preload("res://scenes/map/dorm_room_assets/Bedroom_Singles_415.png"),
	23 : preload("res://scenes/map/dorm_room_assets/Bedroom_Singles_416.png")
}

