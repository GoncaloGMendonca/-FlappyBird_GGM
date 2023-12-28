extends RigidBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = %AnimatedSprite2D
@onready var player_sfx: AudioStreamPlayer = %Player_SFX

func _input(event):
	if GameManager.game_running == true:
		if event.is_action_pressed("flap"):
				animated_sprite_2d.play()
				flap()

func flap():
	apply_central_force(Vector2(0, -20000))
	player_sfx.play()
