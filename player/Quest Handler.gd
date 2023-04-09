extends Node

var all_quests = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func complete_quest(name):
	for quest in all_quests:
		if quest.quest_name == name:
			if quest.completed == false:
				next_quest(quest.next_quest)
			quest.completed = true
			return true
	return false

func next_quest(quest_obj):
	all_quests.append(quest_obj)
