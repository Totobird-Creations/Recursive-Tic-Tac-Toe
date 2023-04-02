extends Control


const SUBBOARD : PackedScene = preload("res://subboard.tscn");


func new_game(recursion : int) -> void:
	Game.current_player = Game.Player.Cross;
	var subboard := SUBBOARD.instantiate() as WinnableElement;
	subboard.recurse(recursion);
	%board.add_child(subboard);


func _ready() -> void:
	Game.set_coordinate_chain.connect(self.set_coordinate_chain);
	self.new_game(2);


func set_coordinate_chain(chain : PackedInt32Array) -> void:
	var subboard := %board.get_child(0) as WinnableElement;
	if (! subboard.set_coordinate_chain(chain, true)):
		subboard.enable_all();
