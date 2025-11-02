extends Area2D

const SPEED = 500
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	position += Vector2(cos(rotation), sin(rotation))
