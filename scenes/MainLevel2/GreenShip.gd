extends KinematicBody2D

var speed: float = 200
var max_velocity: float = 2500
var friction: float = 20
var kinematic_body : KinematicBody2D = self
var gravity: float = 9800 * 1.3

var particlesNode: Particles2D

func _ready():
	particlesNode = get_node("Particles2D")
	pass

func spawnExplosion():
	var explosionNode = preload("res://scenes/explosion.tscn").instance()
	get_parent().add_child(explosionNode)
	explosionNode.position = position
	return explosionNode

func goExplode():
	spawnExplosion()
	queue_free()
	particlesNode.queue_free()
	get_parent().add_child(preload("res://GameOver.tscn").instance())

func checkOnOutOfBound():
	if kinematic_body.position.y > 550 || kinematic_body.position.y < -100 || kinematic_body.position.x > 1200 || kinematic_body.position.x < -100:
		goExplode()

func rotation_degrees_to_vector(degrees: float):
	# Convert degrees to radians
	var radians = deg2rad(degrees)
	# Create a rotation matrix and extract the basis vector
	var rotation_matrix = Transform2D(0, Vector2(0, 0)).rotated(radians)
	return rotation_matrix

func _process(delta):
	var input_direction = Vector2()
	checkOnOutOfBound()
	if Input.is_action_pressed("ui_z"):
		input_direction.y -= 50 * delta
		particlesNode.emitting = true
	else:
		particlesNode.emitting = false

	if Input.is_action_pressed("ui_x"):
		rotate(0.1)
	if Input.is_action_pressed("ui_c"):
		rotate(-0.1)

	input_direction = rotation_degrees_to_vector(rotation_degrees).basis_xform(input_direction)

	# Normalize the input direction to ensure consistent movement speed in all directions
	input_direction = input_direction.normalized()

	# Calculate the velocity
	var velocity = input_direction * speed

	# Limit the velocity to the maximum allowed
	velocity = velocity.clamped(max_velocity)
		
	# Apply auto-deceleration (friction) if no input is given
	if input_direction == Vector2():
		velocity = velocity.linear_interpolate(Vector2(), friction * delta)

	velocity.y += gravity * delta

	# Move the KinematicBody2D
	move_and_slide(velocity)
