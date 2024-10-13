extends ColorRect

var score_scene = preload("res://experimental/score.tscn")

var last_score

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	var new_score = insert_new_score(1)
	new_score.set_label("HELLO")
	new_score.set_score(50)
	new_score = insert_new_score(1)
	new_score.set_label("DERP")
	new_score.set_score(10)
	new_score = insert_new_score(8)
	new_score.set_label("LOSE")
	new_score.set_score(1)
	new_score = insert_new_score(7)
	new_score.set_label("WIN")
	new_score.set_score(10)

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
	



func insert_new_score(index : int) -> Node:
	var new_score = score_scene.instantiate()
	if index < 5:
		$LayoutLeft.add_child(new_score)
		$LayoutLeft.move_child(new_score,index-1)
		var score_to_reparent = $LayoutLeft.get_child(4)
		score_to_reparent.reparent($LayoutRight)
		$LayoutRight.move_child(score_to_reparent,0)
	else:
		$LayoutRight.add_child(new_score)
		$LayoutRight.move_child(new_score,index-5)
	$LayoutRight.get_child(4).queue_free()
	update_order()
	return new_score
	pass

func create_score(points : int) -> void:
	
	pass

func pass_key_to_last_score(key : String) -> void:
	
	pass
