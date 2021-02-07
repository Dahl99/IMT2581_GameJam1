extends CanvasLayer

var ice_creams_collected = 0

func _ready():
	pass


func _on_ice_cream_collected(type):
	if type == "vanilla":
		$Panel/MarginContainer/HBoxContainer/Vanilla.texture = load("res://assets/ice_creams/ice_cream_vanilla.png")
		ice_creams_collected += 1
	elif type == "chocolate":
		$Panel/MarginContainer/HBoxContainer/Chocolate.texture = load("res://assets/ice_creams/ice_cream_chocolate.png")
		ice_creams_collected += 1
	elif type == "strawberry":
		$Panel/MarginContainer/HBoxContainer/Strawberry.texture = load("res://assets/ice_creams/ice_cream_strawberry.png")
		ice_creams_collected += 1
	elif type == "pistachio":
		$Panel/MarginContainer/HBoxContainer/Pistachio.texture = load("res://assets/ice_creams/ice_cream_pistachio.png")
		ice_creams_collected += 1


func _on_Goal_body_entered(_body):
	if ice_creams_collected == 4:
		# var image = Image.new()
		# image.load("res://assets/level/congrats.png")
		var TR = TextureRect.new()
		TR.texture = load("res://assets/level/congrats.png")
		TR.set_position(Vector2((1280/2)-150, 720/2))
		TR.rect_scale = Vector2(2, 2)
		self.add_child(TR)
