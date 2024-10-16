extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var ring_scene = preload("res://experimental/cool_pass_ring.tscn")
	for R in 4 :
		var new_ring = ring_scene.instantiate()
		var left_or_right = ["left","right"]
		new_ring.get_node("Spinner").play(left_or_right[randi()%2])
		add_child(new_ring)
		await get_tree().create_timer(2.5).timeout
	#var new_collider = load("res://experimental/test_collider.tscn").instantiate()
	#
	#$Spawner.get_children()[randi()%$Spawner.get_child_count()].add_child(new_collider)
	pass # Replace with function body.
