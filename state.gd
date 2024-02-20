extends Node

#note:
#variable quest title sebagai nama dari quest
#quest status untuk menandakan apakah quest tersebut sudah selesai atau belum
#get quest untuk menandakan apa quest sudah didapatkan atau belum
#reqItem merupakan item yang harus didapatkan untuk menyelesaikan misi
#inQuest digunakan agar pemain hanya bisa mengerjakan satu quest dalam satu waktu
#dungeonState digunakan untuk memunculkan ui hp saat berada di dungeon

#untuk kepentingan quest akhir
var benar = 0
var salah = 0
var pertanyaan = false

var introQuest = false #untuk trigger cut scene intro quest museum
var inQuest = false #keknya ga kepake
var dungeonState = false #kondisi untuk menentukan ui hp tampil hanya dalam dungeon
var isPause = false
var notMove = false
var playerPosLoad #posisi terakhir player berada
var playerMapLoad #map terakhir player berada
var bossPass = false #kondisi untuk penjaga boss bergeser
var getBatik: bool = false #untuk mengetahui jika player baru mendapat batik
var tamat: bool = false #bila sudah menyelesaikan game


#introQuest
var quest0title: String = "Dunia Yang Berbeda"
var quest0Status: bool = false
var takenQuest0: bool = false
var reqItem0: String = ""

var quest0text1: String = "- Bicara dengan Bapak"
var quest0text2: String = "- Bicara dengan Penjaga didepan"
var ikan = false

#quest 1 kakek
var quest1title: String = "Desa Batik "
var quest1Status: bool = false
var takenQuest1: bool = false
var reqItem1: String = ""

var quest1text1: String = "- Beli kain batik ke pedagang berkacamata"
var quest1text2: String = "- Berikan kain kepada kakek"

#quest 2 rahmat
var quest2title: String = "Barang Yang Hilang"
var quest2Status: bool = false
var takenQuest2: bool = false
var reqItem2: String = ""

var quest2text1: String = "- Bantu Rahmat menemukan barangnya yang hilang"
var quest2text2: String = "- Kembalikan barang ke Rahmat"

#quest 3 bang dirman
var quest3title: String = "Petualang Pemberani"
var quest3Status: bool = false
var takenQuest3: bool = false
var reqItem3: String = ""

var quest3text1: String = "- Pergi ke dalam goa dan temukan batik yang dicuri"
var quest3text2: String = "- Berikan batik kepada Bang Dirman"
#tambahan
var kunciDungeon: bool = false
var pintuDungeon: bool = false

#quest 4 peti taman bunga
var quest4title: String = "Kain bermotif bunga"
var quest4Status: bool = false
var takenQuest4: bool = false
var reqItem4: String = "1"

var quest4text1: String = "-"
var quest4text2: String = "- Bawa temuan kain batik kepada kakek"

#quest 5 kucing
var quest5title: String = "Berbuat baik kepada sesama mahkluk hidup"
var quest5Status: bool = false
var takenQuest5: bool = false
var reqItem5: String = "" #didapatkan dari penjaga saat intro quest 

var quest5text1: String = "Ikuti Kucing"
var quest5text2: String = "Bicara dengan Kucing?"

#quest 6 peti desa
var quest6title: String = "Kain bermotif bunga"
var quest6Status: bool = false
var takenQuest6: bool = false
var reqItem6: String = "1"

var quest6text1: String = "-"
var quest6text2: String = "- Bawa temuan kain batik kepada kakek"

#quest 7 petarung
var quest7title: String = "Petualang Adalah Saudara"
var quest7Status: bool = false
var takenQuest7: bool = false
var reqItem7: String = ""

var quest7text1: String = "- Beritahu bang Dirman mengenai petarung"
var quest7text2: String = "- Berikan pertolongan pada petarung"

#final quest
var quest8title: String = "Ujian Akhir"
var quest8Status: bool = false
var takenQuest8: bool = false
var reqItem8: String = ""

var quest8text1: String = "- Bicara dengan Kakek untuk persiapan quest terakhir"
var quest8text2: String = "- Tantang Boss terakhir"

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
		},
	5: {
		"status": quest5Status,
		"taken": takenQuest5,
		"item": reqItem5,
		"text1": quest5text1,
		"text2": quest5text2
		},
	6: {
		"status": quest6Status,
		"taken": takenQuest6,
		"item": reqItem6,
		"text1": quest6text1,
		"text2": quest6text2
		},
	7: {
		"status": quest7Status,
		"taken": takenQuest7,
		"item": reqItem7,
		"text1": quest7text1,
		"text2": quest7text2
		},
	8: {
		"status": quest8Status,
		"taken": takenQuest8,
		"item": reqItem8,
		"text1": quest8text1,
		"text2": quest8text2
		}
}

