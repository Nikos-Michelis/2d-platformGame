extends KinematicBody2D


var velocity = Vector2()
export var direction = -1
export var detects_cliffs = true

func _ready():
	if direction == 1:
	   $Body.flip_h  = true
	   $Wings.flip_h = true
	$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction
	$floor_checker.enabled = detects_cliffs
	 
	
func _physics_process(delta):
	
	if is_on_wall() || not $floor_checker.is_colliding() && detects_cliffs && is_on_floor():
		direction = direction * -1
		$Body.flip_h  = not $Body.flip_h
		$Wings.flip_h = not $Wings.flip_h
		$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction
		
	
	velocity.y +=50
	
	velocity.x = 200 * direction

	velocity = move_and_slide(velocity,Vector2.UP)
