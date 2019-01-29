extends Particles2D

func _process(delta):
	# Clean up after yourself!
	if not emitting: queue_free()
