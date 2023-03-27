extends Node

var tiless
var map

var x_lower = -18
var x_upper = 81
var y_lower = -8
var y_upper = 41
var highscore = 0

var enemy = preload("res://Enemy.tscn")
var bigEnemy = preload("res://BigEnemy.tscn")

var start_pos = Vector2(300, 300)
var offset = 137
var gen = RandomNumberGenerator.new()

func _ready():
	randomizeTiles()


func randomizeTiles():
	randomize()
	map = get_node("Wall")
	
	var n_tiles = 75
	for j in range(y_lower, y_upper):
		for k in range(x_lower, x_upper):
			tiless = randi() % n_tiles
			map.set_cell(k,j,tiless)
		  
	pass


func _on_EnemyTimer_timeout():
	var rot = gen.randf_range(0, 2*PI)
	var instance = enemy.instance()
	add_child(instance)
	instance.global_position = start_pos
	instance.rotate(rot)
	instance.global_position += instance.transform.y * offset


func _on_BigEnemyTimer_timeout():
	var rot = gen.randf_range(0, 2*PI)
	var instance = bigEnemy.instance()
	add_child(instance)
	instance.global_position = start_pos
	instance.rotate(rot)
	instance.global_position += instance.transform.y * offset

