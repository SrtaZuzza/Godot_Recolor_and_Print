extends OptionButton

"""
TIP: YOU CAN USE FOR LOOPS AND ARRAYS TO REDUCE CODE
"""

onready var lower = owner.get_node("Lower")

func _on_Options_item_selected(index):
	match index:
		0: # SHORTS
			lower.material.set_shader_param("replaceWhite", Color.transparent)
			lower.material.set_shader_param("replaceGrey", Color.transparent)
			lower.material.set_shader_param("replaceBlack", Color.transparent)
			lower.material.set_shader_param("replaceMagenta", Color.transparent)
			lower.material.set_shader_param("replaceYellow", Color.transparent)
			lower.material.set_shader_param("replaceCyan", Color.transparent)
			lower.material.set_shader_param("hasPrint", false)
		1: # PANTS
			lower.material.set_shader_param("replaceWhite", Color.transparent)
			lower.material.set_shader_param("replaceGrey", Color.transparent)
			lower.material.set_shader_param("replaceBlack", Color.transparent)
			lower.material.set_shader_param("replaceYellow", lower.material.get_shader_param("replaceGreen"))
			lower.material.set_shader_param("replaceMagenta", lower.material.get_shader_param("replaceRed"))
			lower.material.set_shader_param("replaceCyan", lower.material.get_shader_param("replaceBlue"))
			lower.material.set_shader_param("hasPrint", false)
		2: # PRINTED SHORTS
			lower.material.set_shader_param("replaceWhite", Color.transparent)
			lower.material.set_shader_param("replaceGrey", Color.transparent)
			lower.material.set_shader_param("replaceBlack", Color.transparent)
			lower.material.set_shader_param("replaceMagenta", Color.transparent)
			lower.material.set_shader_param("replaceYellow", Color.transparent)
			lower.material.set_shader_param("replaceCyan", Color.transparent)
			lower.material.set_shader_param("hasPrint", true)
		3: # PRINTED PANTS
			lower.material.set_shader_param("replaceWhite", Color.transparent)
			lower.material.set_shader_param("replaceGrey", Color.transparent)
			lower.material.set_shader_param("replaceBlack", Color.transparent)
			lower.material.set_shader_param("replaceYellow", lower.material.get_shader_param("replaceGreen"))
			lower.material.set_shader_param("replaceMagenta", lower.material.get_shader_param("replaceRed"))
			lower.material.set_shader_param("replaceCyan", lower.material.get_shader_param("replaceBlue"))
			lower.material.set_shader_param("hasPrint", true)


