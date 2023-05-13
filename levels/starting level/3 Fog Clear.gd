extends Event

# Called when the node enters the scene tree for the first time.
func _ready():
	event_id = 3
	active = false
	result = [RESULT.FUNCTION]
	trigger = TRIGGER.MANUAL

func do_result():
	var env = $"../../WorldEnvironment".environment
	env.volumetric_fog_density = 0.03
	
	get_parent().get_parent().get_node("Greenery").clear_greenery()
	print("Event 3 Fog Clear 'do_result' ran successfully")
