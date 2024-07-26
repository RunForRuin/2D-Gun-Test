class_name Gun
extends Area2D


@onready var shooting_point = $GunPgArt/ShootingPoint
@export var sprite : Sprite2D

@onready var reload_timer = $"reload timer"
var gun_1_bullets = 8
const bullet_path = preload("res://Scenes/bullet.tscn")

@onready var alt_timer = $"alt timer"
var gun_1_alt = 2
const missile_path = preload("res://Scenes/missile.tscn")

func _process(_delta) -> void :
	var _debug_button = Input.is_action_just_pressed("debug")
	var fire = Input.is_action_just_pressed("fire")
	var alt_fire = Input.is_action_just_pressed("alt_fire")
	var reload = Input.is_action_just_pressed("reload")
	var reload_time = signf(reload_timer.get_time_left())
	var missile_time = signf(alt_timer.get_time_left())


	#bullet mechanics
	if fire and gun_1_bullets > 0 and reload_time == 0:
		var bullet = bullet_path.instantiate()
		get_tree().current_scene.add_child(bullet)
		bullet.rotation = rotation
		bullet.position = shooting_point.global_position 
		bullet.velocity = bullet.velocity.rotated(rotation)
		gun_1_bullets -= 1
		print(gun_1_bullets)
	elif fire and gun_1_bullets == 0 and reload_time == 0 :
		print("I'm out of ammo!")
	elif fire and reload_time > 0 :
		print("reloading!")

	#bullet reload mechanics
	if reload and gun_1_bullets < 8 and reload_time == 0 :
		reload_timer.start()
		print("starting reload!")
	elif reload and gun_1_bullets == 8 :
		print("I can't reload!")
	elif reload and reload_time > 0 :
		print("I can't reload!")

#missile mechanics
	if alt_fire and gun_1_alt > 0 :
		var missile = missile_path.instantiate()
		get_tree().current_scene.add_child(missile)
		missile.rotation = rotation
		missile.position = shooting_point.global_position
		missile.velocity = missile.velocity.rotated(rotation)
		gun_1_alt -= 1
		print(gun_1_alt)
	elif alt_fire and gun_1_alt == 0 :
		print("missile recharging!")

#missile reload mechanics
	if gun_1_alt < 2 and missile_time == 0 :
		alt_timer.start()
		print("missile recharging")


func _on_reload_timer_timeout():
	gun_1_bullets = 8
	print("reloaded!")

func _on_alt_timer_timeout():
	gun_1_alt += 1
	print("missile ready!")
