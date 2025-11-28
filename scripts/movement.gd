extends CharacterBody2D

const run_speed = 300.0
const walk_speed = 150.0
var max_speed = 100.0

var is_dashing = false
const dash = 500.0
var dash_velocity = 0.0
const dash_cooldown = 0.7
var dash_timer = 0.0
var tween: Tween

func dash_input(direction):
	is_dashing = true
	if tween:
		tween.stop()
	tween = create_tween()
	tween.tween_property(self, "dash_velocity", 0, 0.2).set_ease(Tween.EASE_OUT)
	velocity = (direction * (max_speed + dash))
	
	await(get_tree().create_timer(0.2).timeout)
	is_dashing = false
	dash_timer = dash_cooldown
	

func get_input(delta):
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if (!is_dashing):
		velocity = (direction * max_speed)
		
	if (Input.is_key_pressed(KEY_SPACE) && dash_timer <= 0):
		dash_input(direction)
	if (dash_timer > 0):
		dash_timer -= delta
	
	max_speed = walk_speed
	if (Input.is_key_pressed(KEY_SHIFT)):
		max_speed = run_speed
	

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	get_input(delta)
	move_and_slide()
