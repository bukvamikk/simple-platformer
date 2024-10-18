extends Area2D
@onready var game_manager: Node = %GameManager
@onready var timer: Timer = $Timer
@onready var life = 3
@onready var player_animated_sprite: AnimatedSprite2D = $PlayerAnimatedSprite


func _on_body_entered(body: Node2D) -> void:
	life -= 1
	if life == 0:
		print("Died")
		body.get_node("CollisionShape2D").queue_free()
		timer.start()
	else:
		print("hurt")

func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene()
