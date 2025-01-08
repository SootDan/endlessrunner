extends Node3D

@export var coin: PackedScene
@export var obstacle: PackedScene
@export var coin_spawn := 10
var coordinates := []
var replace_tiles := [true, false]


func _ready() -> void:
	create_coins()
	create_obstacles()
	
	if replace_tiles.pick_random():
		var replace = $GridMap.get_used_cells_by_item(7)
		for i in len(replace):
			$GridMap.set_cell_item(replace[i], 5, 0)


func body_entered_tile(body: Node3D) -> void:
	if body is CharacterBody3D:
		Event.emit_signal("player_entered_tile")


func create_coins() -> void:
	for i in range(coin_spawn):
		var new_coin := coin.instantiate()
		new_coin.position = Vector3(
			randi_range(0, 20),
			1.5,
			randi_range(1, 4)
		)
		if new_coin.position not in coordinates:
			add_child(new_coin)
			coordinates.append(new_coin.position)


func create_obstacles() -> void:
	for i in range(coin_spawn / 3):
		var new_obstacle := obstacle.instantiate()
		new_obstacle.position = Vector3(
			randi_range(0,20),
			1.5,
			randi_range(1, 4)
		)
		if new_obstacle.position not in coordinates:
			add_child(new_obstacle)
