extends Area2D

var direction: Vector2 = Vector2.RIGHT
var speed: float = 0.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func shoot():
	if ($cooldown.time_left <= 0):
		$cooldown.start()
		
		const flame = preload("res://scenes/flame.tscn")
		var new_flame = flame.instantiate()
		#%shooting_point.add_child(new_flame)
		get_tree().get_root().add_child(new_flame)
		new_flame.global_transform = %shooting_point.global_transform
		new_flame.direction = direction
		new_flame.speed += speed
		new_flame.travelled_distance -= speed
