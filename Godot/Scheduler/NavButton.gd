extends Button




func _on_Button_mouse_entered():
	var animation = $StateMachine.get("parameters/playback")
	animation.travel("hover")



func _on_Button_mouse_exited():
	var animation = $StateMachine.get("parameters/playback")
	animation.travel("normal")



func _ready():
	var style = StyleBoxFlat.new()
	
	style.bg_color = ThemeHandler.primary
	style.draw_center = false
	style.border_color = ThemeHandler.primary
	style.border_width_bottom = 2
	style.content_margin_bottom = 5
	style.content_margin_top = 5
	style.content_margin_left = 5
	style.content_margin_right = 5
	
	set("custom_styles/hover", style)
	set("custom_styles/normal", style)
	
	$StateMachine.active = true


