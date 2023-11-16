extends CanvasLayer

signal play_button_pressed
signal stop_button_pressed
signal reset_button_pressed

@export var inventory_ui : InventoryUI

func update_ui_inventory():
	inventory_ui.update_inventory()

func _on_play_button_pressed():
	play_button_pressed.emit()


func _on_stop_button_pressed():
	stop_button_pressed.emit()


func _on_reset_button_pressed():
	reset_button_pressed.emit()


func _on_game_state_machine_transitioned(state_name:String):
	if state_name == "PlanningState":
		update_ui_inventory()
