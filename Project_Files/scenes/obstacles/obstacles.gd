extends Area2D

signal hit
signal scored

var scroll_speed = 500 
var scroll_direction = Vector2.LEFT

const SPRITES := ["apple","pineapple","bananas","cherry"]

@onready var animated_sprite_2d: AnimatedSprite2D = %AnimatedSprite2D

func _process(delta):
	position += scroll_direction * scroll_speed * delta

func _on_body_entered(_body: RigidBody2D) -> void:
	hit.emit()
	print("HITTTT")

func _on_score_area_body_entered(body: Node2D) -> void:
	print("SCOREEEEEE")
	GameManager.score += 1

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	print("SAIUUUUUU")
	queue_free()

func _on_timer_timeout() -> void:
	animated_sprite_2d.play(SPRITES.pick_random())
