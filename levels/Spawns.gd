extends Node

# Called when the node enters the scene tree for the first time.
func go_to_spawn():
	for child in get_children():
		if PlayerVariables.level_spawn == child.id:
			get_parent().get_node("Player").position = child.position
