extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_keyboard_key_selected(key: String) -> void:
	$Label.text = $Label.text + key
	pass # Replace with function body.


func _on_keyboard_key_removed() -> void:

	$Label.text = $Label.text.erase($Label.text.length()-1)
	pass # Replace with function body.
