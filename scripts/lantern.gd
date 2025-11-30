extends Area2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func shoot():
	if ($cooldown.time_left <= 0):
		$cooldown.start()
		
		const bullet = preload("res://scenes/flame.tscn")
		var new_bullet = bullet.instantiate()
		%shooting_point.add_child(new_bullet)
	print($cooldown.time_left)
