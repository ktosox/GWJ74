extends CanvasLayer





func new_score():
	$HighScores.create_empty_score(GM.current_player_score)
	$Keyboard.block_input = false

func turn_off():
	$Keyboard.block_input = true
	pass

func _on_keyboard_key_selected(key: String) -> void:

	$HighScores.pass_key_to_last_score(key)
	pass # Replace with function body.


func _on_keyboard_key_removed() -> void:

	$HighScores.pass_key_to_last_score("delete")
	pass # Replace with function body.
