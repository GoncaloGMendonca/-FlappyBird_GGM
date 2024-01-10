extends CanvasLayer

@onready var button_click_sfx: AudioStreamPlayer = %ButtonClick_SFX
@onready var parallax_background: ParallaxBackground = %ParallaxBackground
@onready var animated_sprite_2d: AnimatedSprite2D = $ParallaxBackground/ParallaxLayer5/AnimatedSprite2D

func _process(delta):
	parallax_background.scroll_offset.x -= 2 * delta

func _on_play_game_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main/main.tscn")

func _on_quit_button_pressed() -> void:
	get_tree().quit()

func _on_play_game_button_button_down() -> void:
	button_click_sfx.play() 

func _on_quit_button_button_down() -> void:
	button_click_sfx.play() 

