extends CharacterBody2D

var direction = -1
const SPEED = 150

func _physics_process(delta):
	velocity.x = SPEED * direction;
	
	if direction:
		if direction == -1:
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("walk")
		else:
			$AnimatedSprite2D.flip_h = true
			$AnimatedSprite2D.play("walk")
	move_and_slide()
