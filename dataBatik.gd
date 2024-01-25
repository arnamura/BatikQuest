extends Node

var pressedBatik #Menyimpan data batik yang sedang dipilih
var getBat = false #temp
var visibleDesc = false

var batik1 := { # misi 1 Kakek
	"nama": "Ceplok",
	"pathimg": "res://art/batik/ceplok.png",
	"deskripsi" :
		"Motif batik yang berasal dari kalangan petani dan rakyat. Inspirasinya berasal dari bunga-bunga yang tumbuh di semak-semak di pedesaan. Tidak ada filosofi khusus. Namun, dari segi geometri, motif ini dapat mencerminkan keseimbangan, keteraturan, dan kesempurnaan bagi mereka yang memakainya.",
	"ciri" :
		"Motif kelompok bunga-bunga yang dihias dengan daun disekelilingnya menjadi kerangka segi empat\n(Ceplokan: Didasari bentuk-bentuk geometris persegi/oval/bintang yang disusun melingkar menjadi sekuntum bunga)",
	"isGet": false
}

var batik2 := { # misi 1 bang dirman
	"nama": "Gringsing",
	"pathimg": "res://art/batik/gringsing.png",
	"deskripsi" : "Kain ini dipakai sebagai hiasan pada kereta megah yang telah ada sejak zaman Raden Wijaya di Majapahit. Kain ini juga merupakah hadiah untuk panglima perang yang telah berjasa. Konon, kain ini memiliki kekuatan untuk menyembuhkan luka",
	"ciri" : "Memiliki motif lingkaran kecil-kecil sebagai latar dari kain dengan sebuah titik di tengah lingkaran tersebut",
	"isGet": false
}

var batik3 := { # intro quest
	"nama": "Kawung",
	"pathimg": "res://art/batik/kawung.png",
	"deskripsi" : "Diciptakan oleh Sultan Mataran, yaitu Sultan Agung Hanyokrokusumo. Motif Batik ini merupakan larangan di Keraton Yogyakarta yang hanya boleh dipakai oleh Raja dan Sentono dalem(Keluarga Raja)",
	"ciri" : "Berbentuk seperti 4 buah kolang-kaling yang disusun menjadi lingkaran dan terdapat ornamen kecil ditengahnya",
	"isGet": false
}

var batik4 := {
	"nama": "Parang",
	"pathimg": "res://art/batik/parang.png",
	"deskripsi" : "Ikon Batik Indonesia yang mudah dikenali. Diciptkan oleh Panembahan Senopati. Dipakai oleh Raja, Pemaisuri dan Putra Putri Keraton Surakarta yang merupakan 'ageman luhur' ",
	"ciri" : "Berasal dari kata 'pereng' yang berati lereng atau pinggiran tebing yang miring berbentuk diagonal. Terinspirasi dari meditasi penambahan senopati yang sedang memperhatikan gejolak ombak pantai selatan yang sedang menghantam batuk karang",
	"isGet": false
}

var batik5 := { # misi 2 kakek taman bunga
	"nama": "Pring Sedapur",
	"pathimg": "res://art/batik/pringSedapur.png",
	"deskripsi" : "tba",
	"ciri" : "batik",
	"isGet": false
}

var batik6 := {
	"nama": "Sawat",
	"pathimg": "res://art/batik/sawat.png",
	"deskripsi" : "tba",
	"ciri" : "batik",
	"isGet": false
}

var batik7 := { # misi 2 rahmat
	"nama": "Sekar Jagad",
	"pathimg": "res://art/batik/sekarjagad.png",
	"deskripsi" : "tba",
	"ciri" : "batik",
	"isGet": false
}

var batik8 := { # misi 1 rahmat
	"nama": "Sidomukti",
	"pathimg": "res://art/batik/sidomukti.png",
	"deskripsi" : "tba",
	"ciri" : "batik",
	"isGet": false
}

var batik9 := {
	"nama": "truntum",
	"pathimg": "res://art/batik/truntum.png",
	"deskripsi" : "tba",
	"ciri" : "batik",
	"isGet": false
}
