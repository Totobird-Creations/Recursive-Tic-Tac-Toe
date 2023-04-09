extends Control


const SUBBOARD : PackedScene = preload("res://subboard.tscn");

@export
var zoom_step : float = 1.1;
@export
var zoom_min : int = -25;
@export
var zoom_max : int = 12;


func new_game() -> void:
	for child in %board.get_children():
		child.queue_free();
	Game.current_player = Game.Player.Cross;
	var subboard := SUBBOARD.instantiate() as WinnableElement;
	subboard.recurse(%recursions_value.value);
	%board.custom_minimum_size = Vector2.ZERO;
	%board.size                = Vector2.ZERO;
	%board.add_child(subboard);
	%turn_indicator.player = Game.current_player;


func _ready() -> void:
	Game.set_coordinate_chain.connect(self.set_coordinate_chain);

func _process(_delta : float) -> void:
	%board.custom_minimum_size = %board.size;


func set_coordinate_chain(chain : PackedInt32Array) -> void:
	var subboard := %board.get_child(0) as WinnableElement;
	if (subboard.is_won(chain.duplicate())):
		subboard.enable_all();
	else:
		subboard.set_coordinate_chain(chain, true);
	%turn_indicator.player = Game.current_player;


var panning : bool  = false;
var zoom    : int   = 1:
	set(value):
		zoom          = clamp(value, self.zoom_min, self.zoom_max);
		var camera   := pow(self.zoom_step, float(self.zoom));
		$camera.zoom  = Vector2(camera, camera);
func _input(event : InputEvent) -> void:
	if (event is InputEventMouseButton):
		if (event.button_index == MOUSE_BUTTON_RIGHT || event.button_index == MOUSE_BUTTON_MIDDLE):
			self.panning = event.pressed && ! %menu.visible;
	if (! %menu.visible):
		if (event is InputEventMouseButton):
			if (event.button_index == MOUSE_BUTTON_WHEEL_UP):
				self.zoom += 1;
			elif (event.button_index == MOUSE_BUTTON_WHEEL_DOWN):
				self.zoom -= 1;
		elif (event is InputEventMouseMotion):
			if (self.panning):
				var target := (%camera.position - event.relative / %camera.zoom) as Vector2;
				var limits := (%board.size / 2.0) as Vector2;
				%camera.position = Vector2(clamp(target.x, -limits.x, limits.x), clamp(target.y, -limits.y, limits.y));
