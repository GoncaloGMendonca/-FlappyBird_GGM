extends Area2D

signal hit
signal scored

var scroll_speed = 500 
var scroll_direction = Vector2.LEFT


func _process(delta):
	position += scroll_direction * scroll_speed * delta


func _on_body_entered(_body: Node2D) -> void:
	hit.emit()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	print("SAIUUUUUU")
	queue_free()
