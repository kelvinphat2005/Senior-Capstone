extends Node

var current_quests = []

var all_quests = preload("res://player/quests/All Quests.tscn").instantiate()

func _ready():
	add_child(all_quests)
	all_quests = get_node("All Quests").get_children()
	
func _process(delta):
	#PlayerVariables.quest_handler = self
	#PlayerVariables.all_quests = all_quests
	#PlayerVariables.current_quests = current_quests
	pass

func get_quest(ID: int):
	for quest in all_quests:
		if quest.quest_id == ID:
			return quest

func add_quest(ID):
	print("QUEST ADDED ", ID)
	current_quests.append(get_quest(ID))

func get_quest_index(ID):
	var index = 0
	for quest in current_quests:
		if quest.quest_id == ID:
			return index
		index += 1

func remove_quest(ID):
	print("QUEST REMOVED ", ID)
	var index = get_quest_index(ID)
	current_quests.pop_at(index)

func complete_quest(ID):
	remove_quest(ID)
	var player = get_parent()
	
	for event_id in get_quest(ID).next_events:
		var events = player.get_parent().get_node("Events")
		for event in events.get_children():
			if event_id == event.event_id:
				if event.trigger == event.TRIGGER.MANUAL:
					event.do_result()
				else:
					event.active = true
