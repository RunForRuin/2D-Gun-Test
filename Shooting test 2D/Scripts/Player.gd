extends CharacterBody2D

const SPEED := 300.0

@export var gun : Area2D # set in inspector

func _ready():
	pass

func _process(_delta) -> void :
	var mouse_pos := get_local_mouse_position()
	gun.rotation = mouse_pos.angle()
	gun.position = mouse_pos * 0.3
	gun.sprite.flip_v = signf(mouse_pos.x) - 1.0
	gun.position = gun.position.limit_length(35)
	#print(gun.position)
	


func _physics_process(_delta) -> void :
	# Up and down movement
	var vertical_dir := Input.get_axis("up", "down")

	if vertical_dir: 
		velocity.y = vertical_dir * SPEED
	else: 
		velocity.y = move_toward(velocity.x, 0, SPEED)

	# Left and right movement
	var horizontal_dir := Input.get_axis("left", "right")

	if horizontal_dir: 
		velocity.x = horizontal_dir * SPEED
	else: 
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()



