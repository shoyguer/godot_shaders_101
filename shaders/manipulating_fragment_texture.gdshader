shader_type canvas_item;

group_uniforms GeneralVariables;
/**
* Mix type of the colors with the texture.
*/
uniform int type : hint_enum("Mix", "Multiply");
/**
* Speed multiplier used to transition from one color to the other.
*/
uniform float time_speed : hint_range(0.0, 10.0, 0.01) = 1.0;
group_uniforms;

group_uniforms Colors;
/**
* First color.
*/
uniform vec4 color_0 : source_color;
/**
* Second color.
*/
uniform vec4 color_1 : source_color;
/**
* How opaque can the colors get in relation to the texture. Only works for type 'Mix'.
*/
uniform float max_color_mix : hint_range(0.0, 1.0, 0.01) = 0.5;
group_uniforms;

// Runs for every pixel
void fragment() {
	// Get mix percentage according to sin
	float mix_percentage = (sin(TIME * time_speed) + 1.0) * 0.5;
	// Set the output color, combining both colors
	vec4 output_color = mix(color_0, color_1, mix_percentage);
	// Gets original texture
	vec4 original_texture = texture(TEXTURE, UV);

	vec4 final_output = vec4(0.0);

	// Mix
	if (type == 0) {
		// Combines the original texture and the colors
		final_output = mix(original_texture, output_color, max_color_mix);

		// Sets the opacity of the pixel the same as from the original texture
		final_output.a = original_texture.a;
	}

	// Multiply
	else if (type == 1) {
		// Multiplies color and original texture
		final_output = output_color * original_texture;
	}

	COLOR = final_output;
}

