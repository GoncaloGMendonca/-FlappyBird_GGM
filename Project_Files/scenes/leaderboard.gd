extends CanvasLayer

@onready var highscore_label: Label = %HighscoreLabel


func _process(delta: float) -> void:
	highscore_label.text =  str(SaveSystem.data.highscore) 

func addleaderboard() -> void:
	pass
