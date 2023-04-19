extends Node

# Declare member variables here
var inventory = []
var equipped_item = null

@export var max_inv_slots = 10

@onready var player = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	print("INVENTORY READY")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	PlayerVariables.inventory = self
	PlayerVariables.equipped_item = equipped_item

func print_inventory():
	print("Inventory: ", inventory)

func add_item(item):
	inventory.append(item)
	equipped_item = item
	
func remove_item(item):
	inventory.pop(item)

func equip_item(item):
	equipped_item = item
	
func get_equipped():
	return equipped_item

func test():
	print("TEST")
