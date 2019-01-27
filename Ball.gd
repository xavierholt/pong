extends Node2D

export (Color) var color = Color(1, 0, 1, 1)

var shade    = Color(1, 0, 1, 0.1)
var spin     = float(0.01)
var velocity = Vector2(0, 0)
var player   = 0
var splash   = 0

# Position cache for trail effects:
var positions = PoolVector2Array()

func _ready():
	#set_color(color)
	#splash = preload("res://Splash.tscn")
	positions.resize(17)

func launch():
	var a = randf() * TAU
	spin     = randf() * 0.06 - 0.03
	velocity = Vector2(cos(a), sin(a))
	player   = randi() % 2
	
	for i in range(17):
		positions[i] = position
	set_color(get_player(player).color)
	show()

func stop():
	velocity = Vector2(0, 0)
	position = Vector2(0, 0)
	hide()

func get_player(i):
	return get_node("../Players").get_child(i)

func set_color(c):
	color = c
	shade = c
	shade.a = 0.1

func add_position():
	for i in range(1, 17):
		positions[i - 1] = positions[i]
	positions[16] = position
	
func _draw():
	draw_circle(positions[ 1],  5.0, shade)
	draw_circle(positions[ 4],  6.0, shade)
	draw_circle(positions[ 7],  7.0, shade)
	draw_circle(positions[10],  8.0, shade)
	draw_circle(positions[13],  9.0, shade)
	draw_circle(positions[16], 10.0, color)

func _physics_process(delta):
	velocity = velocity.rotated(spin)
	translate(velocity)
	add_position()
	
	if position.length_squared() > 2000:
		spin = 0.8 * spin
		var hitter   = get_player(player)
		var opponent = get_player(player ^ 1)
		var angle    = atan2(position.y, position.x)
		var score    = get_node("..")
		
		if hitter.hits(angle):
			spin += 0.2 * hitter.v
			print("Good pong!")
		elif opponent.hits(angle):
			spin += 0.2 * opponent.v
			score.score(player)
			print("Bad pong.")
		else:
			score.score(player ^ 1)
			print("No pong?")
		
		player = player ^ 1
		set_color(opponent.color)
		velocity = velocity.bounce(position.normalized())
		translate(velocity)
		add_position()

func _process(delta):
	update()
