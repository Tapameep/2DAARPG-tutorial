class_name HeartGUI extends Control

@onready var sprite: Sprite2D = $Sprite2D

var value : int = 2 :
	set( _value ): # set function on variable executes whenever the variable value is modified
		value = _value
		update_sprite()


func update_sprite() -> void:
	sprite.frame = value
