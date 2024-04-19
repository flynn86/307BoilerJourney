# Singleton Script for global time
extends Node

# Multiplier for time elapse speed. Increase to make time go faster, decrease to make time go slower.
var INGAME_SPEED = 20.0

const MINUTES_PER_DAY = 1440
const MINUTES_PER_HOUR = 60

# 1 in-game day = 2 PI
# 1 in-game minute = 2 PI / 1440
const INGAME_TO_REAL_MINUTE_DURATION = (2 * PI) / MINUTES_PER_DAY
var total_minutes = 0
# Total in-game day
var day = 0
# In-game minutes elapsed for current day only
var current_day_minutes = 0
# In-game hours elapsed for current day only
var hour = 0
# In-game minutes elapsed for current day only
var minute = 0



# Current in-game time
var time:float= 0.0



# Initial time
var INITIAL_HOUR = 12

# Past Minute used for emitting tick signals
var past_minute:int= -1

# Signal
signal minute_passed

func _ready():
	if (Attributes.time == 0):
		time = INGAME_TO_REAL_MINUTE_DURATION * MINUTES_PER_HOUR * INITIAL_HOUR
	else:
		time = Attributes.time
	total_minutes = int(time / INGAME_TO_REAL_MINUTE_DURATION)	
	day = int(total_minutes / MINUTES_PER_DAY)
	current_day_minutes = total_minutes % MINUTES_PER_DAY
	hour = int(current_day_minutes / MINUTES_PER_HOUR)	
	minute = int(current_day_minutes % MINUTES_PER_HOUR)

func _process(delta):
	time += delta * INGAME_TO_REAL_MINUTE_DURATION * INGAME_SPEED
	_recalculate_time()	

func _recalculate_time():
	# Total in-game minutes
	total_minutes = int(time / INGAME_TO_REAL_MINUTE_DURATION)
	
	# Total in-game day
	day = int(total_minutes / MINUTES_PER_DAY)

	# In-game minutes elapsed for current day only
	current_day_minutes = total_minutes % MINUTES_PER_DAY

	# In-game hours elapsed for current day only
	hour = int(current_day_minutes / MINUTES_PER_HOUR)
	
	# In-game minutes elapsed for current day only
	minute = int(current_day_minutes % MINUTES_PER_HOUR)
	if (minute != past_minute):
		past_minute = minute
		minute_passed.emit()
	if (hour >= 6) && (hour <= 18):
		Attributes.night = false
	else:
		Attributes.night = true
