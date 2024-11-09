extends VBoxContainer

const MORE_UI_SAVE_FILE = "user://save_file.save"
var more_ui_save_data  = {}

signal back_button_pressed
signal more_ui_setting_changed(setting_name, value)

onready var back_button = $BackButton
onready var check_whats_new = $WhatsNewModeEnabled
onready var check_wave_increase = $WaveIncreaseEnabled
onready var check_right_side = $RightSide
onready var check_trees_enabled = $ShowTrees
onready var check_revamped_icons = $UseRevampedIcons

# Called when the node enters the scene tree for the first time.
func _ready():
	var MoreUIConfigInterface = get_node("/root/ModLoader/Mooncake-MoreUI2/MoreUIConfigInterface")	
	
	connect("more_ui_setting_changed", MoreUIConfigInterface, "on_more_ui_setting_changed")

func init():
	$BackButton.grab_focus()
	
	_more_ui_load_data()
	if (ModLoaderMod.is_mod_loaded('monoSDE-RevampedIcons')):
		check_revamped_icons.visible = true
	else:
		check_revamped_icons.visible = false
	if not "whats_new_mode_enabled" in more_ui_save_data:
		more_ui_save_data.whats_new_mode_enabled = true
	check_whats_new.pressed = more_ui_save_data.whats_new_mode_enabled
	check_whats_new.connect("toggled", self, "moreui_signal_setting_changed", ["whats_new_mode_enabled"])
	if not "wave_increase_enabled" in more_ui_save_data:
		more_ui_save_data.wave_increase_enabled = false
	check_wave_increase.pressed = more_ui_save_data.wave_increase_enabled
	check_wave_increase.connect("toggled", self, "moreui_signal_setting_changed", ["wave_increase_enabled"])
	if not "right_side_enabled" in more_ui_save_data:
		more_ui_save_data.right_side_enabled = false
	check_right_side.pressed = more_ui_save_data.right_side_enabled
	check_right_side.connect("toggled", self, "moreui_signal_setting_changed", ["right_side_enabled"])
	if not "trees_enabled" in more_ui_save_data:
		more_ui_save_data.trees_enabled = false
	check_trees_enabled.pressed = more_ui_save_data.trees_enabled
	check_trees_enabled.connect("toggled", self, "moreui_signal_setting_changed", ["trees_enabled"])
	if not "revamped_icons" in more_ui_save_data:
		more_ui_save_data.revamped_icons = false
	check_revamped_icons.pressed = more_ui_save_data.revamped_icons
	check_revamped_icons.connect("toggled", self, "moreui_signal_setting_changed", ["revamped_icons"])

func _more_ui_save_data():
	var file = File.new()
	file.open(MORE_UI_SAVE_FILE, File.WRITE)
	file.store_var(more_ui_save_data)
	file.close()


func _more_ui_load_data():
	var file = File.new()
	if not file.file_exists(MORE_UI_SAVE_FILE):
		more_ui_save_data = {
			"whats_new_mode_enabled": true,
			"wave_increase_enabled": false,
			"right_side_enabled": false,
			"trees_enabled": false,
			"revamped_icons": false,
		}
		_more_ui_save_data()
	file.open(MORE_UI_SAVE_FILE, File.READ)
	more_ui_save_data = file.get_var()
	file.close()

func moreui_signal_setting_changed(value, setting_name:String):
	more_ui_save_data[setting_name] = value
	_more_ui_save_data()
	emit_signal("more_ui_setting_changed", setting_name, value)


func _on_BackButton_pressed():
	emit_signal("back_button_pressed")
