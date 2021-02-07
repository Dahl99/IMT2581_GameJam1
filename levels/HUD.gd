extends CanvasLayer


func _ready():
	pass


func _on_ice_cream_collected(type):
	if type == "vanilla":
		$Panel/MarginContainer/HBoxContainer/Vanilla.texture = load("res://assets/ice_creams/ice_cream_vanilla.png")
	elif type == "chocolate":
		$Panel/MarginContainer/HBoxContainer/Chocolate.texture = load("res://assets/ice_creams/ice_cream_chocolate.png")
	elif type == "strawberry":
		$Panel/MarginContainer/HBoxContainer/Strawberry.texture = load("res://assets/ice_creams/ice_cream_strawberry.png")
	elif type == "pistachio":
		$Panel/MarginContainer/HBoxContainer/Pistachio.texture = load("res://assets/ice_creams/ice_cream_pistachio.png")
