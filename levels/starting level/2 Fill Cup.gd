extends Event

# Called when the node enters the scene tree for the first time.
func _ready():
	event_id = 7
	active = true
	result_quest = [null]
	completed_quest = 3
	trigger = TRIGGER.INTERACT
	result = [RESULT.QUEST_COMPLETE]
