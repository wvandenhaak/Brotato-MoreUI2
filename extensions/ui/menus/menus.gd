extends "res://ui/menus/menus.gd"

var _menu_more_ui_options

func _ready():
	_menu_more_ui_options = preload("res://mods-unpacked/Mooncake-MoreUI2/ui/menus/more_ui_menu.tscn").instance()
	_menu_more_ui_options.hide()
	add_child(_menu_more_ui_options)
	
	var _error_back_mods_options = _menu_more_ui_options.connect("back_button_pressed", self, "on_more_ui_back_button_pressed")
	var _error_mods_choose_options = _menu_choose_options.connect("more_ui_button_pressed", self, "on_more_ui_button_pressed")

func on_more_ui_back_button_pressed()->void :
	switch(_menu_more_ui_options, _menu_choose_options)

func on_more_ui_button_pressed()->void :
	switch(_menu_choose_options, _menu_more_ui_options)
