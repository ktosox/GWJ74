extends ColorRect

var score_scene = preload("res://experimental/score.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for test in $Layout.get_children():
		if randi()%2:
			test.set_label("")
			test.toggle()
	insert_new_score(4).set_label("HELLO")

func update_order() -> void:
	
	pass


func insert_new_score(index : int) -> Node:
	var new_score = score_scene.instantiate()
	$Layout.add_child(new_score)
	$Layout.move_child(new_score,index)
	$Layout.get_child(10).queue_free()
	return new_score
	pass
