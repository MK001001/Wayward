extends Area2D

const max_distance: float = 250
var speed: float = 250
var travelled_distance: float = 0
var direction : Vector2
const damage: float = 10

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#direction = Vector2.RIGHT.rotated(rotation)
	position += direction * speed * delta
	
	travelled_distance += speed * delta;
	if (travelled_distance > max_distance):
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	queue_free()
	if (body.has_method("take_damage")):
		body.take_damage(damage)
