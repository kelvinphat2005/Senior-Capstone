extends Label


# Called when the node enters the scene tree for the first time.
# HUD is instantiated by the Player node
# so the parent of parent is player <-- wow
func _ready():
	text = "No Quests"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var current_quests = PlayerVariables.current_quests
	
	if not is_instance_valid(PlayerVariables.current_quests):
		return
	
	
	if self.is_inside_tree:
		print("yippee")
		if current_quests:
			if len(current_quests) > 0:
				text = "{name} - {description}".format({"name": current_quests[0].quest_name, "description": current_quests[0].quest_description})
			else:
				text = "No Quests"
