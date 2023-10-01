extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Rotate_Coin");

func _on_Gbody_entered(body):
	body.score_count();
	queue_free();
