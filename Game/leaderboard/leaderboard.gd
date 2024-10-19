extends CanvasLayer



func _ready() -> void:
	$HighScores.create_empty_score(GM.current_player_score)

	




func _on_keyboard_key_selected(key: String) -> void:
	$HighScores.pass_key_to_last_score(key)
	pass # Replace with function body.


func _on_keyboard_key_removed() -> void:
	$HighScores.pass_key_to_last_score("delete")
	pass # Replace with function body.
