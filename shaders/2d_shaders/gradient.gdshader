shader_type canvas_item;

uniform bool enabled = false;
uniform sampler2D gradient_texture;

void fragment() {
	if (enabled) {
		vec4 original_color = texture(TEXTURE, UV);
		
		float average_color = (original_color.r + original_color.g + original_color.b) / 3.0;
		
		vec4 gradient_color = texture(gradient_texture, vec2(average_color));
		vec4 final_color = vec4(gradient_color.rgb, original_color.a);
		
		COLOR = final_color;
	}
}