extends CharacterBody2D

var direction = -1
const SPEED = 150
var lives = 3;

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
	
	if $RayCast2D.is_colliding() == false:
		direction = direction * -1;
		$RayCast2D.position.x *= -1;


func _on_collision_checker_body_entered(body):
	lives = lives -1;
	if (lives == 0):
		get_tree().change_scene_to_file("res://GameLevel.tscn");
