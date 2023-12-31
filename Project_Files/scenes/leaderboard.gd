extends CanvasLayer

@onready var highscore_label: Label = %HighscoreLabel
@onready var item_leaderboard: ItemList = %Item_Leaderboard
@onready var save_name_score_button: Button = $VBoxContainer/SaveNameScore_Button
@onready var input_player_name: TextEdit = %Input_PlayerName

var main_dic={dic_one = {name="teste",score=6},
dic_two = {name="Construct",score=3},
dic_three = {name="thre",score=6},
dic_four = {name="four",score=8},
dic_five = {name="five",score=7},
dic_six = {name="six",score=53},
dic_seven = {name="seven",score=89},
dic_eight = {name="eight",score=15},
dic_nine = {name="nine",score=78},
dic_ten = {name="ten",score=53},
}
var arr =[main_dic.dic_one,main_dic.dic_two,main_dic.dic_three,main_dic.dic_four,main_dic.dic_five,main_dic.dic_six,main_dic.dic_seven,main_dic.dic_eight,main_dic.dic_nine,main_dic.dic_ten]

var player_name = "Morcego"

func _ready() -> void:
	_leaderboard_sorting()

func _process(_delta: float) -> void:
	highscore_label.text = "Highscore: " + str(SaveSystem.data.highscore) 


func _leaderboard_sorting():
#	_name_matched()
	pass


func _on_save_name_score_button_pressed() -> void:
	player_name=str(input_player_name.text)
	item_leaderboard.clear()
	item_leaderboard.add_item(str(arr[0].name,arr[0].score))
	item_leaderboard.add_item(str(arr[1].name,arr[1].score))
	item_leaderboard.add_item(str(arr[2].name,arr[2].score))
	item_leaderboard.add_item(str(arr[3].name,arr[3].score))
	item_leaderboard.add_item(str(arr[4].name,arr[4].score))
	item_leaderboard.add_item(str(arr[5].name,arr[5].score))
	item_leaderboard.add_item(str(arr[6].name,arr[6].score))
	item_leaderboard.add_item(str(arr[7].name,arr[7].score))
	item_leaderboard.add_item(str(arr[8].name,arr[8].score))
	item_leaderboard.add_item(str(arr[9].name,arr[9].score))
