extends Node3D

var READY = false

# the radius area that the player can be before the camera starts to follow
@export var inner_cam_thresh = 8
# the radius the player can be before the camera completely stops
@export var outer_cam_thresh = 24

# cam offsets
@export var z_offset = 0
@export var y_offset = 0

# other variables
var player
var origin = Vector3.ZERO
var in_radius_x = true
var in_radius_z = true
var player_pos
var player_speed

# Called when the node enters the scene tree for the first time.
func _ready():
	# checks if there is a "Player" node in scene
	# cam will not appear/work if there is no "Player"
	if get_parent().has_node("Player"):
		player = get_parent().get_node("Player")
		player_pos = player.position
		player_speed = player.speed
		
		READY = true

		# sets camera position
		# z is how far behind the cam is from player
		transform.origin = Vector3(player_pos.x,12+y_offset,player_pos.z+8+z_offset)
		rotation_degrees = Vector3(-45, 0, 0) 
		
		# creates origin point
		# inner and outer cam thresholds are based on this
		var origin = Vector3(position.x,0,position.z)

func _process(delta):
	# print(self.position)
	if READY:
		# camera movemeent
		# print(player.position.z - origin.z)
		if in_radius_x:
			if player.position.x - origin.x > inner_cam_thresh:
				translate(Vector3(player.velocity.x * delta,0,0))
			elif player.position.x - origin.x < inner_cam_thresh * -1:
				translate(Vector3(player.velocity.x * delta,0,0))
				
			if player.position.x - origin.x > outer_cam_thresh:
				in_radius_x = false
			elif player.position.x - origin.x < outer_cam_thresh * -1:
				in_radius_x = false
		else:
			if player.position.x - origin.x < outer_cam_thresh and player.position.x > inner_cam_thresh:
				in_radius_x = true
			elif player.position.x - origin.x > outer_cam_thresh * -1 and player.position.x < inner_cam_thresh * -1:
				in_radius_x = true
				
		if in_radius_z:
			if player.position.z - origin.z > inner_cam_thresh:
				translate(Vector3(0,0,0))
				in_radius_z = false
			elif player.position.z - origin.z < inner_cam_thresh * -1:
				translate(Vector3(0,player.velocity.z * delta * -1,player.velocity.z * delta))
				in_radius_z = false
		else:
			if player.position.z - origin.z < outer_cam_thresh and player.position.z > inner_cam_thresh:
				in_radius_z = true
			elif player.position.z - origin.x > outer_cam_thresh * -1 and player.position.z < inner_cam_thresh * -1:
				in_radius_z = true
