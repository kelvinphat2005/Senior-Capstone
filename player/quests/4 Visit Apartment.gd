extends Quest

# Called when the node enters the scene tree for the first time.
func _ready():
	quest_name = "Visit Apartment"
	quest_id = 4
	quest_description = "Visit the suspicious apartment"
	completed = false # if quest is completed
	# next_quest = [null] # ID of next quests
	next_events = [null] # ID of the Event to trigger

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
