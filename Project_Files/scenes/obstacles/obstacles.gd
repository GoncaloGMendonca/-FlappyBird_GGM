extends Area2D

signal hit

const SPRITES := ["obstacule_1","obstacule_2","obstacule_3","obstacule_4"]

var scroll_speed = 500 
var scroll_direction = Vector2.LEFT

@onready var score_sfx: AudioStreamPlayer = %Score_SFX
@onready var animated_sprite_2d: AnimatedSprite2D = %AnimatedSprite2D

func _process(delta):
	if GameManager.game_running:
		position += scroll_direction * scroll_speed * delta

func _on_score_area_body_entered(_body: Node2D) -> void:
	GameManager.score += 1
	score_sfx.play()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()

func _on_body_entered(body: RigidBody2D) -> void:
	print("HIT") # Replace with function body.
	hit.emit()
