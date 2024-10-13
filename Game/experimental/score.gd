extends HBoxContainer

func toggle() -> void:
	if $BlinkyLine/Blinker.is_playing():
		$BlinkyLine/Blinker.play("RESET")
	else:
		$BlinkyLine/Blinker.play("blink")

func set_number(number : int) -> void:
	$Number.text = str(number) + '.'

func set_label(text : String) -> void:
	$StoredName.text = text
