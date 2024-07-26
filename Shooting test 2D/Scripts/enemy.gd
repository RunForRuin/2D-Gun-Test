extends Node2D

@export var speed = 35
@onready var player_chase = false
@onready var player = get_parent().get_node("Player")







func _physics_process(delta):
	if player_chase == true:
		move_towards_player(delta)

func _on_find_box_body_exited(player):
	player_chase = false
	print("where you at")

func _on_find_box_body_entered(player):
	player_chase = true
	print("I see you")

func move_towards_player(delta):
	var direction = (player.position - position).normalized()
	position += direction * speed * delta
