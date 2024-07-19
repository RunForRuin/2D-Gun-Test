extends CharacterBody2D


const SPEED = 300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.



func _physics_process(delta):


	# Up and down movement
	var directionud = Input.get_axis("up", "down")
	if directionud:
		velocity.y = directionud * SPEED
	else:
		velocity.y = move_toward(velocity.x, 0, SPEED)

	# Left and right movement
	var directionlr = Input.get_axis("left", "right")
	if directionlr:
		velocity.x = directionlr * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	
	
	move_and_slide()
