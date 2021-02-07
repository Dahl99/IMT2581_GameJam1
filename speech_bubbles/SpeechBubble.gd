extends Node2D

const CHARTIME = 0.05
const MARGINOFFSET = 4

onready var text_node = $Anchor/RichTextLabel
onready var text_bg = $Anchor/ColorRect

func _ready():
	visible = false
	set_text("Help! I've lost 4 of my ice creams, can you help me find them?", 3)

func set_text(text, wait_time = 3):
	visible = true

	$Timer.stop()
	$Timer.wait_time = wait_time

	text_node.bbcode_text = text

	var duration = text_node.text.length() * CHARTIME

	var text_size = text_node.get_font("normal_font").get_string_size(text_node.text)
	text_node.margin_right = text_size.x + MARGINOFFSET
	text_bg.margin_right = text_size.x + MARGINOFFSET

	$Tween.remove_all()
	$Tween.interpolate_property(text_node, "percent_visible", 0, 1, duration)
	$Tween.interpolate_property(text_bg, "margin_right", 0, text_size.x + MARGINOFFSET, duration)
	$Tween.interpolate_property($Anchor, "position", Vector2.ZERO, Vector2(-text_size.x/2, 0), duration)
	$Tween.start()

func _on_Tween_tween_all_completed():
	$Timer.start()

func _on_Timer_timeout():
	visible = false
