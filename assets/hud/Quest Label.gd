extends Label

var player
var quest_handler

# Called when the node enters the scene tree for the first time.
# HUD is instantiated by the Player node
# so the parent of parent is player <-- wow
func _ready():
	player = get_parent().get_parent()
	quest_handler = player.quest_handler
	text = "No Quests"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
