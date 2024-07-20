extends Area2D
@onready var timer = $Timer
var velocity = Vector2(100,0)
var speed = 300
func bullet_fired() -> void :
	timer.start()
	
func _physics_process(delta) -> void :
	position += velocity * delta

func _on_timer_timeout():
	queue_free()
