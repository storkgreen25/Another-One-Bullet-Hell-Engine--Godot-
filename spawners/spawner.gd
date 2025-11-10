class_name Spawner
extends Node2D

signal started()
signal finished()

@export var scene_to_spawn: PackedScene
@export var activated: bool = false

func _ready() -> void:
	if activated: activate()

#HANDLER FOR EVERY SPAWNER OPTION
func spawner_logic() -> void:
	pass

#HANDLER FOR VARIOUS TYPES OF THE SAME SPAWNER
func spawner_type_logic() -> void:
	spawn()

#HANDLER FOR CHANGING STATS OF AN INSTANCE
func instance_tweaking(_instance: Node) -> void:
	pass

#DEFAULT FUNCS
func activate() -> void:
	emit_signal("started")
	spawner_logic()
	emit_signal("finished")

func spawn() -> void:
	var instance: Node = scene_to_spawn.instantiate()
	instance_tweaking(instance)
	add_child(instance)
