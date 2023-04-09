extends Event

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	event_name = "Fill Cup Complete"
	event_type = INTERACT_TYPE.QUEST_COMPLETE
	output_type = OUTPUT_TYPE.FUNCTION

func out_function():
	var env = $"../../WorldEnvironment".environment
	env.volumetric_fog_density = .04

	print("fdsfsdsfd")
