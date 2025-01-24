@tool

extends TextureButton
class_name GMCSwitch

@export var tags: Array
var server

func _enter_tree():
    self.texture_normal = preload("./icons/TabBar.svg")
    self.stretch_mode = StretchMode.STRETCH_KEEP_ASPECT

func _ready():
    var parent = self.get_parent()
    while parent:
        if parent is MPFShowCreator:
            parent.register_switch(self)
            self.visible = false
            break
        elif parent is MPFMonitor:
            self.visible = true
            parent.register_switch(self)
            server = parent.server
            break
        parent = parent.get_parent()

func _gui_input(event):
    if not event is InputEventMouseButton:
        return
    # Ctrl+click to lock switch on
    var do_press = true if event.ctrl_pressed else event.pressed
    if server:
        server.send_switch(self.name, 1 if do_press else 0)
    self.set_switch_state(do_press)

func set_switch_state(do_press: bool) -> void:
    if do_press:
        self.modulate = Color(0.0, 1.0, 0.0)
    else:
        self.modulate = Color(1.0, 1.0, 1.0)
    self.button_pressed = do_press
