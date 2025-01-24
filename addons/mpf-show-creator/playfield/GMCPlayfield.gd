extends TextureRect
class_name GMCPlayfield

@export var animation_player: AnimationPlayer
@export var monitor_size: Vector2
var lights = {}
var switches = {}

func _enter_tree() -> void:
	self.expand_mode = ExpandMode.EXPAND_IGNORE_SIZE

func _ready() -> void:
	for required_child in ["lights", "switches"]:
		if not self.get_node_or_null(required_child):
			var l = Control.new()
			l.name = required_child
			l.set_anchors_preset(LayoutPreset.PRESET_FULL_RECT)
			self.add_child(l)
