extends CharacterBody2D

var speed: float = 75
var health: float = 30
var player_chase: bool = false
var player = null
var direction: Vector2 = Vector2.RIGHT

func take_damage(damage: float):
	health -= damage
	if (health <= 0):
		queue_free()

func _physics_process(delta: float) -> void:
	if (player_chase):
		direction = (player.position - position).normalized()
		velocity = direction * speed
		
		move_and_slide()
		
		if (player.position.x - position.x < 0):
			$AnimatedSprite2D.flip_h = false
		else:
			$AnimatedSprite2D.flip_h = true

func _on_detection_area_body_entered(body):
	player = body
	player_chase = true
