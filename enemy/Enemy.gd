extends KinematicBody2D

var velocity = Vector2()
export var direction = -1
export var detects_cliffs = true

func _ready():
	if direction == -1:
		$AnimatedSprite.flip_h = true

	$RayCast2D.position.x = $CollisionShape2D.shape.get_extents().x * direction
	$RayCast2D.enabled = detects_cliffs

func _physics_process(_delta):
	if is_on_wall() || !$RayCast2D.is_colliding() && detects_cliffs && is_on_floor():
		direction *= -1
		$AnimatedSprite.flip_h = !$AnimatedSprite.flip_h
		$RayCast2D.position.x = $CollisionShape2D.shape.get_extents().x * direction
	
	velocity.y += 20
	velocity.x = 50 * direction

	velocity = move_and_slide(velocity, Vector2.UP)
