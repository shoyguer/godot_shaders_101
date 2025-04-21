shader_type canvas_item;

int my_function(bool a){
	return 5;
}

int subtract(int a, int b){
	int result = a - b;
	return result;
}

void vertex() {
	int my_number;
	my_number = my_function(true);
	
	int result = subtract(5, 4);
}

void fragment() {
	// Called for every pixel the material is visible on.
}