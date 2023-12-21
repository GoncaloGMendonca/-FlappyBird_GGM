extends Node

@export var obstacle_scene : Array[PackedScene]

var paused = false

var game_running = false
var screen_size : Vector2
var obstacle_delay: int = 100
var obstacle_range: int = 200
var scroll_speed : int = 4
var scroll = 0
@export var scrolling_speed = 40

@onready var game_over_menu: CanvasLayer = $GameOverMenu
@onready var ground: Area2D = %Ground
@onready var obstacles_timer: Timer = %ObstaclesTimer
@onready var score_label: Label = $ScoreLabel
@onready var player: RigidBody2D = %Player
@onready var parallax_background: ParallaxBackground = %ParallaxBackground
@onready var obstacles: Area2D = %Obstacles


func _ready():
#		get_tree().paused = true
	screen_size = get_window().size
	player.freeze = true
	start_game()

func _process(delta):
	parallax_background.scroll_offset.x -= scrolling_speed * delta
	score_label.text = str(GameManager.score)
#	if game_running:
#		scroll += scroll_speed
#		#loop do ground
#		if scroll >= screen_size.x:
#			scroll = 0
#		ground.position.x = -scroll


func _on_obstacles_timer_timeout() -> void:
	generate_obstacles()

func generate_obstacles():
	print("PIPESES")
	var obstacle = obstacle_scene.pick_random().instantiate()
	obstacle.position.x = screen_size.x + obstacle_delay
	obstacle.position.y = (screen_size.y) / 2  + randi_range(-obstacle_range, obstacle_range)
	add_child(obstacle)


func new_game() -> void:
	print("NEW GAMEE")
#	player.freeze = false

func start_game():
	obstacles_timer.start()
	player.freeze = false

func game_over():
	obstacles_timer.stop()
	scrolling_speed = 0
	scroll = 0
#	obstacles.scroll_speed = 0
	print("FINALLLLLl")
#	get_tree().paused = true
	game_over_menu.show()
	



