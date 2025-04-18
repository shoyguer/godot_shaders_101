shader_type canvas_item;

void vertex() {
	// Top vertices
	if (VERTEX.y < 0.0) {
		VERTEX += vec2(20.0, 0.0);
	}

	// Bottom Vertices
	if (VERTEX.y > 0.0) {
		VERTEX += vec2(0.0, -15.0);
	}

	// Only the first vertex (top left)
	if (VERTEX.y < 0.0 && VERTEX.x < 0.0) {
		VERTEX += vec2(0.0, -75.0);
	}
}
