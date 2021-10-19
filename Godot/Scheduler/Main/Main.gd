extends Control

export(Array, NodePath) onready var separators
export(Array, NodePath) onready var margins
#export(NodePath) onready var node_name = get_node(node_name) as node_type
#export(NodePath) onready var node_name = get_node(node_name) as node_type
#export(NodePath) onready var node_name = get_node(node_name) as node_type




#func _ready():
#	var file = File.new()
#	file.open("test.json", File.WRITE)
#	file.store_string(to_json(StyleConverter.style2dict(get_node("Margin/Content/Body/Margin/Splitter/Table").get("custom_styles/panel"))))
#	file.close()



func _ready():
	theme = ThemeHandler.theme
	
	for path in separators:
		var separator = get_node(path)
		separator.set(
			"custom_constants/separation",
			separator.get("custom_constants/separation") * ThemeHandler.ui_scale
		)

	for path in margins:
		for pos in ["top","bottom","left","right"]:
			var margin = get_node(path)
			margin.add_constant_override(
				"margin_"+pos,
				margin.get("custom_constants/margin_"+pos) * ThemeHandler.ui_scale
			)
