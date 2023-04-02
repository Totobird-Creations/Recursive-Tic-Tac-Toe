extends Control;
class_name WinnableElement;


signal won(player : Game.Player);
@warning_ignore("int_as_enum_without_match")
var _winner : Game.Player = -1 as Game.Player;


func has_winner() -> bool:
	return self._winner >= 0 && self._winner < Game.Player._Max;

func won_by(player : Game.Player) -> void:
	self._winner = player;
	self.won.emit(player);


func recurse(_count : int) -> void:
	pass;


func get_coordinate(_node : WinnableElement) -> int:
	return -1;

func get_coordinate_chain() -> PackedInt32Array:
	var chain := [];
	var node : Node = self;
	while (node != null):
		if (node is WinnableElement):
			chain.append(node);
		node = node.get_parent();
	chain.reverse();
	return range(len(chain) - 1).map(func(index : int): return chain[index].get_coordinate(chain[index + 1]));

func set_coordinate_chain(_chain : PackedInt32Array, _enabled : bool) -> bool:
	return false;

func enable_all() -> void:
	pass;
