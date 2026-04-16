class_name State_Lift extends State


@export var lift_audio : AudioStream

@onready var carry: Node = $"../Carry"

var start_anim_late : bool = false


# What happens when the player enters this state
func Enter() -> void: 
	player.update_animation( "lift" )
	if start_anim_late == true:
		player.animation_player.seek( 0.2 )
	player.animation_player.animation_finished.connect( state_complete )
	player.audio.stream = lift_audio
	player.audio.play()
	pass
	
# What happens when the player exits this State
func Exit() -> void:
	start_anim_late = false
	pass
	
func  Process(_delta: float ) -> State:
	player.velocity = Vector2.ZERO	
	return null
	
func Physics ( _delta : float) -> State:
	return null
	
func HandleInput( _delta : InputEvent) -> State:
	return null


func state_complete( _a : String ) -> void:
	player.animation_player.animation_finished.disconnect( state_complete )
	state_machine.ChangeState( carry )
	pass
