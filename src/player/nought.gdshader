shader_type canvas_item;


const float THICKNESS = 0.1;


void fragment() {
	COLOR.a = (distance(UV, vec2(0.5)) <= 0.5) && (distance(UV, vec2(0.5)) >= 0.5 - THICKNESS) ? 1.0 : 0.0;
}
