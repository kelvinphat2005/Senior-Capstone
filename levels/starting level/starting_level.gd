extends Node

@onready var player = $Player

# Called when the node enters the scene tree for the first time.
func _ready():
	# starting quest
	# retrieve cup
	var quest = preload("res://player/Quest.gd").new()
	quest.quest_name = "Retrieve Cup"
	player.quest_handler.all_quests.append(quest)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
