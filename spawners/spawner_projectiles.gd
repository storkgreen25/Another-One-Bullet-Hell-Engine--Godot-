class_name SpawnerProjectiles
extends Spawner

@export var stats: SpawnerProjectileStats
var havent_shot: bool = true
var custom_angle: float = 0.0
var custom_rotation: float = 0.0
var color_num: int = 0
var color_cycle_num: int = 0
var speed_change_type: int = 0
var speed_change_layer: int = 0
var distance_change: Vector2 = Vector2.ZERO

func spawner_type_logic() -> void:
	if stats.type_centered:
		custom_angle -= (( stats.type_amount - 1 ) * stats.type_gap) / 2
	
	#SPREAD TYPE
	if stats.spawn_type == stats.TYPE.SPREAD:
		for y in stats.type_amount:
			await get_tree().create_timer(stats.type_cooldown).timeout
			if stats.cycle_in_type: color_control()
			spawn()
			custom_angle += stats.type_gap
			speed_change_type += stats.type_speed_change
	#RING TYPE
	elif stats.spawn_type == stats.TYPE.RING:
		for y in stats.type_amount:
			await get_tree().create_timer(stats.type_cooldown).timeout
			if stats.cycle_in_type: color_control()
			custom_angle += 360 / stats.type_amount + stats.type_gap
			spawn()
			speed_change_type += stats.type_speed_change
	#CORNER TYPE
	elif stats.spawn_type == stats.TYPE.CORNER:
		spawn()
	#STAR TYPE
	elif stats.spawn_type == stats.TYPE.STAR:
		spawn()
	#WALL TYPE
	elif stats.spawn_type == stats.TYPE.WALL:
		spawn()
	#SQUARE TYPE
	elif stats.spawn_type == stats.TYPE.SQUARE:
		spawn()

#HANDLES LAYERS AND RESETS
func spawner_logic() -> void:
	#ADJUSTMENT TO VARS
	distance_change = stats.distance_from_spawner
	color_num = stats.color
	custom_rotation = stats.rotation
	
	#ACTUAL SHOT
	while (havent_shot or stats.layers_infinite):
		#LAYER
		for x in stats.layers_amount:
			if stats.color_cycle: color_control()
			
			#SPREAD
			spawner_type_logic()
			
			#STATS CHANGE AFTER SHOT
			custom_angle = 0.0
			distance_change += stats.distance_expand
			speed_change_type = 0
			speed_change_layer += stats.layers_speed_change
			custom_rotation += stats.post_rotation
			havent_shot = false
			
			await get_tree().create_timer(stats.layers_cooldown).timeout
	
	#RESETS STATS AFTER SHOT
	distance_change = stats.distance_from_spawner
	custom_rotation = 0.0
	speed_change_layer = 0
	havent_shot = true

func instance_tweaking(instance: Node) -> void:
	if stats.stats_override:
		var new_stats: ProjectileStats = stats.stats_new.duplicate()
		instance.stats = new_stats
	
	instance.position += stats.distance_from_spawner + distance_change
	instance.stats.speed += speed_change_type + speed_change_layer
	instance.rotation_degrees += custom_rotation + custom_angle
	instance.change_color(color_num)
	if stats.projectile_group != "": 
		instance.add_to_group(stats.projectile_group)

func color_control() -> int:
	if stats.colors_in_cycle.size() == 0: return color_num
	
	color_num = stats.colors_in_cycle[color_cycle_num]
	color_cycle_num += 1
	
	if color_cycle_num == stats.colors_in_cycle.size(): color_cycle_num = 0
	
	return color_num
