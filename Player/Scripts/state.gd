class_name State extends Node

# Stores reference to the player that this State belongs to
static var player: Player
static var state_machine: PlayerStateMachine

func init() -> void:
	pass

# What happens when the player enters this state
func Enter() -> void: 
	pass
	
# What happens when the player exits this State
func Exit() -> void:
	pass
	
func  Process(_delta: float ) -> State:
	return null
	
func Physics ( _delta : float) -> State:
	return null
	
func HandleInput( _delta : InputEvent) -> State:
	return null
