extends Node

@export var obstacle_scene : Array[PackedScene]

var screen_size : Vector2
var obstacle_delay: int = 100
var obstacle_range: int = 200
var scroll_speed : int = 4
var scroll = 0


@onready var ground: Area2D = %Ground
@onready var obstacles_timer: Timer = %ObstaclesTimer
@onready var score_label: Label = $ScoreLabel

func _ready():
	screen_size = get_window().size
	obstacles_timer.start()

func _process(delta):
	score_label.text = str(GameManager.score)
	scroll += scroll_speed
	#loop do ground
	if scroll >= screen_size.x:
		scroll = 0
	ground.position.x = -scroll


func _on_obstacles_timer_timeout() -> void:
	generate_obstacles()

func generate_obstacles():
	var obstacle = obstacle_scene.pick_random().instantiate()
	obstacle.position.x = screen_size.x + obstacle_delay
	obstacle.position.y = (screen_size.y) / 2  + randi_range(-obstacle_range, obstacle_range)
	add_child(obstacle)

func stop_game():
	obstacles_timer.stop()



