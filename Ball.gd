extends Node2D

export (Color) var color = Color(1, 0, 1, 1)

var shade    = Color(1, 0, 1, 0.1)
var spin     = float(0.01)
var velocity = Vector2(0, 0)
var player   = 0
var splashes

# Position cache for trail effects:
var positions = PoolVector2Array()

func _ready():
	positions.resize(17)
	splashes = [
		preload("res://splash/Red.tscn"),
		preload("res://splash/Blue.tscn"),
		preload("res://splash/Black.tscn")
	]

func launch():
	var a = randf() * TAU
	spin     = randf() * 0.04 - 0.02
	velocity = Vector2(cos(a), sin(a)) * 0.8
	player   = randi() % 2
	
	for i in range(17):
		positions[i] = position
	set_color(get_player(player).color)
	show()

func splash(angle, player):
	var s = splashes[player].instance()
	s.position = Vector2(cos(angle), sin(angle)) * 105
	s.rotate(angle)
	get_parent().add_child(s)
	s.emitting = true

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
		velocity *= 1.03
		spin     *= 0.50
		
		var audio    = get_node("/root/Pong/Audio")
		var hitter   = get_player(player)
		var opponent = get_player(player ^ 1)
		var angle    = atan2(position.y, position.x)
		var score    = get_node("..")
		
		if hitter.hits(angle):
			spin += 0.2 * hitter.v
			splash(angle, player)
			audio.note()
		elif opponent.hits(angle):
			spin += 0.2 * opponent.v
			splash(angle, player ^ 1)
			audio.play("Risset")
			score.score(player)
		else:
			splash(angle, 2)
			audio.play("Risset")
			score.score(player ^ 1)
			velocity *= 0.95
		player = player ^ 1
		set_color(opponent.color)
		velocity = velocity.bounce(position.normalized())
		velocity = velocity.rotated(randf() * 0.10 - 0.05)
		translate(velocity)
		add_position()

func _process(delta):
	update()
