extends Node

signal score_changed(score : int)

signal health_changed(new_health : int)

signal fuel_changed(new_fuel : int)

var starting_player_hp : int = 10

var starting_player_fuel : int = 6

@export var current_player_hp : int

@export var current_player_score : int

@export var current_player_fuel : int

func report_player_damage() -> bool: #returns true on death
	current_player_hp -= 1
	emit_signal("health_changed",current_player_hp)
	if current_player_hp < 1:
		return true
	return false
	pass

func report_point_get() -> void:
	current_player_score += 1
	emit_signal("score_changed",current_player_score)

func reset_player_values() -> void:
	current_player_hp = starting_player_hp
	current_player_score = 0
	current_player_fuel = starting_player_fuel
	
func report_fuel_collected():
	current_player_fuel += 5
	emit_signal("fuel_changed",current_player_fuel)

	pass

func report_fuel_use():
	current_player_fuel -= 1
	emit_signal("fuel_changed",current_player_fuel)

	pass

func end_game() -> void:
	get_tree().change_scene_to_file("res://leaderboard/leaderboard.tscn")
	get_tree().paused = false
	pass

func start_game():
	$StartGameSound.play()
	await get_tree().create_timer(0.8).timeout
	get_tree().change_scene_to_file("res://experimental/test_room_1.tscn")
	pass