func _process(_delta):
	playerMapLoad
	playerPosLoad
	ikan
	benar
	salah
	tamat
	
	#agar langsung menerima quest akhir
	if quest0Status and quest1Status and quest2Status and quest3Status and quest4Status and quest5Status and quest6Status and quest7Status:
		takenQuest8 = true
		
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
		},
	5: {
		"status": quest5Status,
		"taken": takenQuest5,
		"item": reqItem5,
		"text1": quest5text1,
		"text2": quest5text2
		},
	6: {
		"status": quest6Status,
		"taken": takenQuest6,
		"item": reqItem6,
		"text1": quest6text1,
		"text2": quest6text2
		},
	7: {
		"status": quest7Status,
		"taken": takenQuest7,
		"item": reqItem7,
		"text1": quest7text1,
		"text2": quest7text2
		},
	8: {
		"status": quest8Status,
		"taken": takenQuest8,
		"item": reqItem8,
		"text1": quest8text1,
		"text2": quest8text2
		}
}

func save():
	var save_dict = {
		"ds" : dungeonState,
		"pd" : pintuDungeon,
		"kd" : kunciDungeon,
		"tamat" : tamat,
		"playerPos" : playerPosLoad,
		"playerMap" : playerMapLoad,
		"ikan": ikan,
		"benar": benar,
		"salah": salah,
		
		#quest variable
		"qs0" : quest0Status,
		"tq0" : takenQuest0,
		"ri0" : reqItem0,
		"b0" : DataBatik.batik1["isGet"],
		
		"qs1" : quest1Status,
		"tq1" : takenQuest1,
		"ri1" : reqItem1,
		"b1" : DataBatik.batik2["isGet"],
		
		"qs2" : quest2Status,
		"tq2" : takenQuest2,
		"ri2" : reqItem2,
		"b2" : DataBatik.batik3["isGet"],
		
		"qs3" : quest3Status,
		"tq3" : takenQuest3,
		"ri3" : reqItem3,
		"b3" : DataBatik.batik4["isGet"],
		
		"qs4" : quest4Status,
		"tq4" : takenQuest4,
		"ri4" : reqItem4,
		"b4" : DataBatik.batik5["isGet"],
		
		"qs5" : quest5Status,
		"tq5" : takenQuest5,
		"ri5" : reqItem5,
		"b5" : DataBatik.batik6["isGet"],
		
		"qs6" : quest6Status,
		"tq6" : takenQuest6,
		"ri6" : reqItem6,
		"b6" : DataBatik.batik7["isGet"],
		
		"qs7" : quest7Status,
		"tq7" : takenQuest7,
		"ri7" : reqItem7,
		"b7" : DataBatik.batik8["isGet"],
		
		"qs8" : quest8Status,
		"tq8" : takenQuest8,
		"ri8" : reqItem8,
		"b8" : DataBatik.batik9["isGet"]
	}
	return save_dict

func new_game(): #note: coba pake dictionary
	var save_path = "user://savegame.save"
	# Pastikan file ada sebelum dihapus
	if FileAccess.file_exists(save_path):

		print("Save game deleted.")
	else:
		print("Save game not found.")
	
func save_game():
	var saveGame = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	var json_string = JSON.stringify(save())
	saveGame.store_line(json_string)

func load_game():
	if not FileAccess.file_exists("user://savegame.save"):
		return
	
	var loadGame = FileAccess.open("user://savegame.save", FileAccess.READ)
	
	while loadGame.get_position() < loadGame.get_length():
		var json_string = loadGame.get_line()
		var json = JSON.new()
		var parse_result = json.parse(json_string)
		var data = json.get_data()
		
		#----------------- set value -----------------
		# bagian batik
		DataBatik.batik1["isGet"] = data["b0"]
		DataBatik.batik2["isGet"] = data["b1"]
		DataBatik.batik3["isGet"] = data["b2"]
		DataBatik.batik4["isGet"] = data["b3"]
		DataBatik.batik5["isGet"] = data["b4"]
		DataBatik.batik6["isGet"] = data["b5"]
		DataBatik.batik7["isGet"] = data["b6"]
		DataBatik.batik8["isGet"] = data["b7"]
		DataBatik.batik9["isGet"] = data["b8"]
		
		dungeonState = data["ds"]
		pintuDungeon = data ["pd"]
		kunciDungeon = data["kd"]
		playerMapLoad = data["playerMap"]
		playerPosLoad = data["playerPos"]
		ikan = data["ikan"]
		benar = data["benar"]
		salah = data["salah"]
		tamat = data["tamat"]
		
		# quest
		quest0Status = data["qs0"]
		takenQuest0 = data["tq0"]
		reqItem0 = data["ri0"]
		
		quest1Status = data["qs1"]
		takenQuest1 = data["tq1"]
		reqItem1 = data["ri1"]
		
		quest2Status = data["qs2"]
		takenQuest2 = data["tq2"]
		reqItem2 = data["ri2"]
		
		quest3Status = data["qs3"]
		takenQuest3 = data["tq3"]
		reqItem3 = data["ri3"]
		
		quest4Status = data["qs4"]
		takenQuest4 = data["tq4"]
		reqItem4 = data["ri4"]
		
		quest5Status = data["qs5"]
		takenQuest5 = data["tq5"]
		reqItem5 = data["ri5"]
		
		quest6Status = data["qs6"]
		takenQuest6 = data["tq6"]
		reqItem6 = data["ri6"]
		
		quest7Status = data["qs7"]
		takenQuest7 = data["tq7"]
		reqItem7 = data["ri7"]
		
		quest8Status = data["qs8"]
		takenQuest8 = data["tq8"]
		reqItem8 = data["ri8"]
		
