class_name HitBox extends Area2D

signal damaged( hurt_box : HurtBox )

func TakeDamage( hurt_box : HurtBox) -> void:
	damaged.emit(hurt_box)
