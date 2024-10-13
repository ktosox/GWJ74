extends HBoxContainer


func toggle() -> void:
	if $BlinkyLine/Blinker.is_playing():
		$BlinkyLine/Blinker.play("RESET")
	else:
		$BlinkyLine/Blinker.play("blink")

func set_index_number(number : int) -> void:
	$Number.text = str(number) + '.'

func set_score(score : int) -> void:
	$Score.text = str(score) +'-'
	pass

func set_label(text : String) -> void:
	$StoredName.text = text
