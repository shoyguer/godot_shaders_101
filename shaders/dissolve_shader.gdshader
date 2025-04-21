shader_type canvas_item;

/**
* Noise texture that will determine the visuals of how the dissolve will happen.
* You must use a NoiseTexture2D.
* I recommend you keep this texture the same size/resolution as the original sprite size.
*/
uniform sampler2D noise_texture: filter_nearest;
/**
* The gradient color used in the dissolve_color_thickness. This NEEDS to be a Gradient
* If you want to simulate fire, make a GradientTexture2D. Or a texture equivalent.
* I recommend you keep this texture the same size/resolution as the original sprite size.
*/
uniform sampler2D dissolve_gradient: filter_nearest;
/**
* The thickness of the gradient color. If you set this to 0, there will be no "fire" simulation.
*/
uniform float dissolve_color_thickness: hint_range(0.0, 0.5, 0.01) = 0.25;
/**
* The dissolve color will begin as fully transparent, until it begins to appear.
* This variable represents how much progress it needs so the dissolve color is fully opaque.
*/
uniform float min_progress_opacity: hint_range(0.0, 0.25, 0.01) = 0.2;
/**
* At which point in the progress of the dissolve_color it will begin to fade away (become transparent).
*/
uniform float fade_progress_begin: hint_range(0.75, 0.9, 0.01) = 0.85;
/**
* Dissolve progress.
*/
uniform float progress: hint_range(0.0, 1.0, 0.01) = 0.0;

// Runs for every fragment / pixel
void fragment() {
	// Original color for this texture.
	vec4 original_color = texture(TEXTURE, UV);
	vec4 final_color = original_color;
	// Noise color for the pixel / fragment
	vec4 noise = texture(noise_texture, UV);

	// In case it will use color thickness.
	if (dissolve_color_thickness > 0.0)
	{
		if (original_color.a > 0.0)
		{
			// The max progress at which the progress color will appear.
			float max_dissolve_color = 1.0 - dissolve_color_thickness;
			// The progress of the dissolve color. When the progress is 1.0, it will start becoming transparent.
			float dissolve_color_progress = (progress - noise.r) + (dissolve_color_thickness * progress * 2.0);
			// Calculates the progress (from 0.0 to 1.0) according to the color thickness dissolve color thickness.
			dissolve_color_progress = dissolve_color_progress * (max_dissolve_color / dissolve_color_thickness);

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

			if (dissolve_color_progress >= fade_progress_begin)
			{
				// Will smoothly disappear, fading-out from the last color of the gradient.
				float disappear_progress = dissolve_color_progress - fade_progress_begin * (1.0 / 1.0 - fade_progress_begin);
				final_color.a = mix(1.0, 0.0, disappear_progress);
			}
		}

	}
	// In case it will only dissolve, without any color thickness.
	else
	{
		if (progress >= noise.r)
		{
			final_color.a = 0.0;
		}
	}

	COLOR = final_color;

}