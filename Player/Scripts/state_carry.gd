class_name State_Carry extends State


@export var move_speed : float = 100.0
@export var throw_audio : AudioStream


var walking : bool = false
var throwable : Throwable


@onready var idle: State_Idle = $"../Idle"
@onready var stun: State_Stun = $"../Stun"



func init() -> void:
	pass

# What happens when the player enters this state
func Enter() -> void: 
	player.update_animation( "carry" )
	walking = false
	pass
	
# What happens when the player exits this State
func Exit() -> void:
	# throw object
	if throwable:
		# set throw direction
		
		if player.direction == Vector2.ZERO:
			throwable.throw_direction = player.cardinal_direction
		else:
			throwable.throw_direction = player.direction
		
		
		# were we stunned? if so, drop item
		if state_machine.next_state == stun:
			throwable.throw_direction = throwable.throw_direction.rotated( PI )
			# drop throwable item
			throwable.drop()
		
		else:
			# else throw item
			player.audio.stream = throw_audio
			player.audio.play()
			throwable.throw()
			pass
		pass
	pass
	
func  Process(_delta: float ) -> State:
	if player.direction == Vector2.ZERO:
		walking = false
		player.update_animation( "carry" )
	elif player.set_direction() or walking == false:
		player.update_animation( "carry_walk" )
		walking = true
	
	player.velocity = player.direction * move_speed
	return null
	
func Physics ( _delta : float) -> State:
	return null
	
func HandleInput( _delta : InputEvent) -> State:
	if _delta.is_action_pressed( "attack" ) or _delta.is_action_pressed( "interact" ):
		return idle
	return null
