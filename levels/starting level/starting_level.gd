extends Node

@onready var player = $Player


# Called when the node enters the scene tree for the first time.
func _ready():
	# starting quest
	# retrieve cup
	var quest = preload("res://player/Quest.gd").new()
	quest.quest_name = "Retrieve Cup"
	quest.quest_description = "Retrieve the cup from the kitchen counter"
	
	var quest2 = preload("res://player/Quest.gd").new()
	quest2.quest_name = "Fill Cup"
	quest2.quest_description = "Fill the cup with water"
	quest.next_quest = quest2
	
	player.quest_handler.all_quests.append(quest)
	
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(player.quest_handler.all_quests)
	if player.inventory.equipped_item != null:
		if player.inventory.equipped_item.item_name == "cup":
			player.quest_handler.complete_quest("Retrieve Cup")
			
