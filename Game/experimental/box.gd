extends PathFollow3D

var HP = 3


func get_hit() -> void:
	HP -= 1
	if HP < 1:
		queue_free()
		
	$Detector/Body.mesh.material.albedo_color += Color(0.25,0.25,0.25)
	pass



func _on_detector_area_entered(area: Area3D) -> void:
	print("bullet hit")
	if area.is_in_group("bullet"):
		area.visible = false
		get_hit()
	pass # Replace with function body.


func _on_detector_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		body.get_hit()
	pass # Replace with function body.
