extends Control

func _ready():
	get_tree().paused = false
	for button in $Menu/CenterRow/Buttons.get_children():
		button.connect("pressed", self, "_on_Button_pressed", [button.scene_to_load]) 

func _on_Button_pressed(scene_to_load):
	get_tree().change_scene(scene_to_load)

func _on_root_resize():
	Control.rect_size =  get_tree().root.size;



func _on_Fullscreen_pressed():
	get_tree().change_scene("res://addons/silent_wolf/Scores/Leaderboard.tscn")
