extends Node

func note():
	var i = randi() % 8
	get_child(i).play()

func play(note):
	get_node(note).play()

func chord():
	get_node("C4").play()
	get_node("C5").play()
