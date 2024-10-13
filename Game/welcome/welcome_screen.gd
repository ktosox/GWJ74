extends CanvasLayer

var last_four_keys = ["up","up","up","up"]

var correct_code = ["left","button_B","right","right"]

var valid_actions = ["button_A","button_B","left","right","up","down"]

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("button_A"):
		var success = 0
		for n in 4:
			if last_four_keys[n] == correct_code[n]:
				success +=1
		if success == 4:
			print("start game")
			return
	for action in valid_actions :
		if event.is_action_pressed(action):
			last_four_keys.push_front(action)
			last_four_keys.resize(4)
