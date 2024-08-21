extends Node

var score:int = 0
@onready var score_label = $DuitCollected

func add_point() -> void:
	score +=1
	score_label.text = "Berapa byk telo kmk dpt? " + str(score) + " biji"
