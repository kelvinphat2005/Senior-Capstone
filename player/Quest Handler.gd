extends Node

var all_quests = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if all_quests.size() > 0:
		display(all_quests[0].quest_name, all_quests[0].quest_description)
	else:
		display("gAY", "FSDsfdsdfsfd")
		
	
func complete_quest(name):
	if all_quests.size() > 0:
		for quest in all_quests:
			if quest == null:
				all_quests.erase(null)
			if quest.quest_name == name:
				if quest.completed == false:
					if next_quest == null:
						pass
					else:
						next_quest(quest.next_quest)
					all_quests.erase(quest)
					
				if quest.next_events[0] != null:
					var events = get_parent().get_parent().get_node("Events")
					for quest_event in quest.next_events:
						for child in events.get_children():
							print(child)
							if child.event_name == quest_event:
								child.out_function()

				quest.completed = true

func next_quest(quest_obj):
	all_quests.append(quest_obj)

func display(name, description):
	var hud = get_parent().player.get_node("HUD")
	hud.get_node("Label").text = "Quest: " + name + " - " + description
