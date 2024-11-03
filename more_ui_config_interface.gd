class_name MoreUIConfigInterface
extends Node

signal more_ui_setting_changed(setting_name, value)

func _ready():
	pass
	
func on_more_ui_setting_changed(setting_name:String, value):	
	emit_signal("more_ui_setting_changed", setting_name, value)
