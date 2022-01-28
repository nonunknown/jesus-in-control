tool
extends EditorPlugin

const ps_message = preload("res://addons/jesus_in_control/JIC_Message.tscn")
var message_popup : WindowDialog

func _enter_tree() -> void:
	message_popup = ps_message.instance()
	add_child(message_popup)
	pass


func _exit_tree() -> void:
	remove_child(message_popup)
	pass
