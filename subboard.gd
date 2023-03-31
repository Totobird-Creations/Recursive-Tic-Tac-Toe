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


func check_win(_player : Game.Player) -> void:
	for method in WIN_METHODS:
		

func _won(_player : Game.Player) -> void:
	for piece in self.pieces:
		self.pieces.queue_free();
