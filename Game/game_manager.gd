extends Node

signal score_changed(score : int)

signal health_changed(new_health : int)

var starting_player_hp : int = 3

@export var current_player_hp : int

@export var current_player_score : int

func report_player_damage() -> bool: #returns true on death
	current_player_hp -= 1
	print("HP is now ",current_player_hp)
	if current_player_hp < 1:
		return true
	return false
	pass

func reset_player_values() -> void:
	current_player_hp = starting_player_hp
	current_player_score = 0
	
func report_fuel_collected():
	print("fuel get")
	pass
