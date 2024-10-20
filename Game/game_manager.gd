extends Node

signal score_changed(score : int)

signal health_changed(new_health : int)

signal fuel_changed(new_fuel : int)

signal activity_level_changed()



var starting_player_hp : int = 3

var starting_player_fuel : int = 7

@export var current_player_hp : int

@export var current_player_score : int

@export var current_player_fuel : int

var score_break_points = [26,18,12]

var current_activity_level = 0

func report_player_damage() -> bool: #returns true on death
	current_player_hp -= 1
	emit_signal("health_changed",current_player_hp)
	if current_player_hp < 1:
		return true
	return false
	pass

func report_point_get(point = 1) -> void:
	current_player_score += point
	emit_signal("score_changed",current_player_score)
	
	if current_player_score > score_break_points[0]:
		print("win game")
		return
	
	if current_player_score > score_break_points[1]:
		if current_activity_level < 2:
			current_activity_level = 2
			emit_signal("activity_level_changed")
			return 
	if current_player_score > score_break_points[2]:
		if current_activity_level < 1:
			current_activity_level = 1
			emit_signal("activity_level_changed")
			return

func reset_player_values() -> void:
	current_player_hp = starting_player_hp
	current_player_score = 0
	current_player_fuel = starting_player_fuel
	current_activity_level = 0
	
func report_fuel_collected():
	current_player_fuel += 4
	emit_signal("fuel_changed",current_player_fuel)

	pass

func report_fuel_use():
	current_player_fuel -= 1
	emit_signal("fuel_changed",current_player_fuel)

	pass

func end_game() -> void:
	$Leaderboard.process_mode = Node.PROCESS_MODE_ALWAYS
	$Leaderboard.visible = true
	$Leaderboard.new_score()
	pass

func start_game():
	$StartGameSound.play()
	reset_player_values()
	$WelcomeScreen.visible = false
	$WelcomeScreen.process_mode = Node.PROCESS_MODE_DISABLED
	$Leaderboard.visible = false
	$Leaderboard.turn_off()
	get_tree().change_scene_to_file("res://experimental/test_room_1.tscn")
	await get_tree().create_timer(0.8).timeout
	get_tree().paused = false
	
	get_tree().current_scene.process_mode = Node.PROCESS_MODE_PAUSABLE
	get_tree().current_scene.start_game()
	
	pass

func welcome_screen():
	$Leaderboard.visible = false
	$Leaderboard.turn_off()
	$Leaderboard.process_mode = Node.PROCESS_MODE_DISABLED
	$WelcomeScreen.process_mode = Node.PROCESS_MODE_ALWAYS
	$WelcomeScreen.visible = true


	pass
