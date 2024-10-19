extends CharacterBody3D

const SPEED = 3

const TURN_ANGLE = 0.2
const TURN_SPEED = 0.1



var bullet_scene = preload("res://player/bullet.tscn")

var gun_ready = true

var ZA_WARUDO_ready = true

@onready var time_orb_material = $ShipBody/TimeOrb.mesh.material as StandardMaterial3D

@onready var gun_orb_material = $ShipBody/GunOrb.mesh.material as StandardMaterial3D

@export var can_be_hit = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("button_A") and gun_ready:
		fire_gun()
		pass
	if event.is_action_pressed("button_B") and ZA_WARUDO_ready:
		stop_time()
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

func stop_time() -> void: #ZA WARUDO!
	print("stoping time")
	ZA_WARUDO_ready = false
	time_orb_material.emission_energy_multiplier = 100
	get_tree().paused = true
	$ZA_WARUDO_Cooldown.start()
	await get_tree().create_timer(2).timeout
	get_tree().paused = false
	time_orb_material.emission_energy_multiplier = 0
	pass

func fire_gun() -> void:
	gun_ready = false
	$GunSound.play()
	var new_bullet = bullet_scene.instantiate() as Node3D
	new_bullet.global_position = $GunOutput.global_position
	get_tree().current_scene.add_child(new_bullet)
	print("pew")
	gun_orb_material.emission_energy_multiplier = 0
	$GunCooldown.start()
	pass

func get_hit() -> void:
	print("ouch")
	if !can_be_hit:
		return
	can_be_hit = false
	if GM.report_player_damage():
		set_physics_process(false)
		get_tree().paused = true
		$DamageAnimator.play("get_killed")
		$DeathSound.play()
	else:
		$DamageSound.play()
		$DamageAnimator.play("get_hit")

	pass

func end_game() -> void:
	GM.end_game()
	pass

func _on_gun_cooldown_timeout() -> void:
	gun_ready = true
	gun_orb_material.emission_energy_multiplier = 5
	if Input.is_action_pressed("button_A"):
		fire_gun()
	pass # Replace with function body.


func _on_za_warudo_cooldown_timeout() -> void:
	ZA_WARUDO_ready = true
	time_orb_material.emission_energy_multiplier = 5
	pass # Replace with function body.
