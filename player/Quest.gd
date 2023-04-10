extends Node

class_name Quest

var quest_name : String
var quest_id : int
var quest_description : String

var completed := false # if quest is completed

var next_events := [null] # events to activate once completed

