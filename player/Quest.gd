extends Node

class_name Quest

var quest_name
var completed = false # if quest is completed
var next_quest = null # instance a new quest and add it here -- this is the next quest in the chain once 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func format():
	print("Quest Name: {name}, Completed {completed}, next_quest{quest}".format({"name":quest_name,"completed":completed,"quest": next_quest}))
