extends Area3D

@export_enum("left","right") var wall_pattern = 0


	

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		body.get_hit()

	pass # Replace with function body.
