extends Quest

# Called when the node enters the scene tree for the first time.
func _ready():
	quest_name = "Fill Cup"
	quest_id = 2
	quest_description = "Fill the cup at the fridge"
	completed = false # if quest is completed
	# next_quest = [null] # ID of next quests
	next_events = [3] # ID of the Event to trigger

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
