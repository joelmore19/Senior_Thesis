extends Area2D

@export var speed = 200
var screen_size


func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$PlayerAnimation.play()
	else:
		$PlayerAnimation.stop()
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)	
	
	if velocity.x != 0:
		$PlayerAnimation.animation = "side_walk"
		$PlayerAnimation.flip_v = false
		$PlayerAnimation.flip_h = velocity.x < 0
	
	elif velocity.y != 0:
		$PlayerAnimation.animation = "side_walk"
		$PlayerAnimation.flip_h = velocity.y > 0
