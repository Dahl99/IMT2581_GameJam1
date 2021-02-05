extends KinematicBody2D

const SPEED = 270
const GRAVITY = 35
const JUMPFORCE = -910

var velocity = Vector2()

func _physics_process(_delta):
	if Input.is_action_pressed("move_right"):
		velocity.x = SPEED
		$Sprite.play("Walk")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("move_left"):
		velocity.x = -SPEED
		$Sprite.play("Walk")
		$Sprite.flip_h = true
	else:
		velocity.x = lerp(velocity.x, 0, 0.2)
		$Sprite.play("Idle")

	if Input.is_action_just_pressed("jump") && is_on_floor():
		velocity.y = JUMPFORCE
	else:
		velocity.y += GRAVITY

	if !is_on_floor():
		$Sprite.play("Jump")

	velocity = move_and_slide(velocity, Vector2.UP)