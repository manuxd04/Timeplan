extends Node

func style2dict(style: StyleBox, scale: Vector2 = Vector2(1,1)):
	if style is StyleBoxFlat:
		return {
			"type": "flat",
			"color": style.bg_color,
			"draw_center": style.draw_center,
			"border": {
				"color": style.border_color,
				"blend": style.border_blend,
				"width": {
					"top": style.border_width_top,
					"bottom": style.border_width_bottom,
					"left": style.border_width_left,
					"right": style.border_width_right
				}
			},
			"corner": {
				"detail": style.corner_detail,
				"radius": {
					"top_left": style.corner_radius_top_left,
					"top_right": style.corner_radius_top_right,
					"bottom_left": style.corner_radius_bottom_left,
					"bottom_right": style.corner_radius_bottom_right
				}
			},
			"expand_margin": {
				"top": style.expand_margin_top,
				"bottom": style.expand_margin_bottom,
				"left": style.expand_margin_left,
				"right": style.expand_margin_right
			},
			"shadow": {
				"color": style.shadow_color,
				"size": style.shadow_size,
				"offset": [style.shadow_offset.x, style.shadow_offset.y]
			},
			"anti_aliasing": style.anti_aliasing_size if style.anti_aliasing else 0
		}
	
	elif style is StyleBoxLine:
		return {
			"type": "line",
			"vertical": style.vertical,
			"thickness": style.thickness,
			"color": style.color,
			"expand_margin": {
				"begin": style.grow_begin,
				"end": style.grow_end
			}
		}
	
	elif style is StyleBoxTexture:
		var data = style.texture.get_data().data
		return {
			"type": "texture",
			"data": Array(data["data"]),
			"format": data["format"],
			"height": data["height"],
			"width": data["width"],
			"mipmaps": data["mipmaps"],
			"scale": [scale.x, scale.y]
		}
	
	return null




func dict2style(dict):
	if dict["type"] == "flat":
		pass
	
	if dict["type"] == "line":
		pass
	
	if dict["type"] == "texture":
		pass







