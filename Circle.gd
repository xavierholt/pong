extends Node2D

export (Color) var color  = Color(0, 0, 0, 1)
export (float) var radius = 25.0
export (float) var jiggle = 1.0

var points = PoolVector2Array()

func _draw():
	draw_circle(position, radius * jiggle, color)

func jiggle():
	get_node("AnimationPlayer").play("Jiggle")

func _process(delta):
	update()
