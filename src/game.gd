extends Node


signal set_coordinate_chain(coordinate : PackedInt32Array);


enum Player {
	Cross,
	Nought,
	_Max
};
var current_player : Player = Player.Cross;


func next_player(chain : PackedInt32Array) -> void:
	self.current_player = ((self.current_player + 1) % Player._Max) as Player;
	chain.remove_at(0);
	self.set_coordinate_chain.emit(chain);
