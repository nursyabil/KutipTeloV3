extends Node2D

@export var falling_object_scene: PackedScene
@export var spawn_interval: float = 0.2
@onready var game_manager = %GameManager

func _ready() -> void:
	var timer = Timer.new()
	timer.wait_time = spawn_interval
	timer.one_shot = false
	timer.connect("timeout", Callable(self, "_on_timer_timeout"))
	add_child(timer)
	timer.start()

func _on_timer_timeout() -> void:
	var object_instance = falling_object_scene.instantiate()
	add_child(object_instance)
	object_instance.position = Vector2(randf_range(0, get_viewport().size.x), 0)
	
	object_instance.connect("collided", Callable(self, "_on_falling_duit_collided"))
	
func _on_falling_duit_collided(body: Node2D) -> void:
	game_manager.add_point()
