extends Node

var all_quests = []
@onready var player = $"../Player"

# Called when the node enters the scene tree for the first time.
func _process(delta):
	all_quests = get_parent().get_node("Player").get_quests()

	for child in get_children():
		if child.event_type == child.INTERACT_TYPE.QUEST_COMPLETE:
			pass
	
