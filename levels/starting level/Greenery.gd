extends Node

func clear_greenery():
	var index = 0
	for grass in get_children():
		if index % 2:
			grass.visible = false
		index += 1
