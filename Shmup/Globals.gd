extends Node

var highscore = 0
var tiless
var map

var x_lower = -18
var x_upper = 81
var y_lower = -8
var y_upper = 41


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

	

func increment_score():
	highscore += 1
	get_node("/root/World/CanvasLayer/Score").text = str(highscore).pad_zeros(4)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
