extends WinnableElement;


const SUBBOARD : PackedScene = preload("res://subboard.tscn");
const SLOT     : PackedScene = preload("res://slot.tscn");


const WIN_METHODS : Array = [
	[0, 1, 2],
	[3, 4, 5],
	[6, 7, 8],
	[0, 3, 6],
	[1, 4, 7],
	[2, 5, 8],
	[0, 4, 8],
	[2, 4, 6]
];


var pieces : Array = [];


func recurse(count : int) -> void:
	if (count > 0):
		var scene : PackedScene;
		if (count > 1):
			scene = SUBBOARD;
		else:
			scene = SLOT;
		self.pieces.clear();
		for child in %grid.get_children():
			var instance := scene.instantiate() as WinnableElement;
			instance.recurse(count - 1);
			instance.won.connect(self.check_win);
			self.pieces.append(instance);
			child.add_child(instance);

func get_coordinate(node : WinnableElement) -> int:
	return self.pieces.find(node);

func set_coordinate_chain(chain : PackedInt32Array, enabled : bool) -> bool:
	%lines.modulate.a = 0.5 + 0.5 * float(int(enabled));
	var first : int = -1;
	if (len(chain) > 0):
		first = chain[0];
		chain.remove_at(0);
	var passed := false;
	for i in range(len(self.pieces)):
		var piece := self.pieces[i] as WinnableElement;
		passed = piece.set_coordinate_chain(chain.duplicate(), enabled && (piece is SlotElement || first == i)) || passed;
	return passed;

func enable_all() -> void:
	for piece in self.pieces:
		piece.enable_all();


func check_win(player : Game.Player) -> void:
	for method in WIN_METHODS:
		var winners := (method as Array).map(func(i : int): return self.pieces[i]._winner);
		var success := true;
		for winner in winners:
			if (winner == -1 || winner != winners[0]):
				success = false;
				break;
		if (success):
			self.won_by(player);
			break;

func _won(player : Game.Player) -> void:
	(func():
		for piece in self.pieces:
			piece.queue_free();
		%grid.visible  = false;
		%lines.visible = false;
		%player_indicator.player = player;
		self.pieces.clear();
	).call_deferred();
