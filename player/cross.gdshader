shader_type canvas_item;


const float THICKNESS = 0.1;


void fragment() {
	COLOR.a = (abs(UV.x - UV.y) < THICKNESS) || (abs(1.0 - UV.x - UV.y) < THICKNESS) ? 1.0 : 0.0;
}
