extends Area2D




func _physics_process(delta):
	var mouse_posx = get_global_mouse_position().x
	var mouse_posy = get_global_mouse_position().y
	
	#constrains how far the mouse can move in and out
	var min_distx = 0 + mouse_posx
	var max_distx = 150 + mouse_posx
	var min_dist_negx = 0 - mouse_posx
	var max_dist_negx = -150 - mouse_posx
	var min_disty = 0 + mouse_posy
	var max_disty = 150 + mouse_posy
	var min_dist_negy = 0 - mouse_posy
	var max_dist_negy = -150 - mouse_posy
	
	#
	print(mouse_posx)
	print(mouse_posy)
	print("separation")
	print(global_position)
	print("sep2")
	print(get_global_mouse_position())
	
	#makes the gun point towards the mouse
	look_at(get_global_mouse_position())
	
	#moves the gun in and out based on mouse position
	if mouse_posx >= min_distx and mouse_posx <= max_distx:
		global_position.x = mouse_posx * .3
	elif mouse_posx <= min_dist_negx and mouse_posx >= max_dist_negx:
		global_position.x = mouse_posx * .3
	if mouse_posy >= min_disty and mouse_posy <= max_disty:
		global_position.y = mouse_posy  * .3
	elif mouse_posy <= min_dist_negy and mouse_posy >= max_dist_negy:
		global_position.y = mouse_posy * .3
	
	
	#flips gun when rotating
	if get_global_mouse_position().x <= global_position.x:
		$GunPgArt.flip_v = true
	elif get_global_mouse_position().x >= global_position.x:
		$GunPgArt.flip_v = false
	
	
	
