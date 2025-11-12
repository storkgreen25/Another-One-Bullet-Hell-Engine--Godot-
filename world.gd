extends Node2D
@onready var fps: Label = $Label
@onready var spawner: SpawnerProjectiles = $SpawnerProjectiles

func _process(_delta: float) -> void:
	fps.text = "FPS: " + str(Engine.get_frames_per_second()) + "\nBullets: " + str(get_tree().get_node_count_in_group("Enemy Projectile"))
	if Input.is_action_just_pressed("ui_accept"):
		spawner.deactivate()