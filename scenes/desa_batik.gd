extends Node2D
@onready var anim = $Effect

var playing = false
var fade_duration = 5.0  # Durasi fading dalam detik
var fade_timer = 0.0

func _ready():
	anim.play("transisiIn")

#func _process(delta):
#	if fade_timer < fade_duration:
#		fade_timer += delta
#		# Menghitung nilai normalisasi untuk fading (0.0 hingga 1.0)
#		var fade_normalized = fade_timer / fade_duration
#		# Menggunakan fungsi logarithmic untuk fading yang lebih halus
#		#volume_db = -60.0 + 60.0 * (1.0 - fade_normalized)
