extends ColorRect

signal name_complete

var score_scene = preload("res://leaderboard/score.tscn")

var last_score

# Called when the node enters the scene tree for the first time.


#func update_order() -> void: # hahhaHAHahAHAHahhAHAHAha
	#var counter = 0.0
	#for score in $Layout.get_children():
		#counter += 0.5
		#var score_value = roundi(counter) 
		#if roundi(counter) == int(counter):
			#score_value +=5
		#score.set_index_number(score_value)
	#pass

func update_order(): # oK
	var index_number = 1
	for left_score in $LayoutLeft.get_children():
		left_score.set_index_number(index_number)
		index_number += 1
	for right_score in $LayoutRight.get_children():
		right_score.set_index_number(index_number)
		index_number += 1
	pass
	



func insert_score(score: Control, index : int) -> void:
	if index < 5:
		$LayoutLeft.add_child(score)
		$LayoutLeft.move_child(score,index-1)
		var score_to_reparent = $LayoutLeft.get_child(4)
		score_to_reparent.reparent($LayoutRight)
		$LayoutRight.move_child(score_to_reparent,0)
	else:
		$LayoutRight.add_child(score)
		$LayoutRight.move_child(score,index-5)
	$LayoutRight.get_child(4).queue_free()
	update_order()

	pass

func create_empty_score(points : int) -> Node:
	var new_score = score_scene.instantiate()
	new_score.score = points
	new_score.cool_name = ""
	insert_score(new_score,1)
	last_score = new_score
	return new_score
	pass

func pass_key_to_last_score(key : String) -> void:
	last_score.add_letter(key)
	pass
