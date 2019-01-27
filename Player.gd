extends Node2D

export (float)  var start   = 0.0
export (Color)  var color   = Color(1, 0, 0, 1)
export (String) var caction = 'ui_up'
export (String) var waction = 'ui_down'

var colors = PoolColorArray()
var points = PoolVector2Array()
var buffer = PoolVector2Array()

const radius = 100
const glow   = 30

var x = 0
var y = 0
var w = 0.6

var v = 0
var a = 0

func setup():
	v = 0
	a = 0
	w = 0.6
	x = start * TAU - w/2
	y = start * TAU + w/2

func hits(a):
	return fposmod(y - a, TAU) < fposmod(x - a, TAU)

func _ready():
	colors.resize(4)
	points.resize(4)
	var c = color
	c.a = 0.2
	colors[0] = c
	colors[3] = c
	c.a = 0.0
	colors[1] = c
	colors[2] = c
	setup()

func _draw():
	var arc = PoolVector2Array()
	for i in range(17):
		var a = y * (i / 16.0) + x * (1 - i / 16.0)
		var v = Vector2(cos(a), sin(a))
		points[2] = v * (radius + glow)
		points[3] = v * (radius + 5)
		if i > 0:
			draw_primitive(points, colors, buffer)
		points[1] = points[2]
		points[0] = points[3]
		arc.push_back(v * radius)
	draw_polyline(arc, color, 6, true)

func _physics_process(delta):
	a = 0
	if Input.is_action_pressed(caction):
		a += 0.02
	if Input.is_action_pressed(waction):
		a -= 0.02
	v = v * 0.9 + a
	
	w = 0.6 + 5 * abs(v)
	if v > 0:
		x = fposmod(x + v, TAU)
		y = x + w
	else:
		y = fposmod(y + v, TAU)
		x = y - w

func _process(delta):
	update()
