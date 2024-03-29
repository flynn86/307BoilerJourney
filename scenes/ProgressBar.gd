extends ProgressBar


# Called when the node enters the scene tree for the first time.
func _ready():
	value = float((float(Attributes.numCollected) * 100) / 10)
	print(float((float(Attributes.numCollected) * 100) / 10))
