class_name ProjectileStats
extends Resource

@export_group("BASIS STATS")
@export var player_attack: bool = false
@export var damage: int = 1
@export var life_time: float = 10.0
@export_group("MOVEMENT STATS")
@export var speed: int = 1
@export_range(-2, 2, 0.05) var post_rotation: float = 0.0
@export var looks_at_point: bool = false
@export var point: Vector2 = Vector2.ZERO
@export_group("SIN STATS")
@export var sin_on_x: bool = false
@export var sin_on_y: bool = false
@export var sin_grow: float = 0.5
@export var sin_frec: float = 0.5
@export var sin_amp: float = 0.5
@export_group("COS STATS")
@export var cos_on_x: bool = false
@export var cos_on_y: bool = false
@export var cos_grow: float = 0.5
@export var cos_frec: float = 0.5
@export var cos_amp: float = 0.5
