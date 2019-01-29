extends Control

export (Color) var color = Color(0, 0, 0, 1)
export (float) var width = 10.0

func _draw():
	if is_hovered():
		var r  = get_rect()
		var w  = r.end.x - r.position.x
		var h  = r.end.y - r.position.y
		var se = Vector2(0, h)
		var sw = Vector2(w, h)
		draw_line(se, sw, color, width, true)

func _input(event):
	if is_hovered() and event is InputEventMouseButton and not event.pressed:
		action()

func _notification(what):
	match what:
		NOTIFICATION_MOUSE_ENTER:
			get_node("/root/Pong/Audio").note()
