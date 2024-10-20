extends PathFollow3D

@export var points = 3



func _ready():
	$Label3D.text = str(points)
	pass

func get_hit() -> void:

	GM.report_point_get(points)
	$AnimationPlayer.play("RESET")
		
	#$Detector/Body.mesh.material.albedo_color += Color(0.5,0.5,0.5)
	pass

func spook(poses : bool) -> void:
	$GhostEffect.visible = poses
	
func restart():
	$AnimationPlayer.play("new_animation")
	pass

func _on_detector_area_entered(area: Area3D) -> void:
	print("bullet hit")
	if area.is_in_group("bullet") and visible:
		get_hit()
	pass # Replace with function body.


func _on_detector_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		body.get_hit()
	pass # Replace with function body.
