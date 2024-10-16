extends CharacterBody3D

const SPEED = 3

const TURN_ANGLE = 0.2
const TURN_SPEED = 0.1

var bullet_scene = preload("res://player/bullet.tscn")

var gun_ready = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("button_A") and gun_ready:
		fire_gun()
		pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	var directionX := Input.get_axis("left", "right")
	if directionX:
		velocity.x = directionX * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	var directionY := Input.get_axis("down","up")
	if directionY:
		velocity.y = directionY * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	rotation.x = move_toward(rotation.x,velocity.y * TURN_ANGLE,TURN_SPEED)
	rotation.y = move_toward(rotation.y,-velocity.x * TURN_ANGLE,TURN_SPEED)
	#rotation.x =
	 #= ,Vector3(velocity.y,-velocity.x,0),TURN_ANGLE)
	move_and_slide()
	pass

func fire_gun() -> void:
	gun_ready = false
	var new_bullet = bullet_scene.instantiate() as Node3D
	new_bullet.global_position = $GunOutput.global_position
	get_tree().current_scene.add_child(new_bullet)
	print("pew")
	$GunCooldown.start()
	pass

func get_hit() -> void:
	print("player got hit")
	pass


func _on_gun_cooldown_timeout() -> void:
	gun_ready = true
	if Input.is_action_pressed("button_A"):
		fire_gun()
	pass # Replace with function body.
