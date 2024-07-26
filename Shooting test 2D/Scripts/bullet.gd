extends Area2D

@onready var timer = $Timer
var velocity = Vector2(340,0)
var speed = 0
var pierce = 1
var damage = 50
	
	
func _physics_process(delta) -> void :
	#makes the bullet move
	position += velocity * delta
	

func _on_timer_timeout():
	queue_free()


#for collisions
	#when entering bodies
func _on_body_entered(body):
	pierce -= 1
	if pierce == 0 :
		queue_free()
	#when entering Area2D
func _on_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	pierce -= 1
	if pierce == 0 :
		queue_free()
