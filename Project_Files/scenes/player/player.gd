extends RigidBody2D

#signal start_game

const MAX_VEL : int = 600

@onready var animated_sprite_2d: AnimatedSprite2D = %AnimatedSprite2D
#
#func _ready() -> void:
#	freeze = true

func _input(event):
	if event.is_action_pressed("flap"):
			print("flap")
			animated_sprite_2d.play()
			flap()
#			start_game.emit()
			freeze = false
			

func flap():
	apply_central_force(Vector2(0, -20000))
	

