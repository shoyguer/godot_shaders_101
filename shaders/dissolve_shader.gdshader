shader_type canvas_item;

uniform sampler2D noise_texture: filter_nearest;
uniform sampler2D dissolve_gradient: filter_nearest;
uniform float dissolve_threshold: hint_range(0.0, 0.5, 0.01) = 0.3;
uniform float min_progress_opacity: hint_range(0.0, 0.2, 0.01) = 0.1;
uniform float dissolve_progress: hint_range(0.0, 1.5, 0.01) = 0.0;

void fragment() {
	vec4 original_color = texture(TEXTURE, UV);
	
	if (original_color.a > 0.0)
	{
		vec4 noise = texture(noise_texture, UV);
		// Min value to start dissolving (becoming transparent)
		float min_disolve = dissolve_threshold * 2.0;
		// The progress of the dissolve color. If the press is 1.0, it will start becoming transparent.
		float dissolve_color_progress = (dissolve_progress + dissolve_threshold) - (noise.r + dissolve_threshold);
		dissolve_color_progress = dissolve_color_progress * (1.0 / dissolve_threshold);
		
		vec4 final_color = original_color;
		
		if (dissolve_color_progress > 0.0)
		{
			// Calculates the dissolve opacity
			float dissolve_color_opacity = (1.0 / min_progress_opacity) * dissolve_color_progress;
			dissolve_color_opacity = clamp(dissolve_color_opacity, 0, 1);
			// Calculates the dissolve color (according to gradient)
			vec4 dissolve_final_color = texture(dissolve_gradient, vec2(dissolve_color_progress));
			//dissolve_final_color.a = dissolve_color_opacity;
			final_color = mix(original_color, dissolve_final_color, dissolve_color_opacity);
		}
		
		if (dissolve_color_progress >= 1.0)
		{
			final_color.a = 0.0;
		}
		
		COLOR = final_color;
	}
	
}