extends Node2D

var red  = 0
var blue = 0

func setup():
	var score = get_node("Score")
	for i in range(1, 5):
		var r = score.get_child(4 - i)
		r.color = Color8(192, 192, 192)
		r.hide()
		var b = score.get_child(4 + i)
		b.color = Color8(192, 192, 192)
		b.hide()
	score.get_child(4).hide()
	red  = 0
	blue = 0
	
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	get_node("Players/Red").setup()
	get_node("Players/Blue").setup()
	
	get_node("/root/Pong/Game").show()
	get_node("/root/Pong/Menu/Buttons").hide()
	get_node("/root/Pong/AnimationPlayer").queue("Zoom")
	get_node("/root/Pong/AnimationPlayer").queue("Ready")

func launch():
	get_node("Ball").launch()
	
func finish():
	get_node("/root/Pong/Game").hide()
	get_node("/root/Pong/Menu/Buttons").show()
	get_node("/root/Pong/AnimationPlayer").play_backwards("Zoom")
	
	get_node("/root/Pong").remouse()
	#Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func victory(animation):
	get_node("Ball").stop()
	get_node("/root/Pong/AnimationPlayer").play(animation)

func score(i):
	var s = get_node("Score")
	var c = Color(1, 0, 1)
	var n
	
	if i == 0:
		red += 1
		c = c.linear_interpolate(Color(1, 0, 0), red / 4.0)
		n = s.get_child(4 - red)
	else:
		blue += 1
		c = c.linear_interpolate(Color(0, 0, 1), blue / 4.0)
		n = s.get_child(4 + blue)
	n.color = c
	n.jiggle()
	
	if red >= 4:
		victory("Red Wins")
	elif blue >= 4:
		victory("Blue Wins")
