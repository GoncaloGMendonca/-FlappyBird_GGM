extends CanvasLayer

@onready var item_leaderboard: ItemList = %Item_Leaderboard
@onready var save_name_score_button: Button = $VBoxContainer/SaveNameScore_Button
@onready var input_player_name: TextEdit = %Input_PlayerName
@onready var save_game: Button = %Save_Game
@onready var lastscore_label: Label = %LastscoreLabel

func _process(_delta: float) -> void:
	lastscore_label.text = "Last Score: " + str(GameManager.score) 

func _ready() -> void:
	SaveSystem.data.saveleaderB.sort()
	item_leaderboard.add_item(str(SaveSystem.data.saveleaderB[9]))
	item_leaderboard.add_item(str(SaveSystem.data.saveleaderB[8]))
	item_leaderboard.add_item(str(SaveSystem.data.saveleaderB[7]))
	item_leaderboard.add_item(str(SaveSystem.data.saveleaderB[6]))
	item_leaderboard.add_item(str(SaveSystem.data.saveleaderB[5]))
	item_leaderboard.add_item(str(SaveSystem.data.saveleaderB[4]))
	item_leaderboard.add_item(str(SaveSystem.data.saveleaderB[3]))
	item_leaderboard.add_item(str(SaveSystem.data.saveleaderB[2]))
	item_leaderboard.add_item(str(SaveSystem.data.saveleaderB[1]))
	item_leaderboard.add_item(str(SaveSystem.data.saveleaderB[0]))

func sort_leaderboard() -> void:
	SaveSystem.data.saveleaderB.sort()
	print(str(SaveSystem.data.saveleaderB))
	for i in range(0, SaveSystem.data.saveleaderB.size(),1): 
		if GameManager.score > SaveSystem.data.saveleaderB[SaveSystem.data.saveleaderB.bsearch(GameManager.score) - 1]:
			SaveSystem.data.saveleaderB[i] = GameManager.score
			SaveSystem.data.saveleaderB.sort()
			break
	item_leaderboard.clear()
	item_leaderboard.add_item(str(SaveSystem.data.saveleaderB[4]))
	item_leaderboard.add_item(str(SaveSystem.data.saveleaderB[3]))
	item_leaderboard.add_item(str(SaveSystem.data.saveleaderB[2]))
	item_leaderboard.add_item(str(SaveSystem.data.saveleaderB[1]))
	item_leaderboard.add_item(str(SaveSystem.data.saveleaderB[0]))
	SaveSystem.data.saveleaderB 
	SaveSystem.save_data()
