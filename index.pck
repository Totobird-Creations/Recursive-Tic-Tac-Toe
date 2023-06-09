GDPC                  `	                                                                         T   res://.godot/exported/133200997/export-1b11a992ebcc6f262e4ee4a4db300a0d-theme.res   �^      _       CM�'a�[\n(��*"{    T   res://.godot/exported/133200997/export-3a652ff065d352a62141eb0abf3cdc21-cross.scn   �      �      �|���R:}?[ɅY    P   res://.godot/exported/133200997/export-4a8e30dceedd921be059f98eea3fd7b7-slot.scn�B            ������t��x���m    X   res://.godot/exported/133200997/export-9a82776f307cd88c44d6f920032c2aa2-indicator.scn   �      <      �Һ�=Z6��i���    T   res://.godot/exported/133200997/export-a83cf8f48b1cf9ea574e7f03773d7d43-board.scn          m      �?��-����x��Yc�    T   res://.godot/exported/133200997/export-adeae2ca0f8a484586b044d114df51bd-nought.scn  �      �      �;*�'�/�EVE$�'�    T   res://.godot/exported/133200997/export-efe1900e68061b561e091280e6ed3308-subboard.scnS      �      M�(�:���Z/    ,   res://.godot/global_script_class_cache.cfg                |�%7�_ ��z���    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex�&      �      �Ђ��g�/�6n��       res://.godot/uid_cache.bin  Pt      �       g��(�kE�A���\       res://board.gd  �      |      Ge���d�Ug��       res://board.tscn.remap  0f      b       ����`�z�D:�g�       res://game.gd   p%      `      Ҿ+`rRC��60��)       res://icon.svg  �g      Y      4i�z����T���(	�       res://icon.svg.import   `=      J      *�|���S�XO5}D�       res://player/cross.gdshader       �       �A��{: x�H"�p_Դ        res://player/cross.tscn.remap   �d      b       Vjڟz���=j�SS܉       res://player/indicator.gd   �      �       
��'a����T�u�C�U    $   res://player/indicator.tscn.remap   Pe      f       �f���y�^�v��m�_r       res://player/nought.gdshader�
      �       ���례��Y໗�        res://player/nought.tscn.remap  �e      c       ]G���ǿZi9�[<�       res://project.binaryPu      ;      ��$�.wW��p�+�_       res://slot.gd   �@      �      䎅�;V��[g��       res://slot.tscn.remap   �f      a       n��F��%�u:0kK�       res://subboard.gd   �J      B      [��7ťڵ0J���       res://subboard.tscn.remap   g      e       �⌰�O�`uK�>t�       res://theme.tres.remap  �g      b       _lE�x{"DC}�l���       res://winnable_element.gd    a      �      ��q���)�a�WJ��    ;+nK@X���>�list=Array[Dictionary]([{
"base": &"WinnableElement",
"class": &"SlotElement",
"icon": "",
"language": &"GDScript",
"path": "res://slot.gd"
}, {
"base": &"Control",
"class": &"WinnableElement",
"icon": "",
"language": &"GDScript",
"path": "res://winnable_element.gd"
}])
�shader_type canvas_item;


const float THICKNESS = 0.1;


