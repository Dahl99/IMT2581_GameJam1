extends Area2D

var explosion_particles_orange = load("res://mine/ParticlesMineExplosionOrange.tscn")

func _on_Mine_body_entered(body):
	var particles_orange = explosion_particles_orange.instance()
	particles_orange.position = self.position
	get_parent().add_child(particles_orange)
	particles_orange.emitting = true
	yield(get_tree().create_timer(0.6), "timeout")
	get_tree().change_scene("res://levels/Level1.tscn")


func explosion():
	# var particles_orange = explosion_particles_orange.instance()
	# particles_orange.position = self.position
	# get_parent().add_child(particles_orange)
	# particles_orange.emitting = true
	pass
