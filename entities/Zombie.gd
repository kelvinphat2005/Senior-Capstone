extends Enemy

@export var attack_interval = 2.0
@export var attack_override = 3.0
var attack_ready = true

var attacked_time = Time.get_unix_time_from_system() - 10

# Called when the node enters the scene tree for the first time.
func _ready():
	attack_damage = attack_override
	player = $"../Player"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_up_direction(Vector3.UP)
	move_and_slide()
	
	if see_player():
		move_toward_player()
		
	else:
		if last_seen_player != Vector3.ZERO:
			move_toward_pos(last_seen_player)
	
	if attack_ready:
		if distance_from_player() < attack_range:	
			damage_player(attack_damage)
			attack_ready = false
			attacked_time = Time.get_unix_time_from_system()
	
	if Time.get_unix_time_from_system() - attacked_time >= attack_interval:
		attack_ready = true