void fragment() {
	COLOR.a = (abs(UV.x - UV.y) < THICKNESS) || (abs(1.0 - UV.x - UV.y) < THICKNESS) ? 1.0 : 0.0;
}
Y.�RSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name    shader    script 	   _bundled       Shader    res://player/cross.gdshader ��������      local://ShaderMaterial_urkql G         local://PackedScene_u3cs1 v         ShaderMaterial                          PackedScene          	         names "         cross 	   modulate    anchor_right    anchor_bottom    grow_horizontal    grow_vertical    AspectRatioContainer    icon 	   material    layout_mode 
   ColorRect    	   variants            �?       ?  �?     �?                      node_count             nodes        ��������       ����                                              
      ����         	                conn_count              conns               node_paths              editable_instances              version             RSRCz\K�[@tool
extends MarginContainer


@export
var player : Game.Player = Game.Player._Max:
	set(value):
		player = value;
		for i in self.get_child_count():
			self.get_child(i).visible = i == self.player;


func _ready() -> void:
	self.player = self.player;
�b�RSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://player/indicator.gd ��������   PackedScene    res://player/cross.tscn �G�Rxpb5   PackedScene    res://player/nought.tscn ���^v0iM      local://PackedScene_7fqyp z         PackedScene          	         names "         player_indicator    anchor_right    anchor_bottom    grow_horizontal    grow_vertical    mouse_filter    script    MarginContainer    cross    visible    layout_mode    nought    	   variants            �?                                               node_count             nodes     -   ��������       ����                                                     ���         	      
                        ���         	      
                      conn_count              conns               node_paths              editable_instances              version             RSRC��-.shader_type canvas_item;


const float THICKNESS = 0.1;


void fragment() {
	COLOR.a = (distance(UV, vec2(0.5)) <= 0.5) && (distance(UV, vec2(0.5)) >= 0.5 - THICKNESS) ? 1.0 : 0.0;
}
|���Tu�ůRSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name    shader    script 	   _bundled       Shader    res://player/nought.gdshader ��������      local://ShaderMaterial_urkql H         local://PackedScene_2jg6i w         ShaderMaterial                          PackedScene          	         names "         nought 	   modulate    anchor_right    anchor_bottom    grow_horizontal    grow_vertical    AspectRatioContainer    icon 	   material    layout_mode 
   ColorRect    	   variants                 ?  �?  �?     �?                      node_count             nodes        ��������       ����                                              
      ����         	                conn_count              conns               node_paths              editable_instances              version             RSRC��Da���extends Control


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
8��xRSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name    content_margin_left    content_margin_top    content_margin_right    content_margin_bottom    script 	   _bundled       Script    res://board.gd ��������   PackedScene    res://player/indicator.tscn 'l�j��]      local://StyleBoxEmpty_bpw15 �         local://PackedScene_2wh3k �         StyleBoxEmpty             PackedScene          	         names "   A      board    layout_mode    anchors_preset    mouse_filter    script    Control    menu    unique_name_in_owner    CanvasLayer    background    anchor_right    anchor_bottom    grow_horizontal    grow_vertical    color 
   ColorRect    center    CenterContainer    panel    MarginContainer    margin %   theme_override_constants/margin_left $   theme_override_constants/margin_top &   theme_override_constants/margin_right '   theme_override_constants/margin_bottom    vbox $   theme_override_constants/separation    VBoxContainer    grid &   theme_override_constants/h_separation    columns    GridContainer    recursions_label    text    Label    recursions_value 
   min_value 
   max_value    value    SpinBox 	   new_game    size_flags_horizontal    focus_mode    Button    close    custom_minimum_size    size_flags_vertical    theme_override_styles/normal    area    turn_indicator    hbox    anchor_left 
   alignment    HBoxContainer 
   separator    player_indicator    player    label    horizontal_alignment    menu_button    camera 	   Camera2D    pressed    hide    show    	   variants                                                     �?                  ?     �>  �>  �>  �?                         Recursions      @@         	   New Game 
      B   B                X          ����
     @@          ?   ?   ?  �?         
      C   C      Current Turn       Menu       node_count             nodes     V  ��������       ����                                              ����                       	   ����         
                                               ����         
                                         ����                       	   ����                                ����            	      	      	      	                    ����            
                    ����                                "       ����         !                 '   #   ����               $      %      &                 +   (   ����         )      *      !                 +   ,   ����   -            )      .      *      /      !                        ����                                         0   ����         )      .                        ����               )      .                          1   ����                          5   2   ����               3      
                        4                    6   ����   -                                         ����               4                 ���7         -            8                 "   9   ����         !      :                 +   ;   ����         )      *      !                  =   <   ����                   conn_count             conns               >   (                    >   ?                    >   ?                    >   @                    node_paths              editable_instances              version             RSRC疰extends Node


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
GST2   �   �      ����               � �        T  RIFFL  WEBPVP8L@  /�@<i�,���@-vM��vֲf�T���ĵmm�އ����33��)���ې����P�c(b��X��ɷ�TwO���E��#�Cr�8dh����+۶i[�~ƺ�mߛ�6�g���F�F۶����ضm��/�Im۶m۱�|��u�ыQ�$+Qu���E�_�sk{1z�I�mR%��n���3v!i~��eI�����nWnm��Vm�* �̫��]3/�,s��Zp��y�7��mB�m��������g#~_��m���Ղ[m۳�&�.c������] �IZ��,i��XQ�k�?�[�#I�$E�-��~�$�a��� ��pR��G�eѶm��zH�m۶�N۶>�m۶��.5�Tn�H�褶w��;5�_�����i�xNBgG�|-kv�  ����`�bd1RXN�rC(5\II ]���0���	��'���{��z�(�����w�1HJ�7�_8�+��{�#��74��*�1H�H�܀�O�����s�$�I&�S��3I�#�<)���S��WN��)�2�,$��`l��
5{��8��H#p@��+�)���<�0aɭ��(��42�����A~P�E$�;x�X�h�O��dK����b����J_����J�s�h�6��~AǺ���T�D��`�?��"~�'a6�� �~��^ˋ*X)�E]G�X�<qB�gL3������^D6G��b��>x�2��ܲN��ޒSp}7�W�XGrPįps�}�Yh��\"m��}�9-�
�PD�J��ޚQ�"R�o�#��UK׍/{{D9R�RѓOȱ�W�v��H�x�_R+��rtL5R���cр�OY��&#Ǉ,������OGc��mW��)��ï-r��H��UY�h��	6v��ꮉ8L9�,��F~(xqӏW)�����
'K�!�A����J17K �p5q�����)�ZY�5�R��	�D��S&�e���EjP��M�W�^�.�8iR\���.R�� ���K�H��_uƟ~
�M��k�&.fԕ*%���|�Tf��z2�k�Gv�iBl�r���I��ʎ�ml�	�j�~>z��q�����������[���i�f�HOj�><[sLzQ��խu!ǥT�o����O��}�\|�b�X	+`�(�o�L��X���H�(��q�1��V�@p���'�L0�����H��[N"�}M�[��*Cǥ����p��1� D�����غ�`�2Ȉ"�ƉJ���b��1�V��1R�� ��OڊPϨ�Ѹ�Bs 0��0m� �4�K��K��ٕ�|���)".�   v���.��W ���b�7}���x��S�\QQ �s�c��AVTL\����4ؒ��7<�{6�Fc�t�x ���`��` 0H|��_�|���k��z.!�C?�` .���W t�A*�_�z��_�\��*���9V0-G�FkxZ�S���q��R|Y*�S�'��DC���~��Z���ӢO��B��~�°f�`jCE��2N����w��x�Ӂ��r���a�ӣ%2}z����&�(�`~ĺ��
�j�8KE������%:.��J�A�~�A�Z�O�S���/GKQ
ar�j~�g��\�*0����6�И!B�	���+�%�����[��S�lC k?a� hD,�T�-��ʮ��zR�*]�� Vbh�<Q��:��n9B��{7�_u?R�oE�Q`X�иJ��%���T�uʅ�-�~�J�#�� ���4Z�Q��u�:5��ɩ�?�8�HB70vXD"e+D�X��OjgR�W���ֽ��_�tI��,���x	7"����c�v�>�IFD�<D�]�#K��B3)���}��R���HA��Dv=c�ш�C���we!�7�_����"k#�Y�D�m��ˋ��v��;�g��A��������H�/�ϐ2�� �o�}u�E����O�LFN*�;o��w"
�l�-" A�*V�)��O#Ø�7��(�@+R���>~��}$@�د'��V����@�w��H��ew0����W�>z|=0]=���'9��}�A$!E2K�7ȑE`���u���P��XND�v=5���{���������p�om%s��.���J�^Jj�Q�J9]<ǯ�,��W�mp�b�c(����a��ѱi�X�Ja0�1�\x�E��6�%�v�9��Alca��r$�VZQ��N� �R"��)� ��?���@<� �2��W��2�Ύ)�)�h'�PJ}�#��W�l{ɕM��V� <+"�� gڠ Wk�F��D:
�`ț`ņ�u��`�bt����.�fl�-?���e�6�hX���I�����=DDQC'�y��]��0a��`Snq�I�:|"�Vğ]0 ��-�;ad1a0�Ó��_d{�B��A�8��'�˵�v������ƾe�k�ѷK<%����!�(1'X� ��.2}I�k�w�n�it���$��&�#���4�GѨ��=�d\c0�ߡ�q�%b�L �Ju���_�nq �ze�`%�R��V#�dQt�� 
��� ����rс#���й�-��� ��{-�7Q0AШl�q�g�(¾�����{"=�T�F���&��йIl���ǑӘ���dxۇ`%�5��_�#�ipn�Ѳ�V8�TZ�nq(!ߚX�y�����EsP�����u^�����	Dc�0fOG�"��k4L��@z`���;�a����jW����Q�{<���ܤ{W��~E~@Cz�lr�X�dLvd)9�pd��]�BBS�mC�-�g�C17y�KV<���w$) @�' �@&Z{�+݁;�ռ �����+�U����ǉ_���@OYԹ,�`��r����Na"m�M�s��oL�������5�ƓJ'
z��}R�ZA?��l05���M�&�<���$+��+�
�|�CM�(��N>�H�q$G!�M�4���A~�u��I��q�	��E��Ѻ=r�8���7��`�'+>�LD�ѕ������{�L~�{�p��K6��;1p����u�X!���[w�dw��@R ��,=܃���A���0�|�J,���Ɍ�:L��*%b9��-�C�qJ�CO��� 2�_S�;*�12�xH詈u>��T
D��Фw�`���J� b�#��y��A��DS��r�� з<�*�ig@|�\�f�A�\$*:�6�2��нi Dz�"b���q�W7�� BC�qE��SAw`��M��g��1%l �`0h�a�W���o�it"����sE�{�XB��M9a��'�"b1F:�ݛ� �!M�z��D����J�P�q���Ǹ�	Ӈ�^�����H���h�HC��,��4t�����G�jp��岲�G��������|X.�)G�#3h�� �k�M�w�*�DOl�5�rfAω�8Vw�*2&z�WE�����`�:����A�Ņ��@�(b��7���"K�%%�h���QD0ƴ� X�!� ��R."��TJ� OF�- �u�&� މ�y�90;��hXۉL�����D:����,��8E|$8���A� "���N��m�(���������'%" }�Bs����?�[d`�1���	���7���JF�a"��䓌��F놆���m���:��bE4VF��`0$<Y<=~}K���|����"�=���24�HWzWTJQ��Jy��_�4�W��R8��8F�zۑG%+<�!
D��Sʨ�JA
�1�X+"<#�P� �F�qJ~�j�`��0��7�Sz���P;�K�Q��P'��Ȭ�B��q����>�R|M����
OV� ����^����☺�b"�(���`���������^<��1u�[�_Zތ�� �dD�>�ϩ�gNM���3G^�m�*���s��5�w#1p�d� ���s���O��3�3���>4S�s��׺�6��HG�ȳ��:���1E��� �d�[�N���#	b/T�������=S��q����N�ʻc��zkmG��~z�5�ñ�գ�%S�"3�<�d�}P=�\�yYO�n�
���#8��.ɀC� �"A��To�����8�WYCM���ٺ�F��3șX(r��3[�����C!������\���k��L/%�3��r���&��YN���N�-E)fo��צw)�T����q��
V��{]������>�nKI���ɑ]�N����ER)J1w���g���x���.#���"�H�sVpY�ihp^9iy�k �!��N�\*q�0ty�G-�|k�6-�0g� ��9��(�8��9��`t����㕽�2֜~ꂿ�E{ ��Ё�P��������x��*��b�Tۡ�g�,ӟ����V�����<�m�{��>�����L��$��~��Nq"��\�*�K�*��i�8	�B��tL  ��΅��0��?.�/�����x��G��M��3S��.:�t/�����}��x���F�S�~�jc���	.Z�+�I�Sɪ���{��x������'�C��;;p��G�c0�4Z�į"����ݷfc�y�>(�9�� P��;� ��r�]Ċ|��Rl��A�H����Z��;� ���q���"��3��b�{趣ً�}��\��9�3#O�ݥ}�C���Ŀ~���t����rX��N��`>�t� ԰f��\���oz�C�7|�{�sw�綋X���|f�^��F�C�G}�����С3��y�����1�����c�'�=����C��yWl{%,��k_��5Ƕ_�������]�φ)�G���m����9�zw<��I2:	�$�~7] ��X����JI��ɻ�P^��IB�V*g��w`�"���4.��7>U*3�~$M	��� ��T����s"J+�mԛ9��-J�NE��,����YQ�1��|�-����
A�n��5�S }���RY���<�  JDh�%p�8O�  o��Md"LQ3 � �����x ��dV�b��"���o�� �W(�9���#t�Sp>�׸B$�(�E�ؑ@�c0xD���9��.U�}ĻƱE��K� ��M?���8OT��[��[�3�.h��۠!$�	J�3D�=��|���;+��5��z��B����{�CF8"�=F}Cr��5M�+�7��G<�v�B�=�"ID=�p��3X�y]1@R�F4="�V�����K ���Ǘ�>�(�E�pZ����G�p.�ElQ���9=��NR?@��:a�pv��$IU�6@�s��q�V��0����G}����f���c�<�����b�W)� �������e�\�Or���fD��-I�:�p��j�5�H�q�>-��K�d�����+U6�5)w�BJ4�WwW��q���͔b+o�eX��3�<ɖX�w�6 ɇe_��^�lI�{�I�Vp?u���z����$I.>l�s�tI
Z�*��4gЯ��K.n�=Q�T3W�5L'�vzm�J��$tf���%��/��r���v�[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://y4a4gr18ilwt"
path="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://icon.svg"
dest_files=["res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"]

[params]

compress/mode=0
compress/high_quality=false
compress/lossy_quality=0.7
compress/hdr_compression=1
compress/normal_map=0
compress/channel_pack=0
mipmaps/generate=false
mipmaps/limit=-1
roughness/mode=0
roughness/src_normal=""
process/fix_alpha_border=true
process/premult_alpha=false
process/normal_map_invert_y=false
process/hdr_as_srgb=false
process/hdr_clamp_exposure=false
process/size_limit=0
detect_3d/compress_to=1
svg/scale=1.0
editor/scale_with_editor_scale=false
editor/convert_colors_with_editor_theme=false
�Sc�extends WinnableElement
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
1�o]�RSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name    content_margin_left    content_margin_top    content_margin_right    content_margin_bottom    script 	   bg_color    draw_center    skew    border_width_left    border_width_top    border_width_right    border_width_bottom    border_color    border_blend    corner_radius_top_left    corner_radius_top_right    corner_radius_bottom_right    corner_radius_bottom_left    corner_detail    expand_margin_left    expand_margin_top    expand_margin_right    expand_margin_bottom    shadow_color    shadow_size    shadow_offset    anti_aliasing    anti_aliasing_size 	   _bundled       Script    res://slot.gd ��������   PackedScene    res://player/indicator.tscn 'l�j��]      local://StyleBoxEmpty_fca2r �         local://StyleBoxFlat_nwbrb �         local://PackedScene_23tct #         StyleBoxEmpty             StyleBoxFlat            �?  �?  �?  �>         PackedScene          	         names "         slot    custom_minimum_size    offset_right    offset_bottom    mouse_filter    script    MarginContainer    player_indicator    unique_name_in_owner    layout_mode    button    theme_override_styles/normal    theme_override_styles/hover    theme_override_styles/pressed    theme_override_styles/disabled    theme_override_styles/focus    Button    _won    won 	   _pressed    pressed    	   variants       
      B   B      B                                                        node_count             nodes     1   ��������       ����                                              ���               	                     
   ����         	                                              conn_count             conns                                                               node_paths              editable_instances              version             RSRC�Xextends WinnableElement;


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

