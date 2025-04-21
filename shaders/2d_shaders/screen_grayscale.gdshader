shader_type canvas_item;

uniform bool enabled = false;
uniform sampler2D screen_texture: hint_screen_texture, filter_nearest;

void fragment() {
	if (enabled) {
		vec4 screen_color = texture(screen_texture, SCREEN_UV);

		float average_color = (screen_color.r + screen_color.g + screen_color.b) / 3.0;
		vec4 final_color = vec4(vec3(average_color), screen_color.a);

		COLOR = final_color;
	}
}