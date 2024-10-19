extends PathFollow3D

var path_indicator_scene = preload("res://experimental/path_indicator.tscn")

func add_path_indicator() -> void:
	var new_indicator = path_indicator_scene.instantiate() as PathFollow3D
	get_parent().add_child(new_indicator)
	new_indicator.progress_ratio = 0.95
	pass

func reset_fuel() -> void:
	$AnimationPlayer.play("go_forward")
	pass



func _on_detector_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		GM.report_fuel_collected()
		$AnimationPlayer.play("get_collected")

	pass # Replace with function body.
