extends Label


# Called when the node enters the scene tree for the first time.
# HUD is instantiated by the Player node
# so the parent of parent is player <-- wow
func _ready():
	text = "No Quests"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var current_quests = PlayerVariables.current_quests
	
	if get_node("res://player/Player.tscn"):
		if current_quests:
			if len(current_quests) > 0:
				text = "{name} - {description}".format({"name": current_quests[0].quest_name, "description": current_quests[0].quest_description})
			else:
				text = "No Quests"

