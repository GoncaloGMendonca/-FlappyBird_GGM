extends Node

var screen_size : Vector2
var obstacle_delay: int = 100
var obstacle_range: int = 200
@export var scrolling_speed = 40
@export var obstacle_scene : PackedScene

@onready var game_over_menu: CanvasLayer = $GameOverMenu
@onready var ground: Area2D = %Ground
@onready var obstacles_timer: Timer = %ObstaclesTimer
@onready var score_label: Label = %ScoreLabel
@onready var player: RigidBody2D = %Player
@onready var parallax_background: ParallaxBackground = %ParallaxBackground
@onready var obstacles: Area2D = %Obstacles
@onready var start_game_shortcut_button: Button = %Start_Game_Shortcut_Button
@onready var game_over_sfx: AudioStreamPlayer = %GameOver_SFX
@onready var back_ground_music: AudioStreamPlayer = %BackGround_Music
@onready var score_background: TextureRect = %Score_Background

func _ready():
	screen_size = get_window().size
	new_game()

func _process(delta):
	score_label.text = str(GameManager.score)
	if GameManager.game_running:
		parallax_background.scroll_offset.x -= scrolling_speed * delta

func _on_obstacles_timer_timeout() -> void:
	generate_obstacles()

func generate_obstacles():
	var obstacle = obstacle_scene.instantiate()
	obstacle.position.x = screen_size.x + obstacle_delay
	obstacle.position.y = (screen_size.y) / 2  + randi_range(-obstacle_range, obstacle_range)
	obstacle.hit.connect(game_over)
	add_child(obstacle)
	obstacle.animated_sprite_2d.play(obstacle.SPRITES.pick_random())

func new_game() -> void:
	GameManager.score = 0 
	player.freeze = true
	GameManager.game_running = false

func start_game():
	GameManager.game_running = true
	obstacles_timer.start()
	if GameManager.game_running:
		player.freeze = false

func game_over():
	if not game_over_sfx.playing:
		game_over_sfx.play()
	back_ground_music.stop()
	GameManager.game_running = false
	obstacles_timer.stop()
	score_label.hide()
	score_background.hide()
	start_game_shortcut_button.hide()
	player.gravity_scale = 2.5
	game_over_menu.show()
	SaveSystem.data.highscore = GameManager.score
	SaveSystem.save_data()

func _on_button_pressed() -> void:
	if GameManager.game_running == false:
		start_game()
