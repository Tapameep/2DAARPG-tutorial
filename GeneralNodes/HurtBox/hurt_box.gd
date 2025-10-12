class_name HurtBox extends Area2D

@export var damage : int = 1

func _ready():
	area_entered.connect( _area_enetered )
	pass
	
func _area_enetered ( a : Area2D ) -> void:
	if a is HitBox:
		a.TakeDamage( self )
	pass
