extends Area2D

signal hitground

func _on_body_entered(body: Node2D) -> void:
	print("CHAOO HIT")
	hitground.emit()
