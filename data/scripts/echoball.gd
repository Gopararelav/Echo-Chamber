extends CharacterBody2D

const SPEED = 300
var strenght = 10


func _ready() -> void:
	velocity = Vector2(cos(rotation), sin(rotation))
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var info = move_and_collide((velocity * _delta) * SPEED)
	if info:
		var reflect = info.get_remainder().bounce(info.get_normal())
		velocity = velocity.bounce(info.get_normal())
		move_and_collide(reflect)
		strenght -= 1
		if strenght <= 0:
			queue_free()
