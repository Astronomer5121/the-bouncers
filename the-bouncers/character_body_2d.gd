extends CharacterBody2D


const SPEED = 30.0
const JUMP_VELOCITY = -400.0
const FRICTION = 10


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if false:
		velocity += get_gravity() * delta

	# Handle jump.
	if false and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var directionX := Input.get_axis("move_left", "move_right")
	if directionX:
		velocity.x = velocity.x + directionX * SPEED
	else:
		if velocity.x < 0:
			velocity.x = velocity.x + FRICTION
		elif velocity.x > 0:
			velocity.x = velocity.x - FRICTION
	
	velocity.x = clamp(velocity.x, -400, 400)
	
	var directionY := Input.get_axis("move_up", "move_down")
	if directionY:
		velocity.y = velocity.y + directionY * SPEED
	else:
		if velocity.y < 0:
			velocity.y = velocity.y + FRICTION
		elif velocity.y > 0:
			velocity.y = velocity.y - FRICTION
			
	velocity.y = clamp(velocity.y, -400, 400)
	
	var collision = move_and_collide(velocity * delta)
	if false:
		velocity = velocity.bounce(collision.get_normal())
	
	move_and_slide()
