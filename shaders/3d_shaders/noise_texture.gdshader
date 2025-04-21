shader_type spatial;

uniform sampler2D albedo_texture;
uniform vec2 offset = vec2(1.0, 0.0);
uniform float tiling_amount: hint_range(1.0, 20.0, 1) = 1.0;

void fragment() {
	vec2 final_uv = (UV * tiling_amount);
	final_uv += (sin(final_uv.x * 50.0 + TIME * 10.0) * 0.025) ;
	vec4 albedo_color = texture(albedo_texture, final_uv);
	
	ALBEDO = albedo_color.rgb;
	ALPHA = 1.0;
}
