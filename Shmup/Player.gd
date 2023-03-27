extends KinematicBody2D

var movespeed = 500
var bullet_speed = 1500
var bullet = preload("res://Bullet.tscn")

func _ready():
	if Globals.highscore > 0:
		get_node("../CanvasLayer/Score").text = str(Globals.highscore).pad_zeros(4)
	
func _physics_process(delta):
	var motion = Vector2()
	if Input.is_action_pressed("up"):
		motion.y -= 1
	if Input.is_action_pressed("down"):
		motion.y += 1
	if Input.is_action_pressed("right"):
		motion.x += 1
	if Input.is_action_pressed("left"):
		motion.x -= 1
	motion = motion.normalized()
	motion = move_and_slide(motion * movespeed)
	look_at(get_global_mouse_position())
	if Input.is_action_pressed("LMB") or Input.is_action_pressed("Space"):
		fire()
	
	
func fire():
	var bullet_instance = bullet.instance()
	bullet_instance.position = get_global_position()
	bullet_instance.rotation_degrees = rotation_degrees
	bullet_instance.apply_impulse(Vector2(),Vector2(bullet_speed,2).rotated(rotation))
	get_tree().get_root().call_deferred("add_child",bullet_instance)
	yield(get_tree().create_timer(0.15), "timeout")
	bullet_instance.free()
	
	
	
	
func kill():
	queue_free()
	get_tree().reload_current_scene()

func _on_Area2D_body_entered(body):
	if "Enemy" in body.name:
		Globals.highscore = 0
		queue_free()
		get_tree().change_scene("res://TitleScreen.tscn")
	if "BigEnemy" in body.name:
		Globals.highscore = 0
		queue_free()
		get_tree().change_scene("res://TitleScreen.tscn")
	if "Goal" in body.name:
		kill()

