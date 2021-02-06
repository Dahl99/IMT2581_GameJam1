extends Area2D

var explosion_particles_orange = load("res://mine/ParticlesMineExplosionOrange.tscn")
var explosion_particles_red = load("res://mine/ParticlesMineExplosionRed.tscn")
var explosion_particles_grey = load("res://mine/ParticlesMineExplosionGrey.tscn")

func _on_Mine_body_entered(_body):
	var particles_orange = explosion_particles_orange.instance()
	var particles_red = explosion_particles_red.instance()
	var particles_grey = explosion_particles_grey.instance()
	particles_orange.position = self.position
	particles_red.position = self.position
	particles_grey.position = self.position
	get_parent().add_child(particles_orange)
	get_parent().add_child(particles_red)
	get_parent().add_child(particles_grey)
	particles_orange.emitting = true
	particles_red.emitting = true
	particles_grey.emitting = true
	
	$Timer.start()
	self.visible = false

	Input.action_release("move_left")
	Input.action_release("move_right")

func _on_Timer_timeout():
	get_tree().change_scene("res://levels/Level1.tscn")
	queue_free()
