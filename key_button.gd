class_name KeyButton
extends Button

signal toggled_name(toggled_on: bool, _name: String)


func _ready() -> void:
	add_to_group("Buttons")
	
	text = name
	
	shortcut = Shortcut.new()
	var input_event = InputEventKey.new()
	input_event.physical_keycode = OS.find_keycode_from_string(name)
	shortcut.events.append(input_event)

	toggled.connect(_on_toggled)


func _on_toggled(toggled_on: bool) -> void:
	toggled_name.emit(toggled_on, name)
