class_name KeyButton
extends Button


func _ready() -> void:
	text = name
	
	shortcut = Shortcut.new()
	var input_event = InputEventKey.new()
	input_event.physical_keycode = OS.find_keycode_from_string(name)
	shortcut.events.append(input_event)
