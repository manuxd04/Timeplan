extends Node


signal reload

var primary = Color("404040")
var secondary = Color("2a2a2a")
var background = Color("1c1c1c")


const DEFAULT : Theme = preload("res://Theme/Theme.tres")
var theme : Theme = DEFAULT.duplicate()

var ui_scale = OS.get_screen_scale()
const MAX_SCALE = 5

var scroll_sensitivity = 0.1


func _ready():
	_reload_theme()



func _reload_theme():
	for style_path in ["tab_fg", "tab_bg"]:
		var style = DEFAULT.get_stylebox(style_path, "Tabs").duplicate() as StyleBoxFlat
		style.content_margin_left *= ui_scale
		style.content_margin_right *= ui_scale
		theme.set_stylebox(style_path, "Tabs", style)
	
	var font = DEFAULT.default_font.duplicate() as DynamicFont
	font.size *= ui_scale
	theme.default_font = font



func _input(event):
	if Input.is_action_pressed("ctrl"):
		if event is InputEventMouseButton:
			if event.button_index == 5 and ui_scale > OS.get_screen_scale():
				ui_scale -= event.factor * scroll_sensitivity
			elif event.button_index == 4 and ui_scale < OS.get_screen_scale() * MAX_SCALE:
				ui_scale += event.factor * scroll_sensitivity
			else: return
		elif event is InputEventPanGesture:
			ui_scale = min(
				max(ui_scale - event.delta.y * scroll_sensitivity, OS.get_screen_scale()),
				OS.get_screen_scale() * MAX_SCALE
			)
		else: return
		emit_signal("reload")
		_reload_theme()

func grab_grabber(width, height):
	width *= 0.25
	height *= 0.5
	if width <= 0 or height <= 0: return
	var tex = ImageTexture.new()
	var img = Image.new()
	img.create(width, height, false, Image.FORMAT_RGBA8)
	img.fill(secondary)
	img.lock()
	tex.create_from_image(img)
	return tex


