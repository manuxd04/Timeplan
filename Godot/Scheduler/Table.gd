tool
extends PanelContainer


export(Color) var bg_color = Color(0,0,0,0) setget set_color
export(Texture) var bg_texture = null setget set_texture
export(Vector2) var texture_scale = Vector2(1,1) setget set_texture_scale

onready var bg = get_node("Vertical/Horizontal/Content")

func _ready():
	set_color(bg_color)
	_on_Content_resized()

func set_color(new_col):
	bg_color = new_col
	if not bg: return
	if not bg_texture:
		var style = StyleBoxFlat.new()
		style.bg_color = new_col
		bg.set("custom_styles/panel", style)

func set_texture(new_tex):
	bg_texture = new_tex
	if not bg: return
	if new_tex:
		var style = StyleBoxTexture.new()
		style.texture = new_tex
		style.region_rect = Rect2(Vector2(),bg.rect_size*texture_scale)
		bg.set("custom_styles/panel", style)
	else: set_color(bg_color)

func set_texture_scale(new_scale):
	texture_scale = new_scale
	_on_Content_resized()


func _on_Content_resized():
	if not bg: return
	if bg_texture:
		var style = bg.get("custom_styles/panel")
		if not style is StyleBoxTexture: set_texture(bg_texture)
		style = bg.get("custom_styles/panel")
		style.region_rect = Rect2(Vector2(),bg.rect_size*texture_scale)
		bg.set("custom_styles/panel", style)

