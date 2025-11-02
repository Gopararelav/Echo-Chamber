extends CharacterBody2D

const SPEED = 250.0
@onready var BallPack = preload("res://data/objects/Echoball.tscn")

func _physics_process(_delta: float) -> void:
	var direction := Vector2(Input.get_axis("Move_left", "Move_right"), Input.get_axis("Move_up", "Move_down" ))
	if direction:
		velocity = direction.normalized() * SPEED
	else:
		velocity = Vector2(move_toward(velocity.x, 0, SPEED), move_toward(velocity.y, 0, SPEED))

	move_and_slide()
	
	if Input.is_action_just_pressed("Echo"):
		var line = Line2D.new()
		
		for i in range(1, 91):
			var Ball: CharacterBody2D = BallPack.instantiate()
			var rotate_in_deg = 4 * i
			Ball.position = Vector2(position.x + cos(deg_to_rad(rotate_in_deg)) * 35, position.y + sin(deg_to_rad(rotate_in_deg)) * 35)
			Ball.rotation = deg_to_rad(rotate_in_deg)
			line.add_point(Ball.position)
			$"../".add_child(Ball)
