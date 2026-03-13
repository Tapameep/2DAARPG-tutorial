extends PointLight2D



func _ready() -> void:
	flicker()


func flicker() -> void:
	energy = randf() * 0.05 + 0.8
	scale = Vector2( 1, 1 ) * energy
	await get_tree().create_timer( 0.15 ).timeout
	flicker()
	pass
