class_name Main
extends Control


var state_selected: State
@export var timeline: Array[State]
var selected_char: String


func _ready() -> void:
	state_selected = timeline[0]
	connect_buttons()


func connect_buttons():
	for child in get_tree().get_nodes_in_group("Buttons"):
		if child.has_signal("toggled_name"):
			child.toggled_name.connect(_on_toggled_name)


func _on_toggled_name(toggled_on: bool, _name: String):
	if _name.is_valid_int():
		state_selected = timeline[_name.to_int()-1]
		%KeyAudio.stop()
		
		for button in get_tree().get_nodes_in_group("Buttons"):
			if button.name == selected_char and button.button_pressed:
				button.button_pressed = false
				break
		selected_char = ""
	else:
		if toggled_on:
			%KeyAudio.stop()
			selected_char = _name
			%KeyAudio.stream = state_selected.sounds[_name]
			%KeyAudio.play()
		else:
			if selected_char == _name:
				%KeyAudio.stop()
		
