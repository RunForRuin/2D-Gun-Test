extends Area2D

@onready var timer = $Timer
@onready var explosion_timer = $"Explosion Timer"


@onready var missile_hurtbox = $"missile hurtbox"
@onready var explosion_hurtbox = $"explosion hurtbox"

@onready var animated_sprite_2d = $AnimatedSprite2D

var velocity = Vector2(200,0)
var speed = 0
var damage = 150

func _physics_process(delta) -> void :
	#makes the missile move
	position += velocity * delta

	

func _on_timer_timeout():
	var explosion_timer_time = explosion_timer.get_time_left()
	animated_sprite_2d.play("Explosion")
	animated_sprite_2d.scale = Vector2(1.7, 1.7)
	velocity = Vector2(0,0)
	missile_hurtbox.disabled = true
	explosion_hurtbox.disabled = false
	if explosion_timer_time == 0 :
		explosion_timer.start()

	
func _on_explosion_timer_timeout():
	queue_free()

func _on_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	var explosion_timer_time = explosion_timer.get_time_left()
	animated_sprite_2d.play("Explosion")
	animated_sprite_2d.scale = Vector2(1.7, 1.7)
	velocity = Vector2(0,0)
	missile_hurtbox.disabled = true
	explosion_hurtbox.disabled = false
	if explosion_timer_time == 0 :
		explosion_timer.start()


func _on_body_entered(body):
	var explosion_timer_time = explosion_timer.get_time_left()
	animated_sprite_2d.play("Explosion")
	animated_sprite_2d.scale = Vector2(1.7, 1.7)
	velocity = Vector2(0,0)
	missile_hurtbox.disabled = true
	explosion_hurtbox.disabled = false
	if explosion_timer_time == 0 :
		explosion_timer.start()
