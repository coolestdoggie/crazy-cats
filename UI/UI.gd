extends CanvasLayer

signal play_button_pressed
signal reset_button_pressed
signal next_level_pressed

@export var inventory_ui : InventoryUI
@export var in_game_ui : Control
@export var end_level_ui : EndLevelUI

func update_ui_inventory():
	inventory_ui.update_inventory()

func _on_play_button_pressed():
	play_button_pressed.emit()


func _on_reset_button_pressed():
	reset_button_pressed.emit()

func _on_next_level_button_pressed():
	next_level_pressed.emit()

func _on_game_state_machine_transitioned(state_name:String):
	if state_name == "PlanningState":
		in_game_ui.visible = true
		enable_inventory()
		disable_finish_screen()
		update_ui_inventory()
	elif state_name == "FinishState":
		in_game_ui.visible = false
		disable_inventory()
		enable_finish_screen()
	else:
		
		disable_inventory()


func disable_inventory():
	inventory_ui.visible = false


func enable_inventory():
	inventory_ui.visible = true


func enable_finish_screen():
	end_level_ui.visible = true


func disable_finish_screen():
	end_level_ui.visible = false
