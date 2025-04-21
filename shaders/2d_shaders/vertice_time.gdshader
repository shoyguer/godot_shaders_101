shader_type canvas_item;

void vertex() {
	float speed = 2.55;

	if (VERTEX.y < 0.0 && VERTEX.x > 0.0) {
		VERTEX += vec2(sin(TIME * speed) * 25.0, cos(TIME * speed) * 25.0);
	}
}