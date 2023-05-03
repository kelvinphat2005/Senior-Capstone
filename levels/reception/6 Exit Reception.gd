extends Event

# Called when the node enters the scene tree for the first time.
func _ready():
	event_id = 6
	active = true
	trigger = TRIGGER.INTERACT
	result = [RESULT.FUNCTION]
	repeatable = true

func result_function():
	PlayerVariables.level_spawn = 3
	get_tree().change_scene_to_file("res://levels/apartment hallway/apartment hallway playable.tscn")