func set_coordinate_chain(chain : PackedInt32Array, enabled : bool) -> void:
	%lines.modulate.a = 0.5 + 0.5 * float(int(enabled));
	var first : int = -1;
	if (len(chain) > 0):
		first = chain[0];
		chain.remove_at(0);
	for i in range(len(self.pieces)):
		var piece := self.pieces[i] as WinnableElement;
		piece.set_coordinate_chain(chain.duplicate(), enabled && (piece is SlotElement || first == i));

func enable_all() -> void:
	%lines.modulate.a = 1.0;
	for piece in self.pieces:
		piece.enable_all();

func is_won(chain : PackedInt32Array) -> bool:
	if (self.has_winner()):
		return true;
	if (len(chain) == 0):
		return self.has_winner();
	var piece := self.pieces[chain[0]] as WinnableElement;
	chain.remove_at(0);
	return piece.is_won(chain);


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
�ޜ��S�ˋI
�RSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://subboard.gd ��������   PackedScene    res://player/indicator.tscn 'l�j��]      local://PackedScene_6tehs A         PackedScene          	         names "   -   	   subboard    offset_right    offset_bottom    mouse_filter %   theme_override_constants/margin_left $   theme_override_constants/margin_top &   theme_override_constants/margin_right '   theme_override_constants/margin_bottom    script    MarginContainer    grid    unique_name_in_owner    layout_mode &   theme_override_constants/h_separation &   theme_override_constants/v_separation    columns    GridContainer    tl    size_flags_horizontal    size_flags_vertical    tc    tr    cl    cc    cr    bl    bc    br    lines    Control    left    anchors_preset    anchor_left    anchor_right    anchor_bottom    offset_left 
   ColorRect    top    anchor_top    offset_top    right    bottom    player_indicator    _won    won    	   variants             C                                                 ����   �~�>     �?     @�   ��*?     @@               node_count             nodes     e  ��������	       ����                                                                    
   ����                                                  	      ����                                                              	      ����                                                              	      ����                                                              	      ����                                                              	      ����                                                              	      ����                                                              	      ����                                                              	      ����                                                              	      ����                                                                     ����                                $      ����                   	   !   	   "   
   #                       $   %   ����               &   	   !   
   "   	   '                       $   (   ����                      !      "   
                          $   )   ����               &      !   
   "                              ���*                               conn_count             conns                ,   +                    node_paths              editable_instances              version             RSRCK�����Z-�MRSRC                     Theme            ��������                                                  resource_local_to_scene    resource_name    content_margin_left    content_margin_top    content_margin_right    content_margin_bottom    script    default_base_scale    default_font    default_font_size    Button/styles/focus    LineEdit/styles/focus           local://StyleBoxEmpty_frqvq �         local://StyleBoxEmpty_v61jm          local://Theme_cesrg %         StyleBoxEmpty             StyleBoxEmpty             Theme    
                               RSRCextends Control;
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

