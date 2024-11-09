extends Node

const MOREUI_2_DIR = "Mooncake-MoreUI2/"
const MOREUI_2_LOG = "Mooncake-MoreUI2"

var dir = ""

func _init(modLoader = ModLoaderMod):
	dir = ModLoaderMod.get_unpacked_dir() + MOREUI_2_DIR

	# Add interface
	_add_child_class()
	
	# Add Extensions
	ModLoaderMod.install_script_extension(dir + "extensions/ui/menus/pages/menu_choose_options.gd")
	ModLoaderMod.install_script_extension(dir + "extensions/ui/menus/menus.gd")	
	ModLoaderMod.install_script_extension(dir + "extensions/ui/hud/more_ui.gd")

	# Add localizations
	ModLoaderMod.add_translation(dir + "translations/moreui_translations.en.translation")
	ModLoaderMod.add_translation(dir + "translations/moreui_translations.fr.translation")
	ModLoaderMod.add_translation(dir + "translations/moreui_translations.de.translation")

func _add_child_class():
	var MoreUIConfigInterface = load(dir + "more_ui_config_interface.gd").new()
	MoreUIConfigInterface.name = "MoreUIConfigInterface"
	add_child(MoreUIConfigInterface)
