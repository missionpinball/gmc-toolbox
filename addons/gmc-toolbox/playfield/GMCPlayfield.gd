extends TextureRect
class_name GMCPlayfield

@export var animation_player: AnimationPlayer
@export var monitor_size: Vector2
var lights = {}
var switches = {}

func _enter_tree() -> void:
	var parent = self.get_parent()
	while parent:
		if parent is MPFMonitor:
			self.expand_mode = ExpandMode.EXPAND_FIT_WIDTH_PROPORTIONAL
			break
		if parent is MPFShowCreator or parent is MPFShowPreview:
			self.expand_mode = ExpandMode.EXPAND_KEEP_SIZE
			break
		parent = parent.get_parent()
	# Prevent GMC from blocking inputs to allow switch presses
	# (if GMC is installed as an autoload in this project)
	if get_tree().get_root().get_node("MPF"):
		MPF.ignore_input()
	#Add all the GMC Lights to the lights dict
	var lights_node = get_node("lights")
	if lights_node:
		for child in lights_node.get_children():
			if child is GMCLight:
				self.lights[child.name] = child
