extends Area2D

const fall_speed = 200.0
signal collided(body: Node2D)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y += fall_speed * delta
	
	if position.y > get_viewport().size.y:
		queue_free()
		
	if position.x > get_viewport().size.x:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	emit_signal("collided", body)
	queue_free()
