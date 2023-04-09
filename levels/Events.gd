extends Area3D

class_name Event

enum INTERACT_TYPE {
	DEFAULT,
	PLACE_HOLDER,
}

enum OUTPUT_TYPE {
	QUEST_COMPLETE,
	PLACE_HOLDER,
}

var event_name
var quest_link = null
var event_type = null
var output_type = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta):
	pass

func activate():
	if event_type == INTERACT_TYPE.DEFAULT:
		# item must have its collision_mask at 2 (player) for this to work
		print(quest_link.completed)
		if quest_link.completed == false:
			if has_overlapping_bodies(): # if player enters the collision shape of item
				if Input.is_action_pressed("interact"):
					print("interacted with")
					if output_type == OUTPUT_TYPE.QUEST_COMPLETE:
						print(quest_link.quest_name)
						print(get_parent().player.quest_handler)
						get_parent().player.quest_handler.complete_quest(quest_link.quest_name)
						quest_link.completed = true
						#quest_handler.complete_quest(quest_link.quest_name)

func set_quest(quest):
	if output_type == OUTPUT_TYPE.QUEST_COMPLETE:
		quest_link = quest
		return true
	return false

