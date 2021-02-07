extends KinematicBody2D

var velocity = Vector2()
var speed = 50

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
	velocity.x = speed * direction

	velocity = move_and_slide(velocity, Vector2.UP)

func _on_top_body_entered(body):
	$AnimatedSprite.play("hurt")
	speed = 0
	set_collision_layer_bit(4, false)
	set_collision_mask_bit(0, false)
	$Top.set_collision_layer_bit(4, false)
	$Top.set_collision_mask_bit(0, false)
	$Sides.set_collision_layer_bit(4, false)
	$Sides.set_collision_mask_bit(0, false)

	$Timer.start()

	body.bounce()

func _on_Sides_body_entered(body):
	body.hurt(position.x)

func _on_Timer_timeout():
	queue_free()
