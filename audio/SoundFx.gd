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
@onready var walk = $walk
@onready var meow = $meow
@onready var PortalArea = $Bgm/portal

func buttonClick():
	$ButtonClick.play()

func walkFx():
	walk.pitch_scale = randf_range(.8, 1.2)
	walk.volume_db = -5
	walk.play()

func getItem():
	$getItem.play()

func getKain():
	$getKain.play()

func meowFx():
	meow.play()
	
func hurtFx():
	$hurt.play()
	
func mainmenuBgm():
	fade_in($Bgm/mainmenu)
	$Bgm/mainmenu.play()
	
func mainmenuBgmStop():
	fade_out($Bgm/mainmenu)
	$Bgm/mainmenu.stop()
func fade_in(bgm: AudioStreamPlayer): #fungsi agar saat bgm mulai, ada efek fade in
	var tween = create_tween()
	tween.tween_property(bgm, "volume_db", -10, 5).from(-30)
	
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
		"Dessert":
			fade_out(Desert)
		"TamanBunga":
			fade_out(Flower)
		"PortalArea":
			fade_out(PortalArea)
	
func playBgm(bgm): #Untuk memutar bgm ketika player berada di sebuah area
	match(bgm):
		"Village":
			Village.play()
			fade_in(Village)
		"Forrest":
			Forest.play()
			fade_in(Forest)
		"Dungeon":
			Dungeon.play()
			fade_in(Dungeon)
		"Museum":
			Museum.play()
			fade_in(Museum)
		"Boss":
			Boss.play()
			fade_in(Boss)
		"Dessert":
			Desert.play()
			fade_in(Desert)
		"TamanBunga":
			Flower.play()
			fade_in(Flower)
		"PortalArea":
			PortalArea.play()
			fade_in(PortalArea)
			
