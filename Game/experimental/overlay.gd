extends CanvasLayer


func _ready() -> void:
	GM.connect("health_changed", Callable(self,"set_player_health"))
	GM.connect("score_changed", Callable(self,"set_player_score"))
	pass
	
func set_player_health(HP : int) -> void:
	$TopLayout/Health.text = "HP: " + str(HP)
	pass

func set_player_score(score : int) -> void:
	$TopLayout/Score.text = "score: " + str(score)
