extends Node3D

@export var coin: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	create_coins()


func body_entered_tile(body: Node3D) -> void:
	if body is CharacterBody3D:
		Event.emit_signal("player_entered_tile")


func create_coins() -> void:
	for i in range(10):
		var new_coin := coin.instantiate()
		new_coin.position = Vector3(
			randi_range(0, 20),
			2,
			randi_range(1, 3)
		)
		add_child(new_coin)
