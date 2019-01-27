extends Node2D

export (Color) var color  = Color(0, 0, 0, 1)
export (float) var radius = 25.0
export (float) var jiggle = 1.0

var points = PoolVector2Array()

func _draw():
	#for i in range(64):
	#	var a = TAU * i / 64
	#	points.push_back(Vector2(cos(a), sin(a)) * radius)
	#draw_colored_polygon(points, color)
	draw_circle(position, radius * jiggle, color)

func jiggle():
	get_node("AnimationPlayer").play("Jiggle")

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	update()
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
