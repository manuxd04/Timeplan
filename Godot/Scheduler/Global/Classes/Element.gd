class_name Element

var id = 0
var type = ""
var position = Vector2()
var size = Vector2()
var anchor = {
	top = 0,
	bottom = 0,
	left = 0,
	right = 0
}

var canvas


func _init(_canvas, _type):
	canvas = _canvas
	id = canvas.get_unique_id()
	type = _type
