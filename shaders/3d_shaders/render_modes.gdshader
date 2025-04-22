shader_type spatial;
render_mode diffuse_toon, specular_toon;

uniform sampler2D albedo;
uniform float metallic: hint_range(0.0, 1.0, 0.01) = 0.5;
uniform float roughtness: hint_range(0.0, 1.0, 0.01) = 0.5;

void fragment() {
	vec4 albedo_color = texture(albedo, UV);
	
	METALLIC = metallic;
	ROUGHNESS = roughtness;
	
	ALBEDO = albedo_color.rgb;
	ALPHA = 1.0;
}
