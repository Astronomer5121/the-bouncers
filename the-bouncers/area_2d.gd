extends Area2D

var ballcount = 0
var ball1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var collisionsarray = get_overlapping_areas()
	var collisionslength = collisionsarray.size()
	if collisionslength >= 1:
		ballcount = ballcount + 1
		if collisionsarray[0] != ball1:
			ball1 = collisionsarray[0]
			print(ballcount)
			if ballcount >= 2:
				get_tree().change_scene_to_file("res://endgame.tscn")

	pass
