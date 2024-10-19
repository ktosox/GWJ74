extends CanvasLayer

var fuel_shown = 0

func _ready() -> void:
	GM.connect("health_changed", Callable(self,"set_player_health"))
	GM.connect("score_changed", Callable(self,"set_player_score"))
	GM.connect("fuel_changed",Callable(self,"set_player_fuel"))
	
	pass



func set_player_health(HP : int) -> void:
	$TopLayout/Health.text = "HP: " + str(HP)
	pass

func set_player_score(score : int) -> void:
	$TopLayout/Score.text = "score: " + str(score)

func set_player_fuel(fuel : int) -> void:
	if fuel_shown == fuel:
		return
		
	if fuel_shown < fuel:
		$FuelBars.get_children()[fuel_shown].visible = true
		fuel_shown += 1
		pass
	if fuel_shown > fuel:
		$FuelBars.get_children()[fuel_shown-1].visible = false
		fuel_shown -= 1
		pass
	set_player_fuel(fuel)
	if fuel == 0:
		$OutOfFuel.visible = true
	pass


func _on_start_set_fuel_timeout() -> void:
	set_player_fuel(GM.current_player_fuel)
	pass # Replace with function body.
