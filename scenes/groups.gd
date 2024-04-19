extends Node2D

@onready var g1_join = $Panel/GroupList/Group1/g1join
@onready var g2_join = $Panel/GroupList/Group2/g2join
@onready var g3_join = $Panel/GroupList/Group3/g3join
@onready var g4_join = $Panel/GroupList/Group4/g4join
@onready var g5_join = $Panel/GroupList/Group5/g5join
@onready var info_text = $Panel/InfoDisplay/InfoText
@onready var member_list_text = $"Panel/Group Member List/MemberListText"

var abc_group = Attributes.abc_group
var printing_3d_group = Attributes.printing_3d_group
var asme_group = Attributes.asme_group
var acm_group = Attributes.acm_group
var bgc_group = Attributes.bgc_group

# Called when the node enters the scene tree for the first time.
func _ready():
	update_join_button()
	
func update_join_button():
	if (Attributes.abc_group == false):
		g1_join.text = "Join"
		g1_join.modulate.a = 1
	else:
		g1_join.text = "Joined"
		g1_join.modulate.a = 0.5
	if (Attributes.printing_3d_group == false):
		g2_join.text = "Join"
		g2_join.modulate.a = 1
	else:
		g2_join.text = "Joined"
		g2_join.modulate.a = 0.5
	if (Attributes.asme_group == false):
		g3_join.text = "Join"
		g3_join.modulate.a = 1
	else:
		g3_join.text = "Joined"
		g3_join.modulate.a = 0.5
	if (Attributes.acm_group == false):
		g4_join.text = "Join"
		g4_join.modulate.a = 1
	else:
		g4_join.text = "Joined"
		g4_join.modulate.a = 0.5
	if (Attributes.bgc_group == false):
		g5_join.text = "Join"
		g5_join.modulate.a = 1
	else:
		g5_join.text = "Joined"
		g5_join.modulate.a = 0.5

func update_info(groupNum : int):
	if (groupNum == 1):
		info_text.text = "Learn how to develop and grow your own bonsai. Delve into the mechanics of tree's and the art behind bonsai."
		Attributes.database.query("SELECT username FROM Players WHERE abc_group = true")
		var players = Attributes.database.query_result
		var display_string = ""
		for player in players:
			display_string += player["username"]
			display_string += ", "
		display_string = display_string.left(display_string.length() - 2)
		member_list_text.text = display_string
	if (groupNum == 2):
		info_text.text = "3DPC is dedicated to bringing 3D printing technology to Purdue and making it accessible to all students and staff. The club also supports any questions regarding CAD software or 3D printing."
		Attributes.database.query("SELECT username FROM Players WHERE printing_3d_group = true")
		var players = Attributes.database.query_result
		var display_string = ""
		for player in players:
			display_string += player["username"]
			display_string += ", "
		display_string = display_string.left(display_string.length() - 2)
		member_list_text.text = display_string
	if (groupNum == 3):
		info_text.text = "Purdue University’s chapter of the American Society of Mechanical Engineers (ASME) has one goal: prepare its members to land the job or internship of their dreams! With over 7 different design teams developing projects such as Grand Prix Karts, Prosthetics, and Hydroponics, alongside CAD and FEA Training in collaboration with MILESTONES, ASME offers incredible opportunities to get hands on engineering experience."
		Attributes.database.query("SELECT username FROM Players WHERE asme_group = true")
		var players = Attributes.database.query_result
		var display_string = ""
		for player in players:
			display_string += player["username"]
			display_string += ", "
		display_string = display_string.left(display_string.length() - 2)
		member_list_text.text = display_string
	if (groupNum == 4):
		info_text.text = "ACM (Association for Computing Machinery) at Purdue is an organization for connecting students, faculty and companies for the betterment of the computing community."
		Attributes.database.query("SELECT username FROM Players WHERE acm_group = true")
		var players = Attributes.database.query_result
		var display_string = ""
		for player in players:
			display_string += player["username"]
			display_string += ", "
		display_string = display_string.left(display_string.length() - 2)
		member_list_text.text = display_string
	if (groupNum == 5):
		info_text.text = "BGCP is an open and visible resource for those interested in playing board games. They have an inventory of over 100 board games and host meetings multiple times a week to fit with any schedule."
		Attributes.database.query("SELECT username FROM Players WHERE bgc_group = true")
		var players = Attributes.database.query_result
		var display_string = ""
		for player in players:
			display_string += player["username"]
			display_string += ", "
		display_string = display_string.left(display_string.length() - 2)
		member_list_text.text = display_string

func _on_g_1_desc_pressed():
	update_info(1)
func _on_g_2_desc_pressed():
	update_info(2)
func _on_g_3_desc_pressed():
	update_info(3)
func _on_g_4_desc_pressed():
	update_info(4)
func _on_g_5_desc_pressed():
	update_info(5)

func _on_g_1_join_pressed():
	if (Attributes.abc_group == false):
		Attributes.abc_group = true
		update_join_button()
		Attributes.database.update_rows("Players", "username = '" + Attributes.username + "'", {"abc_group":true})
func _on_g_2_join_pressed():
	if (Attributes.printing_3d_group == false):
		Attributes.printing_3d_group = true
		update_join_button()
		Attributes.database.update_rows("Players", "username = '" + Attributes.username + "'", {"printing_3d_group":true})
func _on_g_3_join_pressed():
	if (Attributes.asme_group == false):
		Attributes.asme_group = true
		update_join_button()
		Attributes.database.update_rows("Players", "username = '" + Attributes.username + "'", {"asme_group":true})
func _on_g_4_join_pressed():
	if (Attributes.acm_group == false):
		Attributes.acm_group = true
		update_join_button()
		Attributes.database.update_rows("Players", "username = '" + Attributes.username + "'", {"acm_group":true})
func _on_g_5_join_pressed():
	if (Attributes.bgc_group == false):
		Attributes.bgc_group = true
		update_join_button()
		Attributes.database.update_rows("Players", "username = '" + Attributes.username + "'", {"bgc_group":true})


func _on_close_pressed():
	get_tree().change_scene_to_file(Attributes.location)
