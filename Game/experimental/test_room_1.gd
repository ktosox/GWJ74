extends Node3D

var fuel_scene = preload("res://experimental/fuel.tscn")

var box_scene = preload("res://experimental/box.tscn")

var left_or_right = ["left","right","left","right"]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GM.reset_player_values()
	
	pass # Replace with function body.




func spawn_box():
	var new_box = box_scene.instantiate()
	var random_lane = $Spawner.get_children()[randi()%$Spawner.get_child_count()]
	random_lane.add_child(new_box)
	pass

func spawn_fuel():
	var new_fuel = fuel_scene.instantiate()
	var random_lane = $Spawner.get_children()[randi()%$Spawner.get_child_count()]
	random_lane.add_child(new_fuel)
	pass

func _on_timer_timeout() -> void:
	var ring_scene = preload("res://experimental/cool_pass_ring.tscn")
	var new_ring = ring_scene.instantiate()
	new_ring.get_node("Spinner").play(left_or_right.pop_front())
	add_child(new_ring)
	if left_or_right.size() < 1:
		$Timer.stop()
	#var new_collider = load("res://experimental/test_collider.tscn").instantiate()
	#
	#$Spawner.get_children()[randi()%$Spawner.get_child_count()].add_child(new_collider)
	pass # Replace with function body.
