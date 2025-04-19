shader_type canvas_item;

uniform vec2 tiling = vec2(1.0, 1.0);
uniform vec2 offset = vec2(0.0);
uniform bool animate_x = false;
uniform bool animate_y = false;

void vertex() 
{
	vec2 final_offset = offset;
	// Animates in the X axis
	if (animate_x == true)
	{
		final_offset.x += TIME * offset.x;
	}
	// Animates in the Y axis
	if (animate_y == true)
	{
		final_offset.y += TIME * offset.y;
	}
	
	UV = UV * tiling + final_offset;
}