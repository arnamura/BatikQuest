extends Node

#note:
#variable quest title sebagai nama dari quest
#quest status untuk menandakan apakah quest tersebut sudah selesai atau belum
#get quest untuk menandakan apa quest sudah didapatkan atau belum
#reqItem merupakan item yang harus didapatkan untuk menyelesaikan misi
#inQuest digunakan agar pemain hanya bisa mengerjakan satu quest dalam satu waktu
#dungeonState digunakan untuk memunculkan ui hp saat berada di dungeon

var introQuest = false
var inQuest = false
var dungeonState = false
var isPause = false
var playerPosLoad
var playerMapLoad


#introQuest
var quest0title: String = "Dunia Yang Berbeda"
var quest0Status: bool = false
var takenQuest0: bool = false
var reqItem0: String = ""

var quest0text1: String = "- Bicara dengan Bapak"
var quest0text2: String = "- Bicara dengan Penjaga didepan"

#quest 1
var quest1title: String = "Desa Batik "
var quest1Status: bool = false
var takenQuest1: bool = false
var reqItem1: String = ""

var quest1text1: String = "- Beli kain batik ke pedagang berkacamata"
var quest1text2: String = "- Berikan kain kepada kakek"

#quest 2
var quest2title: String = "Barang Yang Hilang"
var quest2Status: bool = false
var takenQuest2: bool = false
var reqItem2: String = ""

var quest2text1: String = "- Bantu Rahmat menemukan barangnya yang hilang"
var quest2text2: String = "- Kembalikan barang ke Rahmat"

#quest 3
var quest3title: String = "Petualang Pemberani"
var quest3Status: bool = false
var takenQuest3: bool = false
var reqItem3: String = ""

var quest3text1: String = "- Pergi ke dalam goa dan temukan batik yang dicuri"
var quest3text2: String = "- Berikan batik kepada Bang Dirman"
#tambahan
var kunciDungeon: bool = false
var pintuDungeon: bool = false

#quest 4
var quest4title: String = "Kain bermotif bunga"
var quest4Status: bool = false
var takenQuest4: bool = false
var reqItem4: String = "1"

var quest4text1: String = "-"
var quest4text2: String = "- Bawa temuan kain batik kepada kakek"

var questInfo = {
	0: {
		"status": quest0Status,
		"taken": takenQuest0,
		"item": reqItem0,
		"text1": quest0text1,
		"text2": quest0text2
		},
	1: {
		"status": quest1Status,
		"taken": takenQuest1,
		"item": reqItem1,
		"text1": quest1text1,
		"text2": quest1text2
		},
	2: {
		"status": quest2Status,
		"taken": takenQuest2,
		"item": reqItem2,
		"text1": quest2text1,
		"text2": quest2text2
		},
	3: {
		"status": quest3Status,
		"taken": takenQuest3,
		"item": reqItem3,
		"text1": quest3text1,
		"text2": quest3text2
		},
	4: {
		"status": quest4Status,
		"taken": takenQuest4,
		"item": reqItem4,
		"text1": quest4text1,
		"text2": quest4text2
		}
}

func _process(_delta):
	playerMapLoad
	playerPosLoad
	questInfo = {
	0: {
		"status": quest0Status,
		"taken": takenQuest0,
		"item": reqItem0,
		"text1": quest0text1,
		"text2": quest0text2
		},
	1: {
		"status": quest1Status,
		"taken": takenQuest1,
		"item": reqItem1,
		"text1": quest1text1,
		"text2": quest1text2
		},
	2: {
		"status": quest2Status,
		"taken": takenQuest2,
		"item": reqItem2,
		"text1": quest2text1,
		"text2": quest2text2
		},
	3: {
		"status": quest3Status,
		"taken": takenQuest3,
		"item": reqItem3,
		"text1": quest3text1,
		"text2": quest3text2
		},
	4: {
		"status": quest4Status,
		"taken": takenQuest4,
		"item": reqItem4,
		"text1": quest4text1,
		"text2": quest4text2
		}
}
