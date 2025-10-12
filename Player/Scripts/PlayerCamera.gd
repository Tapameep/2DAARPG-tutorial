class_name PlayerCamera extends Camera2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	LevelManager.TileMapBoundsChanged.connect( UpdateLimits )
	UpdateLimits( LevelManager.current_tilemap_bounds ) # force update the first time it runs the script

	pass # Replace with function body.



func UpdateLimits( bounds : Array [Vector2] ) -> void:
	if bounds == []: return # if things load before this update. exit
	limit_left = int( bounds[0].x )
	limit_top = int( bounds[0].y )
	limit_right = int( bounds[1].x )
	limit_bottom = int( bounds[1].y )
	
	pass
