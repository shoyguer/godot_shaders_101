shader_type canvas_item;

void fragment() {
	vec4 original_color = texture(TEXTURE, UV);
	
	float average_color = (original_color.r + original_color.g + original_color.b) / 3.0;
	vec4 final_color = vec4(vec3(average_color), original_color.a);
	
	COLOR = final_color;
}