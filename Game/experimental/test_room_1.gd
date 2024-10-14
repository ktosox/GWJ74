extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var new_collider = load("res://experimental/test_collider.tscn").instantiate()
	
	$Spawner.get_children()[randi()%$Spawner.get_child_count()].add_child(new_collider)
	pass # Replace with function body.
