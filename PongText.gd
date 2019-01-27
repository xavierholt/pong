extends CanvasItem

export (Color) var color = Color(0, 0, 0, 1)
export (float) var width = 10.0

var P1
var P2
var O
var N1
var N2
var G1
var G2

func _ready():
	P1 = PoolVector2Array()
	for i in range(97):
		var a = 1.5 * PI * i / 96 + 1.25 * PI
		P1.push_back(Vector2(cos(a) * 100 - 250, sin(a) * 100))
	P2 = PoolVector2Array()
	P2.push_back(Vector2(-350, -100))
	P2.push_back(Vector2(-350, +300))
	
	O = PoolVector2Array()
	for i in range(129):
		var a = PI * i / 64
		O.push_back(Vector2(cos(a) * 100, sin(a) * 100))
	
	N1 = PoolVector2Array()
	N1.push_back(Vector2(150, -100))
	N1.push_back(Vector2(150, +100))
	
	N2 = PoolVector2Array()
	N2.push_back(Vector2(350, +100))
	for i in range(49):
		var a = -0.75 * PI * i / 48.0
		N2.push_back(Vector2(cos(a) * 100 + 250, sin(a) * 100))
	
	G1 = PoolVector2Array()
	for i in range(49):
		var a = 1.5 * PI * i / 48 + 0.25 * PI
		G1.push_back(Vector2(cos(a) * 100 + 500, sin(a) * 100))
	
	G2 = PoolVector2Array()
	for i in range(33):
		var a = 0.5 * PI - 0.5 * PI * i / 32.0
		G2.push_back(Vector2(cos(a) * 100 + 500, sin(a) * 100 + 200))
	G2.push_back(Vector2(600, -100))

func _draw():
	draw_polyline(P1, color, width, true)
	draw_polyline(P2, color, width, true)
	draw_polyline(O,  color, width, true)
	draw_polyline(N1, color, width, true)
	draw_polyline(N2, color, width, true)
	draw_polyline(G1, color, width, true)
	draw_polyline(G2, color, width, true)
