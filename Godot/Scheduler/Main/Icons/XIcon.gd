extends Viewport


const CAP_MODE = Line2D.LINE_CAP_ROUND

var expansion = 0.8

export var line_width = 10


func _offset(length):
	return length - length * expansion


func create_line(points: PoolVector2Array):
	var line = Line2D.new()
	line.points = points
	line.width = line_width
	
	line.begin_cap_mode = CAP_MODE
	line.end_cap_mode = CAP_MODE
	
	line.round_precision = 10
	line.default_color = Color.white
	
	return line



func _ready():
	line_width = size.x / 100 * line_width
	
	var tabs = get_node("../Margin/Content/Tabs")
	
	yield(VisualServer, "frame_post_draw")
	
	size = Vector2(1,1) * tabs.rect_size.y
	
	transparent_bg = true
	
	var b = create_line([
		_offset(Vector2(size.x, size.y)),
		Vector2(size.x * expansion, size.y * expansion)
	])
	add_child(b)
	add_child(create_line([
		Vector2(size.x * expansion, _offset(size.y)),
		Vector2(_offset(size.x), size.y * expansion)
	]))
	













