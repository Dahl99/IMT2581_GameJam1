extends Area2D

export var type = "chocolate"

signal ice_cream_collected

func _ready():
	if type == "vanilla":
		$Sprite.texture = load("res://assets/ice_creams/ice_cream_vanilla.png")
	elif type == "chocolate":
		$Sprite.texture = load("res://assets/ice_creams/ice_cream_chocolate.png")
	elif type == "strawberry":
		$Sprite.texture = load("res://assets/ice_creams/ice_cream_strawberry.png")
	elif type == "pistachio":
		$Sprite.texture = load("res://assets/ice_creams/ice_cream_pistachio.png")


func _on_IceCream_body_entered(_body):
	emit_signal("ice_cream_collected", type)
	queue_free()
