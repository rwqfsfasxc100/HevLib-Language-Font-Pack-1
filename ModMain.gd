extends Node

# Set mod priority if you want it to load before/after other mods
# Mods are loaded from lowest to highest priority, default is 0
const MOD_PRIORITY = 0
# Name of the mod, used for writing to the logs
const MOD_NAME = "HevLib Language Font Pack 1"
const MOD_VERSION_MAJOR = 1
const MOD_VERSION_MINOR = 1
const MOD_VERSION_BUGFIX = 0
const MOD_VERSION_METADATA = ""

# Path of the mod folder, automatically generated on runtime
var modPath:String = get_script().resource_path.get_base_dir() + "/"
# Required var for the replaceScene() func to work
var _savedObjects := []

# Initialize the mod
# This function is executed before the majority of the game is loaded
# Only the Tool and Debug AutoLoads are available
# Script and scene replacements should be done here, before the originals are loaded
func _init(modLoader = ModLoader):
	l("Registered!")
#	replaceScene("font_overrides/courier_bold.ttf","res://HevLib/ui/themes/fonts/courier_new/courier_bold.ttf")
#	replaceScene("font_overrides/courier_new.ttf","res://HevLib/ui/themes/fonts/courier_new/courier_new.ttf")
#	replaceScene("font_overrides/verdana.ttf","res://HevLib/ui/themes/fonts/verdana/verdana.ttf")
#	replaceScene("font_overrides/verdana_bold.ttf","res://HevLib/ui/themes/fonts/verdana/verdana_bold.ttf")
	
	
func l(msg:String, title:String = MOD_NAME, version:String = str(MOD_VERSION_MAJOR) + "." + str(MOD_VERSION_MINOR) + "." + str(MOD_VERSION_BUGFIX)):
	if not MOD_VERSION_METADATA == "":
		version = version + "-" + MOD_VERSION_METADATA
	Debug.l("[%s V%s]: %s" % [title, version, msg])

func replaceScene(newPath:String, oldPath:String = ""):
	l("Updating scene: %s" % newPath)

	if oldPath.empty():
		oldPath = str("res://" + newPath)

	newPath = str(modPath + newPath)

	var scene := load(newPath)
	scene.take_over_path(oldPath)
	_savedObjects.append(scene)
	l("Finished updating: %s" % oldPath)
