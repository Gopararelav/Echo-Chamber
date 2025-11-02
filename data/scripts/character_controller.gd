extends CharacterBody2D

const SPEED = 250.0
@onready var BallPack = preload("res://data/objects/Echoball.tscn")

func _physics_process(_delta: float) -> void:
	var direction := Vector2(Input.get_axis("Move_left", "Move_right"), Input.get_axis("Move_up", "Move_down" ))
	if direction:
		velocity = direction.normalized() * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
	move_and_slide()
	
	if Input.is_action_just_pressed("Echo"):
		var Ball: Area2D = BallPack.instantiate()
		Ball.look_at(get_local_mouse_position())
		Ball.position = position
		$"../".add_child(Ball)
