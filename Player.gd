extends CharacterBody3D


const SPEED = 10.0
const JUMP_VELOCITY = 4.5


func _ready() -> void:
	$Human/AnimationPlayer.speed_scale = 2


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var input_dir := Input.get_vector("Left", "Right", "Forward", "Backward")
	var direction := (transform.basis * Vector3(-input_dir.x, 0, -1)).normalized()
	if direction:
		$Human/AnimationPlayer.play("Walk")
		velocity.x = -direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	move_and_slide()
