extends Control

export(Array, NodePath) onready var separators
export(Array, NodePath) onready var margins
export(NodePath) onready var splitter = get_node(splitter) as HSplitContainer
export(NodePath) onready var tabs = get_node(tabs) as Tabs
#export(NodePath) onready var node_name = get_node(node_name) as node_type

#func _ready():
#	var file = File.new()
#	file.open("test.json", File.WRITE)
#	file.store_string(to_json())
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
	
	
#	splitter.grabber.get_data().expand_x2_hq2x()
	ThemeHandler.connect("reload", self, "reload")
	connect("resized", self, "resized")
	resized()


func resized():
	yield(VisualServer, "frame_post_draw")
	
	splitter.set("custom_icons/grabber", ThemeHandler.grab_grabber(
		splitter.get("custom_constants/separation"),
		splitter.rect_size.y
	))



func reload():
	ThemeHandler.disconnect("reload", self, "reload")
	get_tree().reload_current_scene()


