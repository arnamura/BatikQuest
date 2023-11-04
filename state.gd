extends Node

#note:
#variable quest title sebagai nama dari quest
#quest status untuk menandakan apakah quest tersebut sudah selesai atau belum
#get quest untuk menandakan apa quest sudah didapatkan atau belum
#reqItem merupakan item yang harus didapatkan untuk menyelesaikan misi

var inQuest = false


	
#quest 1
var quest1title: String = "Desa Batik "
var quest1Status: bool = false
var takenQuest1: bool = false
var reqItem1: String = ""

var quest1text1: String = "- Dapatkan kain mori"
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

var questInfo = {
	0: {
		"status": quest1Status,
		"taken": takenQuest1,
		"item": reqItem1,
		"text1": quest1text1,
		"text2": quest1text2
	},
	1: {
		"status": quest2Status,
		"taken": takenQuest2,
		"item": reqItem2,
		"text1": quest2text1,
		"text2": quest2text2
	},
	2: {
		"status": quest3Status,
		"taken": takenQuest3,
		"item": reqItem3,
		"text1": quest3text1,
		"text2": quest3text2
	}
}

func _process(_delta):
	questInfo = {
		0: {
			"status": quest1Status,
			"taken": takenQuest1,
			"item": reqItem1,
			"text1": quest1text1,
			"text2": quest1text2
		},
		1: {
			"status": quest2Status,
			"taken": takenQuest2,
			"item": reqItem2,
			"text1": quest2text1,
			"text2": quest2text2
		},
		2: {
			"status": quest3Status,
			"taken": takenQuest3,
			"item": reqItem3,
			"text1": quest3text1,
			"text2": quest3text2
	}
	}
