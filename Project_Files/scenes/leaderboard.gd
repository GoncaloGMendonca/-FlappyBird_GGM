extends CanvasLayer

@onready var lastscore_label: Label = %LastscoreLabel
@onready var item_leaderboard: ItemList = %Item_Leaderboard

func _process(_delta: float) -> void:
	lastscore_label.text = "Last Score: " + str(GameManager.score) 

func _ready() -> void:
	SaveSystem.data.saveleaderboard.sort()
	showScores()

func add_leaderboard() -> void:
	SaveSystem.data.saveleaderboard.sort()
	for i in range(0, SaveSystem.data.saveleaderboard.size(),1): 
		if GameManager.score > SaveSystem.data.saveleaderboard[SaveSystem.data.saveleaderboard.bsearch(GameManager.score) - 1]:
			SaveSystem.data.saveleaderboard[i] = GameManager.score
			SaveSystem.data.saveleaderboard.sort()
			break
	showScores()

func showScores() -> void:
	item_leaderboard.clear()
	item_leaderboard.add_item(str(SaveSystem.data.saveleaderboard[9]))
	item_leaderboard.add_item(str(SaveSystem.data.saveleaderboard[8]))
	item_leaderboard.add_item(str(SaveSystem.data.saveleaderboard[7]))
	item_leaderboard.add_item(str(SaveSystem.data.saveleaderboard[6]))
	item_leaderboard.add_item(str(SaveSystem.data.saveleaderboard[5]))
	item_leaderboard.add_item(str(SaveSystem.data.saveleaderboard[4]))
	item_leaderboard.add_item(str(SaveSystem.data.saveleaderboard[3]))
	item_leaderboard.add_item(str(SaveSystem.data.saveleaderboard[2]))
	item_leaderboard.add_item(str(SaveSystem.data.saveleaderboard[1]))
	item_leaderboard.add_item(str(SaveSystem.data.saveleaderboard[0]))
