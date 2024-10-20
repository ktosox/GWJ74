extends HBoxContainer

@export var score = 99
@export var cool_name = "GHOST"
	

func _ready() -> void:
	set_score(score)
	set_label(cool_name)
	if cool_name.length() > 4:
		return
	$BlinkyLine/Blinker.play("blink")

func toggle() -> void:
	if $BlinkyLine/Blinker.is_playing():
		$BlinkyLine/Blinker.play("RESET")
	else:
		$BlinkyLine/Blinker.play("blink")

func set_index_number(number : int) -> void:
	$Number.text = str(number) + '.'

func set_score(score : int) -> void:
	var text_score = str(score)
	if score < 10:
		text_score = "0" + str(score)
	$Score.text = text_score +'-'
	self.score = score
	pass

func add_letter(letter : String) -> void:
	$NameCompleteTimer.stop()
		
	if letter == "delete" and $StoredName.text.length() > 0:
		set_label($StoredName.text.erase($StoredName.text.length()-1))

	
	if $StoredName.text.length() < 5 and letter != "delete":
		set_label($StoredName.text + letter)
	if $StoredName.text.length() > 4:
		$BlinkyLine/Blinker.play("RESET")
		$NameCompleteTimer.start()
	else:
		$BlinkyLine/Blinker.play("blink")
		

func set_label(text : String) -> void:
	$StoredName.text = text


func _on_name_complete_timer_timeout() -> void:
	GM.welcome_screen()
	pass # Replace with function body.
