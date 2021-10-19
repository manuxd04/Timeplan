extends Button
class_name TopButton


export var line_width = 2
export var tween_up = {
	time = 0.15,
	transition = Tween.TRANS_CUBIC,
	easing = Tween.EASE_OUT
}
export var tween_down = {
	time = 0.5,
	transition = Tween.TRANS_BOUNCE,
	easing = Tween.EASE_OUT
}




func _ready():
	focus_mode = Control.FOCUS_NONE
	add_child(Tween.new())
	line_width *= ThemeHandler.ui_scale
	
	# ----- Style ----- #
	var style = StyleBoxFlat.new()
	
	style.bg_color = ThemeHandler.primary
	style.draw_center = false
	style.border_color = ThemeHandler.primary
	style.border_width_bottom = line_width
	style.content_margin_bottom = 5 * ThemeHandler.ui_scale
	style.content_margin_top = 5 * ThemeHandler.ui_scale
	style.content_margin_left = 5 * ThemeHandler.ui_scale
	style.content_margin_right = 5 * ThemeHandler.ui_scale
	
	set("custom_styles/hover", style)
	set("custom_styles/normal", style)
	# ----- Style ----- #
	
	
	# ----- Signals ----- #
	connect("mouse_entered", self, "_mouse_entered")
	connect("mouse_exited", self, "_mouse_exited")
	# ----- Signals ----- #



func _mouse_entered():
	var tween = get_child(0)
	var style = get("custom_styles/hover")
	tween.stop_all()
	tween.interpolate_property(
		style, "border_width_bottom",
		style.border_width_bottom, rect_size.y, tween_up.time,
		tween_up.transition, tween_up.easing
	)
	tween.start()



func _mouse_exited():
	var tween = get_child(0)
	tween.stop_all()
	var style = get("custom_styles/normal") as StyleBoxFlat
	tween.interpolate_property(
		style, "border_width_bottom",
		style.border_width_bottom, line_width, tween_down.time,
		tween_down.transition, tween_down.easing
	)
	tween.start()

