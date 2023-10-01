extends CharacterBody2D

const SPEED = 350.0
const JUMP_VELOCITY = -500.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Coins collected variable:
var score = 0
func score_count():
		score = score +1;
		
func get_move_direction():
	var direction = 0
	if Input.is_action_pressed("new_left"):
		direction = -1;
	elif Input.is_action_pressed("new_right"):
		direction = 1;
	else:
		direction = Input.get_axis("ui_left", "ui_right");
	return direction;
			
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		$animatedSprite2D.play("jump");
	# Handle Jump.
	elif Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$animatedSprite2D.play("jump");
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = get_move_direction();
		
	if direction:
		if direction == -1:
			$animatedSprite2D.flip_h = true;
		elif direction == 1:
			$animatedSprite2D.flip_h = false;
			
		velocity.x = direction * SPEED
		$animatedSprite2D.play("run");
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		$animatedSprite2D.play("idle");
	
	if Input.is_action_pressed("crouch") and is_on_floor():
		$animatedSprite2D.play("crouch");

	move_and_slide()
