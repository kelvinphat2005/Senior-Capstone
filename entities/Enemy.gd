extends CharacterBody3D
class_name Enemy

@export var sight_distance = 10

@onready var player
# var velocity = Vector3.ZERO

@export var speed = 2.0 # max speed
var gravity = 75.0
@export var accel = 0.3
@export var max_health = 0
@export var attack_range = 1.5 # range is from CENTER of node
@export var attack_damage = 5
var health = max_health

var can_see_player = false

# player memory system
var last_seen_player = Vector3.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	if get_parent().has_node("Player"):
		print("True")
		# player = get_parent().get_node("Player")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

# returns "true" or "false" depending if enemy is within sight distance of enemy
func see_player():
	# var space = get_viewport().world.direct_space_state
	# var results = space.intersect_ray(self.position, Vector3(player.position), [self])
	var space_state = get_world_3d().get_direct_space_state()
	var params = PhysicsRayQueryParameters3D.new()
	
	params.from = self.position
	params.to = Vector3(player.position)
	params.exclude = [self]
	
	var results = space_state.intersect_ray(params)
	if results:
		if results.collider == player:
			if Vector3(self.position).distance_to(Vector3(player.position)) < sight_distance:
				return true
	return false

	
func get_player_collider():
	# var space = get_viewport().world.direct_space_state
	# var results = space.intersect_ray(self.position, Vector3(player.position), [self])
	var space_state = get_world_3d().get_direct_space_state()
	var params = PhysicsRayQueryParameters3D.new()
	params.from = self.position
	params.to = Vector3(player.position)
	params.exclude = [self]
	var results = space_state.intersect_ray(params)
	return results

func distance_from_player():
	return Vector3(self.position).distance_to(Vector3(player.position))

func damage_player(damage):
	player.health -= damage
		
# move towards player if the player is within sight distance and if there are no obstacles
func move_toward_player():
	if see_player():
		# if player close enough to enemy, start following
		var direction = Vector3.ZERO
		can_see_player = true
		
		if Vector3(self.position).distance_to(Vector3(player.position)) < sight_distance:
			rotate_toward_player()
			if self.position.x < player.position.x:
				direction.x += 1
			elif self.position.x > player.position.x:
				direction.x -= 1
				
			if self.position.z < player.position.z:
				direction.z += 1
			elif self.position.z > player.position.z:
				direction.z -= 1
			
			velocity.x = speed * direction.x
			# velocity.x = move_toward(velocity.x, speed * direction.x, accel)
			velocity.z = move_toward(velocity.z, speed * direction.z, accel)
			velocity.y = gravity * -1
			
			last_seen_player = player.position
			
			# convert to int
			last_seen_player.x = int(last_seen_player.x)
			last_seen_player.z = int(last_seen_player.z)
			
		else:
			can_see_player = false

# neg z direction is facing forward
func rotate_toward_player():
	var player_pos = player.position
	player_pos.y = player.position.y
	look_at(player_pos, Vector3.UP)

func move_toward_pos(pos):
	var direction = Vector3.ZERO
	# var pos_offset = 2
	
	if int(self.position.x) < pos.x:
		direction.x += 1
	elif int(self.position.x) > pos.x:
		direction.x -= 1
		
	if int(self.position.z) < pos.z:
		direction.z += 1
	elif int(self.position.z) > pos.z:
		direction.z -= 1
	
	velocity.x = move_toward(velocity.x, speed * direction.x, accel)
	velocity.z = move_toward(velocity.z, speed * direction.z, accel)
	velocity.y = gravity * -1

#func get_class():
#	return "Enemy"
