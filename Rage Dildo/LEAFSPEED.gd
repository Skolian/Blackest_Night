extends Area2D

func _ready() -> void:
	$AnimatedSprite.play("idle")

func _on_LEAFESPEED_body_entered(body: Node) -> void:
	if "Player" in body.name:
		body.LEAFSPEED()
		queue_free()
	
