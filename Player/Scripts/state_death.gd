class_name State_Death extends State


@export var exhaust_audio : AudioStream


@onready var audio : AudioStreamPlayer2D = $"../../Audio/AudioStreamPlayer2D"



func init() -> void:
	pass

# What happens when the player enters this state
func Enter() -> void: 
	player.animation_player.play( "death" )
	audio.stream = exhaust_audio
	audio.play()
	
	# Trigger Game Over UI
	PlayerHud.show_game_over_screen()
	AudioManager.play_music( null )
	pass
	
# What happens when the player exits this State
func Exit() -> void:
	pass
	
func  Process(_delta: float ) -> State:
	player.velocity = Vector2.ZERO
	return null
	
func Physics ( _delta : float) -> State:
	return null
	
func HandleInput( _delta : InputEvent) -> State:
	return null
