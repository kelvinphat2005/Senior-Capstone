extends Node

@onready var player = $Player


# Called when the node enters the scene tree for the first time.
func _ready():
	var quest_handler = player.get_node("Quest Handler")
	quest_handler.add_quest(1)
