extends CanvasLayer

@onready var button_click_sfx: AudioStreamPlayer = %ButtonClick_SFX

#func _ready() -> void:
#	SaveSystem.data.Saveplayer_name = GameManager.player_name

func _on_play_game_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main/main.tscn")

func _on_quit_button_pressed() -> void:
	get_tree().quit()

func _on_play_game_button_button_down() -> void:
	button_click_sfx.play() 

func _on_quit_button_button_down() -> void:
	button_click_sfx.play() 
