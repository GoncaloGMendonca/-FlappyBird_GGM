extends CanvasLayer



func _on_quit_main_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu/main_menu.tscn")


func _on_restart_game_button_pressed() -> void:
	print("CLIKCKCKCK")
