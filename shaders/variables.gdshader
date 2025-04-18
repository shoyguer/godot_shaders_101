shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
	int my_int = 5;
	float my_float = 2.5;
	bool my_bool = false;

	vec2 my_vec2 = vec2(6.0, 5.0);
	vec4 my_vector = vec4(1.0, 2.0, my_vec2);
	// All numbers here are now 1.0. Cool!
	vec3 my_vec3 = vec3(1.0);

	// They will all work!!!!!
	my_vector.x; my_vector.r; my_vector.s;
	my_vector.y; my_vector.g; my_vector.t;
	my_vector.z; my_vector.b; my_vector.p;
	my_vector.w; my_vector.a; my_vector.q;

	// Wait, an integer vec? As expected, nice!
	ivec2 integer_vec = ivec2(1, 3);
	// WAIT!! AN BOOLEAN VEC?????????????????????? W H A T ! ? ? !
	bvec4 boolean_vec = bvec4(true, false, false, true);

	// Swizzling
	vec3 v3 = my_vector.xyz;
	v3.xy;
	my_vec2.xy;

	// Swizzling assignment
	v3.xy = my_vector.yx;

	vec4 my_new_vec = my_vec2.xyxy;
	// Same thing as above!!
	my_new_vec = vec4(my_vec2.x, my_vec2.y, my_vec2.x, my_vec2.y);
}

void fragment() {
	// Called for every pixel the material is visible on.
}