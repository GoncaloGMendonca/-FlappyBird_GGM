extends Area2D

signal hit
signal scored



func _on_body_entered(_body: Node2D) -> void:
	hit.emit()
