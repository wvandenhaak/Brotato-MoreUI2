extends "res://ui/menus/pages/menu_choose_options.gd"

signal more_ui_button_pressed

var _more_ui_button

func _ready():
	
	_more_ui_button = $Buttons / BackButton.duplicate()
	_more_ui_button.connect("pressed", self, "_on_MoreUIButton_pressed")
	_more_ui_button.disconnect("pressed", self, "_on_BackButton_pressed")
	_more_ui_button.text = "More UI2"
	var option_buttons = $Buttons.get_children()
	var before_to_last_index = $Buttons.get_child_count() - 2
	var before_to_last = option_buttons[before_to_last_index]
	$Buttons.add_child_below_node(before_to_last, _more_ui_button)

func _on_MoreUIButton_pressed()->void :
	emit_signal("more_ui_button_pressed")

