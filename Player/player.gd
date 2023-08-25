extends CharacterBody2D


const speed = 100
var current_dir


func _ready():
	$AnimatedSprite2D.play("front_idle")

func _physics_process(delta):
	player_movement(delta)

	
func player_movement(delta):
	
	if Input.is_action_pressed("ui_right"):
		current_dir = "right"
		play_anim(true)
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		current_dir = "left"
		play_anim(true)
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_down"):
		current_dir = "down"
		play_anim(true)
		velocity.x = 0
		velocity.y = speed
	elif Input.is_action_pressed("ui_up"):
		current_dir = "up"
		play_anim(true)
		velocity.x = 0
		velocity.y = -speed
	else:
		play_anim(false)
		velocity.x = 0
		velocity.y = 0
	
	move_and_slide()
	

func play_anim(is_moving: bool):
	var dir = current_dir
	var anim = $AnimatedSprite2D
	
	if(dir == "right"):
		anim.flip_h = false
		if(is_moving):
			anim.play("side_walk")
		elif(!is_moving):
			anim.play("side_idle")
			
	if(dir == "left"):
		anim.flip_h = true
		if(is_moving):
			anim.play("side_walk")
		elif(!is_moving):
			anim.play("side_idle")
			
	if(dir == "down"):
		if(is_moving):
			anim.play("front_walk")
		elif(!is_moving):
			anim.play("front_idle")
	
	if(dir == "up"):
		if(is_moving):
			anim.play("back_walk")
		elif(!is_moving):
			anim.play("back_idle")
	
