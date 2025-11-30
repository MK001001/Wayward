extends Area2D

const max_distance = 250
const speed = 75
var travelled_distance = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * speed * delta
	
	travelled_distance += speed * delta;
	if (travelled_distance > max_distance):
		queue_free()
