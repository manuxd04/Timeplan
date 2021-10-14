tool
extends PanelContainer


export(Color) var bg_color = Color(0,0,0) setget set_color
export(Texture) var bg_texture = null setget set_texture


func set_color(new_col):
	bg_color = new_col
	if not bg_texture:
		var style = StyleBoxFlat.new()
		style.bg_color = new_col
		set("custom_styles/panel", style)
		


func set_texture(new_tex):
	bg_texture = new_tex
	if new_tex:
		var style = StyleBoxTexture.new()
		style.texture = new_tex
		set("custom_styles/panel", style)
	else: set_color(bg_color)


