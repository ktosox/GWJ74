extends ColorRect

signal key_selected(key : String)

signal key_removed

@onready var selected_character = $GridContainer/Character

const character_offset = Vector2(46,76)

var position_to_character_map = {}

func _ready() -> void:

	var letter_code = 65
	for character in $GridContainer.get_children():
		character.set_character(char(letter_code))
		if letter_code > 89 :
			letter_code = 47
		#if letter_code == 46:
			#letter_code += 1
		letter_code += 1


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("button_A"):
		emit_signal("key_selected",selected_character.get_character())
		print(selected_character.get_character())
	if event.is_action_pressed("button_B"):
		emit_signal("key_removed")
	if event.is_action_pressed("down") or event.is_action_pressed("left") or event.is_action_pressed("right") or event.is_action_pressed("up"):
		move_selector()
	#has_method("set_character")
	pass

func select_character(character : Control) -> void:
	 
	$Selector.global_position = character.global_position
	
	selected_character = character

func move_selector() -> void:
	if Input.is_action_pressed("left"):
		if selected_character.position.x == 0:
			return
		select_character(position_to_character_map[Vector2(selected_character.position.x-character_offset.x,selected_character.position.y)])
	if Input.is_action_pressed("right"):
		if selected_character.position.x == 368:
			return
		select_character(position_to_character_map[Vector2(selected_character.position.x+character_offset.x,selected_character.position.y)])
	if Input.is_action_pressed("up"):
		if selected_character.position.y == 0:
			return
		select_character(position_to_character_map[Vector2(selected_character.position.x,selected_character.position.y-character_offset.y)])
	if Input.is_action_pressed("down"):
		if selected_character.position.y == 228:
			return
		select_character(position_to_character_map[Vector2(selected_character.position.x,selected_character.position.y+character_offset.y)])
	$MoveTimer.start()
	pass
# WHAT THIS DOES

# shows keyboard

# allows selection of characters by directional keys

# has interface for sending selected keys

func load_map():
	for character in $GridContainer.get_children():
		position_to_character_map[character.position] = character
	#print(position_to_character_map)
	pass


func _on_move_timer_timeout() -> void:
	if Input.is_action_pressed("down") or Input.is_action_pressed("left") or Input.is_action_pressed("right") or Input.is_action_pressed("up"):
		move_selector()
	pass # Replace with function body.
