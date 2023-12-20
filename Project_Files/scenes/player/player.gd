extends RigidBody2D


@onready var animated_sprite_2d: AnimatedSprite2D = %AnimatedSprite2D


func _input(event):
	if event.is_action_pressed("flap"):
			print("EETETTETET")
			animated_sprite_2d.play()
			flap()

func flap():
	apply_force(Vector2(0, -20000))

