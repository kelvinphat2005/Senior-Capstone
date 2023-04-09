# Senior-Capstone
Game made with the Godot 4.0 Engine

## Creating Item
Node type: Area3D

Child: CollisionShape3D (The area where the item can be picked up)

Script: Attach a script that extends the class "Item" (ex. "extends Item") or give it the Item.gd script

Script pt2: Add an unique ID and Name

Item Logo: Create an item logo (32x32 upscaled to 64x64). Add it to the same directory of item scene

Item Logo pt2: Go to Holding.gd (res://assets/HUD/Holding.gd) and add item to "all_item_logos" dictionary. (ex "'item name:' preload('res://assets/item/name/name.png')")

## Creating Quest
Creating Quest:
'''
quest = preload("res://player/Quest.gd").new()
quest.quest_name = "Quest Name"
'''

Chaining Quests Together:
'''
quest_after = preload("res://player/Quest.gd").new()
quest.next_quest = quest_after
'''
-- quest.next_quest needs to be a node

Add quest to quest handlers' all_quest list:
'player.quest_handler.all_quests.append(quest)'