func set_coordinate_chain(_chain : PackedInt32Array, _enabled : bool) -> void:
	pass;

func enable_all() -> void:
	pass;

func is_won(_chain : PackedInt32Array) -> bool:
	return self.has_winner();
p[remap]

path="res://.godot/exported/133200997/export-3a652ff065d352a62141eb0abf3cdc21-cross.scn"
T$�\�$���x��[remap]

path="res://.godot/exported/133200997/export-9a82776f307cd88c44d6f920032c2aa2-indicator.scn"
A8�z�DO�[remap]

path="res://.godot/exported/133200997/export-adeae2ca0f8a484586b044d114df51bd-nought.scn"
0��m�']gK[remap]

path="res://.godot/exported/133200997/export-a83cf8f48b1cf9ea574e7f03773d7d43-board.scn"
��<Ad�\�Y�C�g[remap]

path="res://.godot/exported/133200997/export-4a8e30dceedd921be059f98eea3fd7b7-slot.scn"
X��ތ���/����[remap]

path="res://.godot/exported/133200997/export-efe1900e68061b561e091280e6ed3308-subboard.scn"
�w��Z�G&���[remap]

path="res://.godot/exported/133200997/export-1b11a992ebcc6f262e4ee4a4db300a0d-theme.res"
|��x��W�Ɨi<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!-- Created with Inkscape (http://www.inkscape.org/) -->

<svg
   width="64mm"
   height="64mm"
   viewBox="0 0 64 64"
   version="1.1"
   id="svg5"
   inkscape:version="1.2.2 (b0a8486541, 2022-12-01)"
   sodipodi:docname="icon.svg"
   xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
   xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
   xmlns="http://www.w3.org/2000/svg"
   xmlns:svg="http://www.w3.org/2000/svg">
  <sodipodi:namedview
     id="namedview7"
     pagecolor="#505050"
     bordercolor="#eeeeee"
     borderopacity="1"
     inkscape:showpageshadow="0"
     inkscape:pageopacity="0"
     inkscape:pagecheckerboard="0"
     inkscape:deskcolor="#505050"
     inkscape:document-units="mm"
     showgrid="true"
     inkscape:zoom="3.3638608"
     inkscape:cx="97.209729"
     inkscape:cy="117.12732"
     inkscape:window-width="2524"
     inkscape:window-height="1379"
     inkscape:window-x="15"
     inkscape:window-y="40"
     inkscape:window-maximized="1"
     inkscape:current-layer="layer1">
    <inkscape:grid
       type="xygrid"
       id="grid139"
       empspacing="4"
       spacingx="1.0583333"
       spacingy="1.0583333" />
  </sodipodi:namedview>
  <defs
     id="defs2" />
  <g
     inkscape:label="Diagram"
     inkscape:groupmode="layer"
     id="layer1">
    <g
       inkscape:groupmode="layer"
       id="layer2"
       inkscape:label="Icons">
      <rect
         style="display:inline;fill:#ff007f;fill-opacity:1;stroke:none;stroke-width:7.78289;stroke-linecap:round;stroke-linejoin:round"
         id="rect340"
         width="7.782886"
         height="35.621677"
         x="-3.891443"
         y="44.302593"
         transform="rotate(-45)"
         inkscape:label="nought_br" />
      <rect
         style="display:inline;fill:#ff007f;fill-opacity:1;stroke:none;stroke-width:7.78289;stroke-linecap:round;stroke-linejoin:round"
         id="rect3330"
         width="7.7828865"
         height="37.118393"
         x="41.009834"
         y="-35.022999"
         transform="rotate(45)"
         inkscape:label="nought_tr" />
      <circle
         style="fill:none;fill-opacity:1;stroke:#007fff;stroke-width:7.862;stroke-linecap:round;stroke-linejoin:round;stroke-dasharray:none;stroke-opacity:1"
         id="path1784"
         cx="31.749996"
         cy="31.750002"
         r="23.585716"
         inkscape:label="circle" />
      <rect
         style="display:inline;fill:#ff007f;fill-opacity:1;stroke:none;stroke-width:7.78289;stroke-linecap:round;stroke-linejoin:round"
         id="rect1730"
         width="7.7828827"
         height="34.42432"
         x="41.009834"
         y="0.598683"
         transform="rotate(45)"
         inkscape:label="nought_bl" />
      <rect
         style="display:inline;fill:#ff007f;fill-opacity:1;stroke:none;stroke-width:7.78289;stroke-linecap:round;stroke-linejoin:round"
         id="rect3332"
         width="8.2796659"
         height="36.621613"
         x="-3.891443"
         y="9.8782825"
         transform="rotate(-45)"
         inkscape:label="nought_tl" />
    </g>
  </g>
</svg>
���?�   �G�Rxpb5   res://player/cross.tscn'l�j��]   res://player/indicator.tscn���^v0iM   res://player/nought.tscn7����   res://board.tscn{n]�>�5   res://icon.svg҇�=��I   res://slot.tscn���-�v   res://subboard.tscn��l*މ�;   res://theme.tres�(ECFG	      application/config/name          Recursive Tic Tac Toe      application/run/main_scene         res://board.tscn   application/config/features(   "         4.0    GL Compatibility       application/config/icon         res://icon.svg     autoload/Game         *res://game.gd     gui/theme/custom         res://theme.tres#   rendering/renderer/rendering_method         gl_compatibility*   rendering/renderer/rendering_method.mobile         gl_compatibility2   rendering/environment/defaults/default_clear_color                    �?8я��