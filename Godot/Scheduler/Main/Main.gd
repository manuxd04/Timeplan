extends Control

export(Array, NodePath) onready var separators
export(NodePath) onready var body_margin = get_node(body_margin) as MarginContainer
#export(NodePath) onready var node_name = get_node(node_name) as node_type
#export(NodePath) onready var node_name = get_node(node_name) as node_type
#export(NodePath) onready var node_name = get_node(node_name) as node_type




#func _ready():
#	var file = File.new()
#	file.open("test.json", File.WRITE)
#	file.store_string(to_json(StyleConverter.style2dict(get_node("Margin/Content/Body/Margin/Splitter/Table").get("custom_styles/panel"))))
#	file.close()



func _ready():
	for path in separators:
		var separator = get_node(path)
		separator.set(
			"custom_constants/separation",
			separator.get("custom_constants/separation") * ThemeHandler.ui_scale
		)

	var margin_value = 10 * ThemeHandler.ui_scale
	$Margin.add_constant_override("margin_top", margin_value)
	$Margin.add_constant_override("margin_left", margin_value)
	$Margin.add_constant_override("margin_bottom", margin_value)
	$Margin.add_constant_override("margin_right", margin_value)

	body_margin.add_constant_override("margin_top", margin_value)
	body_margin.add_constant_override("margin_left", margin_value)
	body_margin.add_constant_override("margin_bottom", margin_value)
	body_margin.add_constant_override("margin_right", margin_value)
