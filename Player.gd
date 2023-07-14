extends KinematicBody2D


const Run_Speed = 200 
const Jump_Force = -1210 
const Gravity = 1700 
var velocity = Vector2(0,0)
var jumping = false 

func _physics_process(delta):
	
	
	if Input.is_action_pressed("left"):
		velocity.x -= Run_Speed 
		$Sprite.flip_h = true 
		$Sprite.play("walk") 
	elif Input.is_action_pressed("right"):
		velocity.x += Run_Speed 
		$Sprite.flip_h = false 
		$Sprite.play("walk") 
	else:
		$Sprite.play("idle") 
		
	if Input.is_action_just_pressed("jump") and is_on_floor(): 
		velocity.y = Jump_Force
		jumping = true 
	
	velocity.y += delta * Gravity 
	
	if jumping  && not is_on_floor(): 
		jumping = true 
		$Sprite.play("air") 

	velocity = move_and_slide(velocity, Vector2(0,-1))
	velocity.x = lerp(velocity.x,0,0.3)

func _on_FallZone_body_entered(body): 
	get_tree().change_scene("res://level1.tscn")




