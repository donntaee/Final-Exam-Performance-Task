extends Area2D

@export var speed = 400
@onready var enemy_hit = $"../Enemyhit"
@onready var bg_music = $"../BG"

func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	
	position += velocity * delta
	
	


func _on_body_entered(body):
	hide()
	enemy_hit.play()
	bg_music.stop()
	
