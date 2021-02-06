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

func _on_Void_body_entered(_body):
	get_tree().change_scene("res://levels/Level1.tscn")

func bounce():
	velocity.y = JUMPFORCE * 0.5

func hurt(var enemy_pos_x):
	set_modulate(Color(1, 0.3, 0.3, 0.9))
	velocity.y = JUMPFORCE * 0.3

	if position.x < enemy_pos_x:
		velocity.x = -800
	elif position.x > enemy_pos_x:
		velocity.x = 800
	
	Input.action_release("move_left")
	Input.action_release("move_right")

	$Timer.start()

func _on_Timer_timeout():
	get_tree().change_scene("res://levels/Level1.tscn")