extends WinnableElement
class_name SlotElement;


func set_coordinate_chain(_chain : PackedInt32Array, enabled : bool) -> void:
	%button.disabled = ! enabled || self.has_winner();

func enable_all() -> void:
	%button.disabled = self.has_winner();


func _won(player : Game.Player) -> void:
	%button.disabled = true;
	%player_indicator.player = player;


func _pressed() -> void:
	if (! self.has_winner()):
		self.won_by(Game.current_player);
		Game.next_player(self.get_coordinate_chain());
