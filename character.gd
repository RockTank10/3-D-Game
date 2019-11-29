extends KinematicBody

var gravity = Vector3.DOWN * 12
var speed = 4
var jump_speed = 6
var velocity = Vector3()
var spin = 0.1
var jump = false

func _physics_process(delta):
		velocity += gravity*delta
		get_input()
		velocity = move_and_slide(velocity, Vector3.UP)
		if jump and is_on_floor():
			velocity.y = jump_speed
		
func get_input():
	var vy = velocity.y
	velocity = Vector3()
	if Input.is_action_pressed("move_forward"):
		velocity += transform.basis.z * speed
	if Input.is_action_pressed("move_back"):
		velocity += -transform.basis.z * speed
	if Input.is_action_pressed("move_right"):
		velocity += -transform.basis.x * speed
	if Input.is_action_pressed("move_left"):
		velocity += transform.basis.x * speed
	velocity.y =vy
	jump = false
	if Input.is_action_just_pressed("jump"):
		jump = true
	if Input.is_action_just_pressed("start"):
		translation.x = 1
		translation.y = 1
		translation.z = 1
	if Input.is_action_just_pressed("1c"):
		translation.x = 0
		translation.y = 1
		translation.z = -41
	if Input.is_action_just_pressed("2c"):
		translation.x = 39
		translation.y = 5
		translation.z = -38
	if Input.is_action_just_pressed("3c"):
		translation.x = 36
		translation.y = 5
		translation.z = 34
	if Input.is_action_just_pressed("4c"):
		translation.x = -31
		translation.y = 2
		translation.z = 38
	if Input.is_action_just_pressed("5c"):
		translation.x = -32
		translation.y = 12
		translation.z = -38
	if Input.is_action_just_pressed("6c"):
		translation.x = -17
		translation.y = 11
		translation.z = 2
	if Input.is_action_just_pressed("End"):
		translation.x = -7
		translation.y = 24
		translation.z = 16
func _unhandled_input(event):
	if event is InputEventMouseMotion:
		rotate_y(-lerp(0,spin, event.relative.x/10))
	
