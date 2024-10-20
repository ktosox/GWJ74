extends PathFollow3D


func play_animation(animation : String):
	assert($WallAnimator.get_animation_list().has(animation))
	$WallAnimator.play(animation)
	pass


func _on_detector_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		body.get_hit()
	pass # Replace with function body.
