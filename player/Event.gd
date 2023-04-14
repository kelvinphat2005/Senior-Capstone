extends Area3D

class_name Event

var event_id : int
var triggered := false
var active := false

var result_quest := [null] # quest IDs
var completed_quest = null
var remove_quest : int # quest ID
var required_item = null # item ID

var trigger 
enum TRIGGER {
	INTERACT,
	IN_INVENTORY,
	MANUAL,
}

var result := []
enum RESULT {
	QUEST_ADD,
	QUEST_REMOVE,
	QUEST_COMPLETE,
	FUNCTION,
	CHANGE_LEVEL,
}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func do_result():
	for i in result:
		var player = get_parent().get_parent().get_node("Player")
		var quest_handler = player.get_node("Quest Handler")
		if i == RESULT.QUEST_ADD:
			for quest_id in result_quest:
				print("QUEST ID ", quest_id)
				quest_handler.add_quest(quest_id)
				
		elif i == RESULT.QUEST_REMOVE:
			print("RQUEST ID ", remove_quest)
			quest_handler.remove_quest(remove_quest)
			
		if i == RESULT.QUEST_COMPLETE:
			quest_handler.complete_quest(completed_quest)
			
		elif i == RESULT.FUNCTION:
			result_function()
			
		elif i == RESULT.CHANGE_LEVEL:
			change_level()

func result_function():
	pass
	
func change_level():
	pass
