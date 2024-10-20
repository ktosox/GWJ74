extends Node3D

#var fuel_scene = preload("res://experimental/fuel.tscn")
#
#var box_scene = preload("res://experimental/box.tscn")

@onready var boxes = [$Spawner/TopRight/Box,$Spawner/TopRight/Box2,$Spawner/TopRight/Box3,$Spawner/TopRight/Box4,$Spawner/TopRight/Box5]

var left_or_right = ["left","right","left","right"]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GM.reset_player_values()
	GM.connect("activity_level_changed",Callable(self,"update_activity_level"))
	pass # Replace with function body.



func update_activity_level(level : int):
	
	pass


func spawn_box(lane = -1):
	var free_box
	for box in boxes:
		if !box.visible:
			free_box = box
	print(boxes)
	if lane == -1:
		lane = randi()%$Spawner.get_child_count()
	var selected_lane = $Spawner.get_children()[lane]
	free_box.reparent(selected_lane)
	free_box.restart()
	pass

func spawn_fuel(lane = -1):
	#var new_fuel = fuel_scene.instantiate()
	#if lane == -1:
		#lane = randi()%$Spawner.get_child_count()
	#var random_lane = $Spawner.get_children()[lane]
	#random_lane.add_child(new_fuel)
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
