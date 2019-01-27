extends Node2D

export (Color) var color = Color(0, 0, 0, 1)
export (float) var width = 10.0

var E
var X1
var X2
var I
var T1
var T2

func _ready():
	E = PoolVector2Array()
	E.push_back(Vector2(-325, 0))
	for i in range(57):
		var a = -1.75 * PI * i / 56.0
		E.push_back(Vector2(cos(a) * 100 - 250, sin(a) * 100))
		
	X1 = PoolVector2Array()
	X1.push_back(Vector2(-100, -100))
	X1.push_back(Vector2(+100, +100))
	
	X2 = PoolVector2Array()
	X2.push_back(Vector2(-100, +100))
	X2.push_back(Vector2(+100, -100))

	I = PoolVector2Array()
	I.push_back(Vector2(+150, -100))
	I.push_back(Vector2(+150, +100))
	
	T1 = PoolVector2Array()
	for i in range(33):
		var a = 0.5 * PI + 0.5 * PI * i / 32.0
		T1.push_back(Vector2(cos(a) * 100 + 300, sin(a) * 100))
	T1.push_back(Vector2(200, -200))
	
	T2 = PoolVector2Array()
	T2.push_back(Vector2(150 - width/2, -150))
	T2.push_back(Vector2(300, -150))

func _draw():
	draw_polyline(E,  color, width, true)
	draw_polyline(X1, color, width, true)
	draw_polyline(X2, color, width, true)
	draw_polyline(I,  color, width, true)
	draw_polyline(T1, color, width, true)
	draw_polyline(T2, color, width, true)
