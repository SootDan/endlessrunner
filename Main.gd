extends Node3D

@export var scenes: Array[PackedScene]
@onready var old_node
@onready var new_node
@onready var interface = $Control/Panel/RichTextLabel
var coins_collected := 0


func _ready() -> void:
	old_node = scenes.pick_random().instantiate()
	add_child(old_node)
	
	Event.connect("player_entered_tile", spawn_next)
	Event.connect("player_collected_coin", coin_slots)
	Event.connect("player_died", game_over)


func spawn_next() -> void:
	new_node = scenes.pick_random().instantiate()
	print("Created new tile ", new_node)
	new_node.position.x = $Player.position.x + 20.0
	add_child(new_node)


func coin_slots() -> void:
	coins_collected += 1
	interface.text = "Coins Collected: %s" % coins_collected


func game_over() -> void:
	pass
