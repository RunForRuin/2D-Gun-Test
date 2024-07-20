class_name Gun
extends Area2D

const bullet_path = preload("res://Scenes/bullet.tscn")
@onready var reload_timer = $ReloadTimer
@onready var shooting_point = $GunPgArt/ShootingPoint
@export var sprite : Sprite2D
@export var bullet : Sprite2D
var gun_1_bullets = 8

func _process(_delta) -> void :
	var fire = Input.is_action_just_pressed("fire")
	var alt_fire = Input.is_action_just_pressed("alt_fire")
	var reload = Input.is_action_just_pressed("reload")
	if fire and gun_1_bullets > 0 :
		var bullet = bullet_path.instantiate()
		shooting_point.add_child(bullet)
		
		gun_1_bullets = gun_1_bullets - 1
		
		print(gun_1_bullets)
	if reload :
		reload_timer.start()

	if alt_fire :
		print("MORE POWER")



func _on_reload_timer_timeout():
	gun_1_bullets = 8
	print("reloaded!")
