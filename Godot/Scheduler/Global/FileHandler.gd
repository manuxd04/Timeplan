extends Node



func save(_canvas):
	pass


# ---------- Test Code ---------- #

func save_stuff():
	var f = File.new()
	f.open("test2", File.WRITE)
	var canvas = Canvas.new()
	print(canvas.elements[0].headers)
	f.store_var(canvas, true)
	f.close()

func load_stuff():
	var f = File.new()
	f.open("test2", File.READ)
	
	var canvas = f.get_var(true)
	print(canvas.elements[0].headers)
	
	f.close()

func save_json():
	var f = File.new()
	f.open("test.json", File.WRITE)
	f.store_string("5")
	f.close()


func replace():
	var f = File.new()
	f.open("large-file.json", File.READ)
	var a = parse_json(f.get_as_text())
	f.close()
	print("LOADED")
	f = File.new()
	f.open("test", File.WRITE)
	for b in a:
		f.store_var(b)
	f.close()
	print("SAVED")

# ---------- Test Code ---------- #


func _ready():
	pass
