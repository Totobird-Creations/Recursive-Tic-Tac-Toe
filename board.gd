extends Control


const SUBBOARD : PackedScene = preload("res://subboard.tscn");


func new_game(recursion : int) -> void:
	var subboard := SUBBOARD.instantiate() as WinnableElement;
	subboard.recurse(recursion);
	%board.add_child(subboard);


func _ready() -> void:
	self.new_game(3);
