extends Area3D

var HP = 3


func get_hit() -> void:
	HP -= 1
	if HP < 1:
		queue_free()
	$Body.mesh.material.albedo_color += Color(0.25,0.25,0.25)
	pass

func _on_area_entered(area: Area3D) -> void:
	if area.is_in_group("bullet"):
		area.visible = false
		get_hit()
	pass # Replace with function body.
