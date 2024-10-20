extends Node3D

@onready var fuel_scene = $Spawner/TopRight/Fuel
#
#var box_scene = preload("res://experimental/box.tscn")

@onready var boxes = [$Spawner/TopRight/Box,$Spawner/TopRight/Box2,$Spawner/TopRight/Box3,$Spawner/TopRight/Box4,$Spawner/TopRight/Box5]

var left_or_right = ["left","right","left","right"]



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	GM.connect("activity_level_changed",Callable(self,"update_activity_level"))
	pass # Replace with function body.

func start_game():
	# add player
	# start sound
	var player = load("res://player/player_controller.tscn").instantiate()
	player.transform.origin = $PlayerSpawnPoint.transform.origin
	add_child(player)
	$Music.play()
	pass

func update_activity_level(level : int):
	if level == 1:
		$MoveStuff.play("new_animation")
	if level == 2:
		$SpookyStuff.play("black_out")
	pass

func swap_box():

	var all_valid_lanes = $Spawner.get_children()
	
	for box in boxes:
		if box.visible and box.progress_ratio < 0.7 and box.progress_ratio > 0.2:
			box.spook()
			all_valid_lanes.erase(box.get_parent())
			box.reparent(all_valid_lanes[randi()%all_valid_lanes.size()])
			return
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
	
	if lane == -1:
		lane = randi()%$Spawner.get_child_count()
	var selected_lane = $Spawner.get_children()[lane]
	fuel_scene.reparent(selected_lane)
	fuel_scene.reset_fuel()
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


func _on_levels_animation_finished(anim_name: StringName) -> void:
	if anim_name == "chapter1":
		if GM.current_activity_level == 0 :
			$Levels.play("chapter2")
		else:
			$Levels.play("chapter3")
			$SpookyStuff.play("black_out")
	if anim_name == "chapter2":
		$Levels.play("chapter3")
	if anim_name == "chapter3":
		$Levels.play("chapter4")
	pass # Replace with function body.
