extends Event

# Called when the node enters the scene tree for the first time.
func _ready():
	event_id = 3
	active = false
	result = [RESULT.FUNCTION]
	trigger = TRIGGER.MANUAL

func result_function():
	var env = $"../../WorldEnvironment".environment
	env.volumetric_fog_density = 0.03
	print("FSDKJMHFSDKJHSDFLKJFLSKDFSD")
