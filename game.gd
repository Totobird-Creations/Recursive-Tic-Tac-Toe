extends Node


enum Player {
	Cross,
	Nought,
	_Max
};
var current_player : Player = Player.Cross;


func next_player() -> void:
	self.current_player = ((self.current_player + 1) % Player._Max) as Player;
