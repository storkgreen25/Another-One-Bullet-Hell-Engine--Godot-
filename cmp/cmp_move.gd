class_name CMP_Move
extends Node

@export var body: Node2D

var sin_count: float = 1.0
var cos_count: float = 1.0

func move(speed: float, delta: float) -> void:
	body.translate(Vector2.DOWN.rotated(body.rotation) * speed * delta)

func move_directional(direction: Vector2, speed: float, delta: float) -> void:
	body.translate(direction.rotated(body.rotation) * speed * delta)

func move_to_target(target: Node2D, speed: float, delta: float) -> void:
	body.look_at(target.position)
	body.translate(Vector2.DOWN.rotated(body.rotation) * speed * delta)

func special_sin(x: int, y: int, sin_grow: float, sin_frec: float, sin_amp: float) -> void:
	body.translate(
		Vector2((sin(sin_count / sin_frec) * sin_amp) * x,
		(sin(sin_count / sin_frec) * sin_amp) * y).rotated(body.rotation))
	sin_count += sin_grow

func special_cos(x: int, y: int, cos_grow: float, cos_frec: float, cos_amp: float) -> void:
	body.translate(
		Vector2((cos(cos_count / cos_frec) * cos_amp) * x,
		(cos(cos_count / cos_frec) * cos_amp) * y).rotated(body.rotation))
	cos_count += cos_grow
