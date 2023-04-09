extends Event


# Called when the node enters the scene tree for the first time.
func _ready():
	event_name = "Fridge Interact"
	event_type = INTERACT_TYPE.DEFAULT
	output_type = OUTPUT_TYPE.QUEST_COMPLETE
	
func _process(delta):
	if get_parent().all_quests.size() > 0:
		for quest in get_parent().all_quests:
			if quest.quest_name == "Fill Cup":
				quest_link = quest
				
	if quest_link != null:
		activate()
