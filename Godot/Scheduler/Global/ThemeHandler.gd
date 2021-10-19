extends Node


var primary = Color("404040")
var secondary = Color("2a2a2a")
var background = Color("1c1c1c")


var ui_scale = OS.get_screen_scale()

func _reload_theme():
	var input = load("res://Theme/InputTheme.tres") as Theme
	var output = load("res://Theme/OutputTheme.tres") as Theme
	for style_path in ["tab_fg", "tab_bg"]:
		var style = input.get_stylebox(style_path, "Tabs").duplicate() as StyleBoxFlat
		style.content_margin_left *= ui_scale
		style.content_margin_right *= ui_scale
		output.set_stylebox(style_path, "Tabs", style)
	
	var font = input.default_font.duplicate() as DynamicFont
	font.size *= ui_scale
	output.default_font = font


func _ready():
	_reload_theme()


func _input(_event):
	if Input.is_action_just_released("ui_up"):
		ui_scale += 1
		get_tree().reload_current_scene()
		_reload_theme()
	elif Input.is_action_just_released("ui_down") and ui_scale > 1:
		ui_scale -= 1
		get_tree().reload_current_scene()
		_reload_theme()



