shader_type canvas_item;




void fragment() {
	vec2 pos = UV - vec2(0.5);
	if (length(vec2(pos.x*2.0, pos.y)) * 2.0 < 0.5) {
		COLOR.a = 1.0;
	} else {
		COLOR.a = 0.0;
	}
}