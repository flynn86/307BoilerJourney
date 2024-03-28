extends NinePatchRect

@onready var questions : Array = [
	"When did the Purdue Memorial Union open?",
	"Robert C. Baker, the inventor of chicken nuggets, got what degree at Purdue?",
	"In 2001, the following part was added to the Engineering Fountain.",
	"The Clapping Circle, where clapping produces high squeak noises, is located in which park?"
]
@onready var choice1 : Array = ["1969", "Master's", "The cat engraving", "Academy Park"]
@onready var choice2 : Array = ["1940", "Doctorate", "Water", "Founders Park"]
@onready var choice3 : Array = ["1924", "Bachelor's", "Engine", "Purdue Horticulture Park"]
@onready var choice4 : Array = ["1951", "Certificate Programs", "Mirrored metal cylinder", "Happy Hollow Park"]
@onready var correct : Array = [3, 2, 4, 1]
@onready var exp_reward : Array = [40, 75, 60, 45]
@onready var numQuestions = questions.size()
var index : int = 0

@onready var title_label = get_child(1).get_child(0).get_child(0).get_child(0)
@onready var button1 = get_child(2)
@onready var button2 = get_child(3)
@onready var button3 = get_child(4)
@onready var button4 = get_child(5)
@onready var description_label = get_child(6).get_child(0).get_child(0)
@onready var time = get_child(6).get_child(1).get_child(0)
@onready var result_control = get_child(7)
@onready var result_label = get_child(7).get_child(0)
@onready var question_label = get_child(1).get_child(3).get_child(0)

func _ready():
	result_control.visible = false
	var close = get_child(0)
	var label1 = get_child(2).get_child(0).get_child(0)
	var label2 = get_child(3).get_child(0).get_child(0)
	var label3 = get_child(4).get_child(0).get_child(0)
	var label4 = get_child(5).get_child(0).get_child(0)
	if (Attributes.question_available):
		button1.visible = true
		button2.visible = true
		button3.visible = true
		button4.visible = true
		index = randi_range(0, 3)
		question_label.text = questions[index]
		label1.text = choice1[index]
		label2.text = choice2[index]
		label3.text = choice3[index]
		label4.text = choice4[index]
	else:
		button1.visible = false
		button2.visible = false
		button3.visible = false
		button4.visible = false
		question_label.text = "Come back soon!"
	title_label.visible_characters = -1
	question_label.visible_characters = -1
	label1.visible_characters = -1
	label2.visible_characters = -1
	label3.visible_characters = -1
	label4.visible_characters = -1
	description_label.visible_characters = -1
	time.visible_characters = -1
	result_label.visible_characters = -1

func display_correct():
	button1.visible = false
	button2.visible = false
	button3.visible = false
	button4.visible = false
	question_label.text = "Come back soon!"
	result_label.text = "Correct! You gained +" + str(exp_reward[index]) + " EXP!"
	Attributes.xp += exp_reward[index]
	Attributes.question_available = false
	Attributes.last_daily_question_time = Time.get_datetime_dict_from_system()
	SaveUtils.save()
	result_control.visible = true

func display_incorrect():
	button1.visible = false
	button2.visible = false
	button3.visible = false
	button4.visible = false
	question_label.text = "Come back soon!"
	var correct_answer = ""
	if (correct[index] == 1):
		correct_answer = choice1[index]
	elif (correct[index] == 2):
		correct_answer = choice2[index]
	elif (correct[index] == 3):
		correct_answer = choice3[index]
	elif (correct[index] == 4):
		correct_answer = choice4[index]
	result_label.text = "Incorrect. The correct answer was " + correct_answer + "."
	Attributes.question_available = false
	Attributes.last_daily_question_time = Time.get_datetime_dict_from_system()
	SaveUtils.save()
	result_control.visible = true
	
func _process(_delta):
	if (Attributes.question_available) || (Attributes.last_daily_question_time.size() == 0):
		time.text = "Ready"
	else:
		var cur = Time.get_datetime_dict_from_system()
		var last = Attributes.last_daily_question_time
		if (cur.weekday != last.weekday): # If the weekday is different, than refresh question
			Attributes.question_available = true
			_ready()
		elif (cur.day != last.day) || (cur.month != last.month) || (cur.year != last.year):
			# Edge case of weekday being same, but on a different date
			Attributes.question_available = true
			_ready()
		else:
			var remaining_hour = 23 - cur.hour
			var remaining_minute = 59 - cur.minute
			var remaining_second = 59 - cur.second
			var remaining_hour_str = str(remaining_hour)
			var remaining_minute_str = str(remaining_minute)
			var remaining_second_str = str(remaining_second)
			if (remaining_hour < 10):
				remaining_hour_str = "0" + str(remaining_hour)
			if (remaining_minute < 10):
				remaining_minute_str = "0" + str(remaining_minute)
			if (remaining_second < 10):
				remaining_second_str = "0" + str(remaining_second)
			time.text = remaining_hour_str + ":" + remaining_minute_str + ":" + remaining_second_str
	time.visible_characters = -1

func _on_choice_1_pressed():
	if (correct[index] == 1):
		display_correct()
	else:
		display_incorrect()


func _on_choice_2_pressed():
	if (correct[index] == 2):
		display_correct()
	else:
		display_incorrect()


func _on_choice_3_pressed():
	if (correct[index] == 3):
		display_correct()
	else:
		display_incorrect()


func _on_choice_4_pressed():
	if (correct[index] == 4):
		display_correct()
	else:
		display_incorrect()


func _on_close_pressed():
	var last_location = Attributes.location
	get_tree().change_scene_to_file(last_location)
