extends TextureRect
class_name GMCPlayfield

@export var animation_player: AnimationPlayer
@export var monitor_size: Vector2
var lights = {}
var switches = {}

func _enter_tree() -> void:
	self.expand_mode = ExpandMode.EXPAND_IGNORE_SIZE
	# Prevent GMC from blocking inputs to allow switch presses
	MPF.ignore_input()
