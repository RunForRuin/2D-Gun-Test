extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
var max_dist = 30

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var mouse_pos = get_local_mouse_position()
	var dir = Vector2.ZERO.direction_to(mouse_pos)
	var dist = mouse_pos.length()
	child.position - dir * min(dist, max_dist)
