class_name PersistentDataHandler extends Node

signal data_loaded
var value : bool = false

func _ready() -> void:
	get_value()
	print( value )
	pass
	
func set_value() -> void:
	SaveManager.add_persistent_value( _get_name() )
	pass
	
func get_value() -> void:
	value = SaveManager.check_persistent_value( _get_name() )
	data_loaded.emit()
	pass

func _get_name() -> String: #private function, only use within the node
	return get_tree().current_scene.scene_file_path + "/" + get_parent().name + "/" + name # resource path, ie the level
