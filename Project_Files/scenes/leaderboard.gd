extends CanvasLayer

@onready var highscore_label: Label = %HighscoreLabel
@onready var item_leaderboard: ItemList = %Item_Leaderboard
@onready var save_name_score_button: Button = $VBoxContainer/SaveNameScore_Button
@onready var input_player_name: TextEdit = %Input_PlayerName
@onready var save_game: Button = %Save_Game

@onready var label: Label = %Label
var highscores = [11,40,24,98,63]

func _process(_delta: float) -> void:
	highscore_label.text = "Highscore: " + str(SaveSystem.data.highscore) 
	label.text= str(SaveSystem.data.saveplayername) 

func _ready() -> void:
	highscores.sort()
	print(str(highscores))

	for i in range(0, highscores.size(),1): 
		if GameManager.score == 11: 
			highscores[i] = 22
			break
	item_leaderboard.add_item(str(highscores[0]))
	item_leaderboard.add_item(str(highscores[1]))
	item_leaderboard.add_item(str(highscores[2]))
	item_leaderboard.add_item(str(highscores[3]))
	item_leaderboard.add_item(str(highscores[4]))
