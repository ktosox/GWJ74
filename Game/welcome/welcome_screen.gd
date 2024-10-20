extends CanvasLayer

var last_four_keys = ["up","up","up","up"]

var correct_code = ["left","button_B","right","right"]

var valid_actions = ["button_A","button_B","left","right","up","down"]

var key_change_mode = false

var action_to_change : String

var button_to_change : Node

func _input(event: InputEvent) -> void:
	if key_change_mode:
		if event.is_class("InputEventJoypadButton") or event.is_class("InputEventKey") : #or event.is_class("InputEventJoypadMotion")
			InputMap.action_erase_event(action_to_change,InputMap.action_get_events(action_to_change)[0])
			InputMap.action_add_event(action_to_change,event)
			key_change_mode = false
			button_to_change.text = event.as_text()
			$InputSetup/MouseBlocker.visible = false
			pass
		return
		pass

	if event.is_action_pressed("button_A"):
		var success = 0
		for n in 4:
			if last_four_keys[n] == correct_code[n]:
				success +=1
		if success == 4:
			print("start game")
			GM.start_game()
			return
	for action in valid_actions :
		if event.is_action_pressed(action):
			last_four_keys.push_front(action)
			last_four_keys.resize(4)


func _on_left_pressed() -> void:
	button_to_change = $InputSetup/Left
	$InputSetup/MouseBlocker.visible = true
	key_change_mode = true
	action_to_change = "left"
	pass # Replace with function body.


func _on_up_pressed() -> void:
	button_to_change = $InputSetup/Up
	$InputSetup/MouseBlocker.visible = true
	key_change_mode = true
	action_to_change = "up"
	pass # Replace with function body.


func _on_down_pressed() -> void:
	button_to_change = $InputSetup/Down
	$InputSetup/MouseBlocker.visible = true
	key_change_mode = true
	action_to_change = "down"
	pass # Replace with function body.


func _on_button_b_pressed() -> void:
	button_to_change = $InputSetup/ButtonB
	$InputSetup/MouseBlocker.visible = true
	key_change_mode = true
	action_to_change = "button_B"
	pass # Replace with function body.


func _on_right_pressed() -> void:
	button_to_change = $InputSetup/Right
	$InputSetup/MouseBlocker.visible = true
	key_change_mode = true
	action_to_change = "right"
	pass # Replace with function body.


func _on_button_a_pressed() -> void:
	button_to_change = $InputSetup/ButtonA
	$InputSetup/MouseBlocker.visible = true
	key_change_mode = true
	action_to_change = "button_A"
	pass # Replace with function body.
