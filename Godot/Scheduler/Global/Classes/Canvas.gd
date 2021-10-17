class_name Canvas

const Table = preload("res://Global/Classes/Elements/Table.gd")
const Text = preload("res://Global/Classes/Elements/Text.gd")

var path = ""
var size = Vector2()
var style = StyleBoxFlat.new()

var cards = []
var elements = []



# ---------- Misc ---------- #

var _id_counter = 0
func get_unique_id():
	_id_counter += 1
	return _id_counter - 1

# ---------- Misc ---------- #





# ---------- Main ---------- #

func _init():
	elements.append(Table.new(self))
	style.bg_color = ThemeHandler.secondary


# ---------- Main ---------- #


