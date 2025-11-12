class_name Projectile
extends Node2D

@export var stats: ProjectileStats
@export var move_component: CMP_Move
@export var sprite: Sprite2D

func _ready() -> void:
	if not stats.player_attack: add_to_group("Enemy Projectile")
	get_tree().create_timer(stats.life_time).timeout.connect(destroy)

func _physics_process(delta: float) -> void:
	translate(Vector2.DOWN.rotated(rotation) * stats.speed * delta)
	
	if stats.looks_at_point:
		look_at(stats.point)

	rotation_degrees += stats.post_rotation

	if stats.sin_on_x or stats.sin_on_y:
		move_component.special_sin(stats.sin_on_x, stats.sin_on_y, stats.sin_grow, stats.sin_frec, stats.sin_amp)
	
	if stats.cos_on_x or stats.cos_on_y:
		move_component.special_cos(stats.cos_on_x, stats.cos_on_y, stats.cos_grow, stats.cos_frec, stats.cos_amp)

func destroy() -> void:
	queue_free()

func change_color(color: int) -> void:
	sprite.frame_coords.x = color
