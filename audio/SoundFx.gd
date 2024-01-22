extends Node

var bgmPlay = false
var fadingbgm = false

#@onready var tween = create_tween()
@onready var Village = $Bgm/village
@onready var Forest = $Bgm/forest
@onready var Dungeon = $Bgm/dungeon
@onready var Museum = $Bgm/museum
@onready var Boss = $Bgm/boss
@onready var Desert = $Bgm/dessert
@onready var Flower = $Bgm/flower

func buttonClick():
	$ButtonClick.play()

func walkFx():
	$walk.play()

func hurtFx():
	$hurt.play()
	
func mainmenuBgm():
	fade_in($Bgm/mainmenu)
	$Bgm/mainmenu.play()
	
func fade_in(bgm: AudioStreamPlayer): #fungsi agar saat bgm mulai, ada efek fade in
	var tween = create_tween()
	tween.tween_property(bgm, "volume_db", -10, 5)
	
func fade_out(bgm: AudioStreamPlayer): #fungsi agar saat bgm berhenti, ada efek fade out
	var tween = create_tween()
	tween.tween_property(bgm, "volume_db", -80, 5)
	
func stopBgm(bgm): #Untuk menghentikan bgm ketika player berada di sebuah area
	match(bgm):
		"Village":
			fade_out(Village)
		"Forrest":
			fade_out(Forest)
		"Dungeon":
			fade_out(Dungeon)
		"Museum":
			fade_out(Museum)
		"Boss":
			fade_out(Boss)
		"Desert":
			fade_out(Desert)
		"TamanBunga":
			fade_out(Flower)
	
func playBgm(bgm): #Untuk memutar bgm ketika player berada di sebuah area
	match(bgm):
		"Village":
			Village.volume_db = -30
			Village.play()
			fade_in(Village)
		"Forrest":
			Forest.volume_db = -30
			Forest.play()
			fade_in(Forest)
		"Dungeon":
			Dungeon.volume_db = -30
			Dungeon.play()
			fade_in(Dungeon)
		"Museum":
			Museum.volume_db = -30
			Museum.play()
			fade_in(Museum)
		"Boss":
			Boss.volume_db = -30
			Boss.play()
			fade_in(Boss)
		"Desert":
			Desert.volume_db = -30
			Desert.play()
			fade_in(Desert)
		"TamanBunga":
			Flower.volume_db = -30
			Flower.play()
			fade_in(Flower)
			
