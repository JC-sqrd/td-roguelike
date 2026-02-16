extends CanvasLayer

var main_ui_layout : Control

signal main_ui_layout_changed()

func set_main_ui_layout(ui : Control):
	if main_ui_layout != null:
		main_ui_layout.queue_free()
	
	main_ui_layout = ui
	add_child(main_ui_layout)
	main_ui_layout_changed.emit()
	pass
