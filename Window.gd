extends CanvasLayer

func offset_fit(screen, target):
	var sr = screen.x / screen.y
	var tr = target.x / target.y
	if sr > tr:
		pass
	else:
		pass
	pass

func scale_fit(screen, target):
	var sr = screen.x / screen.y
	var tr = target.x / target.y
	if sr > tr:
		return screen.y / target.y
	return screen.x / target.x

func get_window_size():
	if OS.window_fullscreen:
		return OS.get_screen_size()
	else:
		return OS.get_window_size()

func remouse():
	var size = get_window_size()
	Input.warp_mouse_position(size * 0.9)
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _ready():
	var size = get_window_size()
	randomize()
	
	var menu_offset = Vector2(size.x/2 - 150, size.y/2)
	var game_offset = Vector2(size.x/2, size.y/2)
	var s = scale_fit(size, Vector2(380, 380))
	
	var animation = get_node("AnimationPlayer").get_animation("Zoom")
	animation.track_set_key_value(0, 0, menu_offset)
	animation.track_set_key_value(0, 1, game_offset)
	animation.track_set_key_value(1, 1, Vector2(s, s))
	offset = menu_offset

func _input(event):
	if event is InputEventKey:
		if event.scancode == KEY_ESCAPE:
			get_tree().quit()
