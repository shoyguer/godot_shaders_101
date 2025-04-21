@tool
extends MeshInstance3D


@export var shaders: Array[ShaderMaterial] = []
@export var shader: int = 0:
	set(value):
		value = clamp(value, 0, shaders.size() - 1)
		
		if value == shader: return
		
		shader = value
		
		if is_node_ready():
			_change_material_shader(shader)

var material: ShaderMaterial = null
var sphere: SphereMesh = null


func _ready() -> void:
	shaders = shaders
	shader = shader
	
	sphere = mesh
	material = get_active_material(0)


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("mouse_click"):
		if shader == 0:
			var random_color: Color = Color(randf(), randf(), randf(), 1.0)
		
			material.set_shader_parameter("color", random_color)


func _change_material_shader(index: int) -> void:
	sphere.surface_set_material(0, shaders[index])
