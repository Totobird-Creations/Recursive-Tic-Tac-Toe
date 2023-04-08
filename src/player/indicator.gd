@tool
extends MarginContainer


@export
var player : Game.Player = Game.Player._Max:
	set(value):
		player = value;
		for i in self.get_child_count():
			self.get_child(i).visible = i == self.player;


func _ready() -> void:
	self.player = self.player;
