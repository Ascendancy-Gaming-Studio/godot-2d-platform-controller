extends Control


var store := GetIt.get_instance.call() as Dictionary


@onready var label := get_node_or_null("margin_container/box_container/box_container2/label") as Label



func _ready() -> void:
	store.get("register").call("autoload_manager", Autoload.new(store))
	store.get("register").call("counter", ValueNotifier.new(0))
	store.get("get_store_item").call("counter").get("value").get("add_listener").call(_update_counter_label)



func _on_increment_counter_pressed() -> void:
	var counter = store.get("get_store_item").call("counter").get("value")

	if not counter:
		return


	counter.set("_value", counter.get("_value") + 1)


func _on_decrement_counter_pressed() -> void:
	var counter = store.get("get_store_item").call("counter").get("value")

	if not counter:
		return


	counter.set("_value", counter.get("_value") - 1)


func _update_counter_label(new_value: int, old_value: int) -> void:
	if not label:
		return


	label.text = str(new_value)
