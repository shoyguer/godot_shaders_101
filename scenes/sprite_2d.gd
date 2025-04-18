@tool
extends Sprite2D


@export_range(0.0, 1.0) var max_color_mix: float = 0.5:
	set(value):
		max_color_mix = value
		
		if is_node_ready():
			material.set_shader_parameter("max_color_mix", max_color_mix)


func _ready() -> void:
	max_color_mix = max_color_mix
