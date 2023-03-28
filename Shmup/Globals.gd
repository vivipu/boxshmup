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
	SilentWolf.configure({
		"api_key": "PLzGRUpqeg7Wt0dtVQw2D6GMxvnrZpSW12clGt7R",
		"game_id": "boxshmup",
		"game_version": "1.0.2",
		 "log_level": 1
	})
	SilentWolf.configure_scores({
		"open_scene_on_close": "res://TitleScreen.tscn"
	})

func increment_score():
	highscore += 1
	get_node("/root/World/CanvasLayer/Score").text = str(highscore).pad_zeros(4)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
