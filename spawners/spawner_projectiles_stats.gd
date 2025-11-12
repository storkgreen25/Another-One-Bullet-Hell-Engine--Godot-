class_name SpawnerProjectileStats
extends Resource

enum COLOR {WHITE, RED, GREEN, BLUE, YELLOW, CYAN, MAGENTA, BROWN, BLACK, WEIRD}
enum TYPE {SPREAD, RING, CORNER, STAR, WALL, SQUARE}

@export_group("PROJECTILE STATS")
@export var projectile_group: String = ""
@export var stats_override: bool = false
@export var stats_new: ProjectileStats
@export_group("SPAWN ROTATION")
@export var rotation: float = 0.0
@export var post_rotation: float = 0.0
@export var rotation_min: float = 0.0
@export var rotation_max: float = 359.0
@export_group("SPAWN TYPE STATS")
@export var spawn_type: TYPE = TYPE.SPREAD
@export var type_amount: int = 1
@export var type_cooldown: float = 0.0
@export var type_speed_change: int = 0
@export var type_centered: bool = true
@export var type_gap: float = 0.0
@export var type_distance_change: Vector2 = Vector2.ZERO
@export_group("SPAWN POINT STATS")
@export var distance_from_spawner: Vector2 = Vector2.ZERO
@export var distance_expand: Vector2 = Vector2.ZERO
@export_group("LAYERS STATS")
@export var layers_infinite: bool = false
@export var layers_amount: int = 1
@export var layers_cooldown: float = 0.5
@export var layers_speed_change: int = 0
@export_group("COLOR STATS")
@export var color: COLOR = COLOR.WHITE
@export var color_cycle: bool = false
@export var cycle_in_type: bool = false
@export var colors_in_cycle: Array[COLOR]
