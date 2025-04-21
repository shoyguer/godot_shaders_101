shader_type canvas_item;

uniform sampler2D screen_texture: hint_screen_texture, filter_nearest;

uniform float distortion_multiplier: hint_range(-0.2, 0.2, 0.01) = 0.1;
uniform vec4 distortion_tint: source_color = vec4(0.315, 0.605, 0.847, 1.0);

uniform sampler2D noise_texture_0: repeat_enable;
uniform sampler2D noise_texture_1: repeat_enable;
uniform vec2 offset_0 = vec2(0.1);
uniform vec2 offset_1 = vec2(0.25);

void fragment() 
{
	vec4 noise_color_0 = texture(noise_texture_0, UV + offset_0 * TIME);
	vec4 noise_color_1 = texture(noise_texture_1, UV + offset_1 * TIME);
	
	float final_noise = noise_color_0.r * noise_color_1.r;
	float distortion = final_noise * distortion_multiplier;
	
	vec4 final_distorted_color = texture(screen_texture, SCREEN_UV + distortion);
	vec4 final_color = mix(final_distorted_color, distortion_tint, 0.5);
	
	COLOR = final_color;
}