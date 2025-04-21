shader_type canvas_item;

/**
* The color that will overlay over the original texture.
* Default color is [b]WHITE[/b].
*/
uniform vec3 color_overlay: source_color = vec3(1.0);
/**
* The opacity for the color overlay. The lower the value, the less the overlay color will appear.
* [code]0.0[/code] - The color overlay will not show up.
* [code]0.5[/code] - The color overlay will be half transparent.
* [code]1.0[/code] - The original texture will not show up. Only the color overlay.
*/
uniform float color_opacity: hint_range(0.0, 1.0, 0.01) = 0.0;
/**
* Wether or not the effect is enabled.
*/
uniform bool enabled = true;

void fragment() {
	if (enabled) {
		// Gets the original color for this pixel
		vec4 original_color = texture(TEXTURE, UV);
		// Mixes the original color with the flash color at the flash opacity
		vec4 final_color = mix(original_color, vec4(color_overlay, original_color.a), color_opacity);
		// If the original texture has transparency, the final color will inherit the transparency.
		final_color.a = original_color.a;

		COLOR = final_color;
	}
}