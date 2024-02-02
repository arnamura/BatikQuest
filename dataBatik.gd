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
	"isGet": true
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
	"deskripsi" : "Batik non-keraton yang memiliki filosofi tanaman bambu yang biasa hidup bergerombol membentuk satu kesatuan. Berasal dari pedesaan di daerah Magetan. Diperkenalkan oleh prajurit mataram yang lari setelah pecah perang. Diberikan kepada anak yang telah berkeluarga dari orang tua sebagai simbol walau sudah berkeluarga tapi tetap menjadi satu rumpun bagi keluarga besarnya",
	"ciri" : "Berbentuk seperti tanaman bambu yang disertai ornamen lainnya seperti bunga atau daun",
	"isGet": false
}

var batik6 := { # tolong diriset lebih jauh
	"nama": "Sawat",
	"pathimg": "res://art/batik/sawat.png",
	"deskripsi" : "Batik yang berasal dari Pekalongan. Sawat memiliki arti sayap garuda di kiri dan kanan serta mengembang dan menampakan ekor ditengahnya",
	"ciri" : "Memiliki ornamen menyerupai Garuda, pohon hayat, burung atau sayap, meru (gunung)",
	"isGet": false
}

var batik7 := { # misi 2 rahmat "riset soal deskripsi"
	"nama": "Sekar Jagad",
	"pathimg": "res://art/batik/sekarjagad.png",
	"deskripsi" : "Secara makna berarti 'Bunga jagad raya yang menampilkan keindahan berbagai motif'. Batik yang dibawa menyebrang dari Majapahit ke Juwana. Dibuat oleh pembatik kraton yang dijuluki Nyai Majapahit",
	"ciri" : "Kombinasi dari banyak elemen yang dituangkan dan berbentuk secara spesifik",
	"isGet": false
}

var batik8 := { # misi 1 rahmat
	"nama": "Sidomukti",
	"pathimg": "res://art/batik/sidomukti.png",
	"deskripsi" : "Memiliki filosofi 'Kiblat papat, limo pancer' yang berati empat arah yang diharmonikan dengan pusat. Berarti menyeimbangkan secara vertikal antara dunia atas (akhirat) dengan dunia bawah (fana) dan horizontal yaitu bertemunya unsur lelaki dan perempuan. Kain dengan tingkat tertinggi di lingkungan kraton saat upacara ijab atau panggin(temu). Diberikan pada pengantin sebagai doa untuk menggapai kemuliaan, kemakmuran dan kesuburan. Sepasang batik sidomukti disebut sawitan",
	"ciri" : "Bermotif belah ketupat yang disusun beraturan dan memiliki ornamen di tengahnya",
	"isGet": true
}

var batik9 := { #riset lagi soal ciri
	"nama": "truntum",
	"pathimg": "res://art/batik/truntum.png",
	"deskripsi" : "Kain ini dibuat karena Kanjeng ratu beruk yang hatinya gundah karena pakubuwono VIII memiliki istri baru. Motif tersebut dipakai karena Kanjeng Ratu Beruk melihat keindahan Bunga Tanjung yang berguguran. Kain ini dibuat agar Pakubuwono VIII tertari terhadap Kanjeng Ratu Beruk lagi. Truntum melambangkan Harapan walau langit malam tanpa penerangan, masih ada bintang yang menyinari. Yang berarti selalu ada kesulitan dalam kemudahan",
	"ciri" : "Memiliki motif berbentuk bunga-bunga kecil yang disusun rapih sebagai latar dari kain",
	"isGet": false
}
