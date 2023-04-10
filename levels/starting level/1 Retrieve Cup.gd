extends Event

# Called when the node enters the scene tree for the first time.
func _ready():
	event_id = 1
	active = true
	result_quest = [2]
	completed_quest = 1
	trigger = TRIGGER.IN_INVENTORY
	result = [RESULT.QUEST_ADD, RESULT.QUEST_COMPLETE]
	required_item = 3
