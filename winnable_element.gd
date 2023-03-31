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
