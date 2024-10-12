extends ColorRect


func set_character(letter : String) -> void:
	$Label.text = letter

func get_character() -> String:
	return $Label.text
