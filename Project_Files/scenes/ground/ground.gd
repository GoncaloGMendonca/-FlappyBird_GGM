extends Area2D

signal hitground

func _on_body_entered(_body: Node2D) -> void:
	hitground.emit()
