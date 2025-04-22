shader_type spatial;

void vertex() 
{
	// Controls the position
	//VERTEX += vec3(sin(TIME * 2.0) * 0.5, cos(TIME * 2.0) * 0.5, 0.0);
	
	// Controls the size
	//VERTEX *= (sin(TIME * 2.0) + 1.5) * 0.5;
	
	// Shape follow a sine wave
	VERTEX.x += sin(TIME * 10.0 + VERTEX.y * 10.0) * 0.02;
}