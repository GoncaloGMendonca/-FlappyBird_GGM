extends RigidBody2D




func _input(event):
	if event.is_action_pressed("flap"):
			print("EETETTETET")
			flap()

func flap():
	apply_impulse(Vector2(0, -1000), Vector2(0, 0))

