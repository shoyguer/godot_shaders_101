shader_type spatial;


uniform vec3 water_tint: source_color;
uniform float metallic: hint_range(0.0, 1.0, 0.01) = 0.0;
uniform float roughness: hint_range(0.0, 1.0, 0.01) = 0.02;

group_uniforms normal_maps;
uniform sampler2D normal_map_texture_0: repeat_enable, filter_linear;
uniform sampler2D normal_map_texture_1: repeat_enable, filter_linear;
uniform vec2 offset_0 = vec2(0.02);
uniform vec2 offset_1 = vec2(-0.02);
uniform float time_multiplier_0: hint_range(0.1, 2.0, 0.01) = 1.0;
uniform float time_multiplier_1: hint_range(0.1, 2.0, 0.01) = 1.0;
group_uniforms;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 normal_map_offset_0 = vec2(UV + (offset_0 * (TIME * time_multiplier_0)));
	vec2 normal_map_offset_1 = vec2(UV + (offset_1 * (TIME * time_multiplier_1)));
	vec4 normal_map_color_0 = texture(normal_map_texture_0, normal_map_offset_0);
	vec4 normal_map_color_1 = texture(normal_map_texture_1, normal_map_offset_1);
	vec4 final_normal_map_color = mix(normal_map_color_0, normal_map_color_1, 0.5);
	
	ALBEDO = water_tint;
	NORMAL_MAP = final_normal_map_color.rgb;
	METALLIC = metallic;
	ROUGHNESS = roughness;
}
