extends Node

var current_quests = []
@onready var player = $"../Player"

# Called when the node enters the scene tree for the first time.
func _process(delta):
	for event in get_children():
		if event.active:
			if has_required_item(event):
				if event.triggered == false:
					trigger(event)
					

func has_required_item(event):
	var inventory = player.get_node("Inventory").inventory
	for item in inventory:
		if item.id == event.required_item:
			return true
	if event.required_item == null:
		return true
	return false

func get_event(ID):
	for event in get_children():
		if event.event_id == ID:
			return event

func activate_event(ID):
	var event = get_event(ID)
	event.active = true

func trigger(event):
	if event.trigger == event.TRIGGER.INTERACT:
		if event.has_overlapping_bodies(): # if player enters the collision shape of item
			if Input.is_action_pressed("interact"):
				print("Item interacted with")
				event.do_result()
				event.triggered = true
						
	elif event.trigger == event.TRIGGER.IN_INVENTORY:
		event.do_result()
		event.triggered = true
