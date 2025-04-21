shader_type canvas_item;

void fragment() {
	// Red
	vec4 color1 = vec4(0.85, 0.1, 0.12, 1.0);
	// Green
	vec4 color2 = vec4(0.05, 0.82, 0.16, 1.0);

	float mix_percentage = (sin(TIME) + 1.0) * 0.5;

	vec4 output_color = mix(color1, color2, mix_percentage);

	COLOR = output_color;
}
