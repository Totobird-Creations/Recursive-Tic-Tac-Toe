extends WinnableElement



func _won(player : Game.Player) -> void:
	%button.disabled = true;
	%player_indicator.player = player;


func _pressed() -> void:
	if (! self.has_winner()):
		self.won_by(Game.current_player);
		Game.next_player();
