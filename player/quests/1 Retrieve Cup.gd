extends Quest

# Called when the node enters the scene tree for the first time.
func _ready():
	quest_name = "Retrieve Cup"
	quest_id = 1
	quest_description = "Retrieve the cup from the counter"
	completed = false # if quest is completed
	# next_quest = [2] # ID of next quests
	next_events = [2] # ID of the Event to trigger

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
