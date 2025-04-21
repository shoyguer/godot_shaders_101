shader_type spatial;

uniform sampler2D albedo_texture;
uniform vec2 offset = vec2(1.0, 0.0);
uniform float tiling_amount: hint_range(1.0, 20.0, 1) = 1.0;

void fragment() {
	vec2 final_uv = (UV * tiling_amount) + sin(offset.x * TIME);
	vec4 albedo_color = texture(albedo_texture, final_uv);
	
	ALBEDO = albedo_color.rgb;
	ALPHA = albedo_color.a;
}
