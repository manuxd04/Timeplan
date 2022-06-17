extends Panel
class_name GridPanel

export var is_empty = true
export var is_source = false
var is_dragged = false
var cached_drag_data

func get_drag_data(_pos):
	if is_empty: return
	var preview = self.duplicate() as Panel
	preview.rect_position = -_pos
	var container = Control.new()
	container.rect_rotation = 5
	container.add_child(preview)
	
	set_drag_preview(container)
	var children = get_children()
	if is_source:
		children.empty()
		for c in get_children():
			children.append(c.duplicate())
	
	var data = {
		type = "GridPanel",
		style = get("custom_styles/panel"),
		content = children,
		source = self
	}
	if is_source: return data
	for c in get_children():
		remove_child(c)
	set("custom_styles/panel", StyleBoxEmpty.new())
	cached_drag_data = data
	is_empty = true
	is_dragged = true
	return data


func can_drop_data(_pos, data):
	if not is_empty: return
	if not "type" in data: return
	return data.type == "GridPanel"


func drop_data(_pos, data):
	set("custom_styles/panel", data.style)
	for c in data.content:
		add_child(c)
	is_empty = false
	data.source.cached_drag_data = null



func _input(event):
	if is_dragged\
	and event is InputEventMouseButton\
	and event.button_index == 1\
	and event.pressed == false:
		yield(get_tree(), "idle_frame")
		if cached_drag_data:
			is_dragged = false
			drop_data(Vector2(), cached_drag_data)



