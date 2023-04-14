extends Event

# Called when the node enters the scene tree for the first time.
func _ready():
	event_id = 4
	active = true
	trigger = TRIGGER.INTERACT
	result = [RESULT.QUEST_COMPLETE]
