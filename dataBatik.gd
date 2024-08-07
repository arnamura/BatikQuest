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
		"Motif kelompok bunga-bunga yang dihias dengan daun disekelilingnya menjadi kerangka segi empat (Ceplokan: Didasari bentuk-bentuk geometris persegi/oval/bintang yang disusun melingkar menjadi sekuntum bunga) Batik truntum dan kawung juga menggunakan ceplok sebagai dasar motifnya",
	"isGet": false,
	"how": "Menerima quest dari Kakek"
}

var batik2 := { # misi 1 bang dirman
	"nama": "Gringsing",
	"pathimg": "res://art/batik/gringsing.png",
	"deskripsi" : "Kain ini dipakai sebagai hiasan pada kereta megah yang telah ada sejak zaman Raden Wijaya di Majapahit. Kain ini juga merupakah hadiah untuk panglima perang yang telah berjasa. Konon, kain ini memiliki kekuatan untuk menyembuhkan luka",
	"ciri" : "Memiliki motif lingkaran kecil-kecil sebagai latar dari kain dengan sebuah titik di tengah lingkaran tersebut",
	"isGet": false,
	"how": "Membantu Bang Dirman mengembalikan barang kerajaan di dalam Dungeon"
}

var batik3 := { # intro quest
	"nama": "Kawung",
	"pathimg": "res://art/batik/kawung.png",
	"deskripsi" : "Diciptakan oleh Sultan Mataram, yaitu Sultan Agung Hanyokrokusumo. Motif Batik ini merupakan larangan di Keraton Yogyakarta yang hanya boleh dipakai oleh Raja dan Sentono dalem(Keluarga Raja)",
	"ciri" : "Berbentuk seperti 4 buah kolang-kaling yang disusun menjadi lingkaran dan terdapat ornamen kecil ditengahnya",
	"isGet": false,
	"how": "Menyelesaikan intro"
}

var batik4 := { #Pemberian akhir dari kakek
	"nama": "Parang",
	"pathimg": "res://art/batik/parang.png",
	"deskripsi" : "Ikon Batik Indonesia yang mudah dikenali. Diciptkan oleh Panembahan Senopati. Dipakai oleh Raja, Pemaisuri dan Putra Putri Keraton Surakarta yang merupakan 'ageman luhur' ",
	"ciri" : "Berasal dari kata 'pereng' yang berati lereng atau pinggiran tebing yang miring berbentuk diagonal. Terinspirasi dari meditasi penambahan senopati yang sedang memperhatikan gejolak ombak pantai selatan yang sedang menghantam batuk karang",
	"isGet": false,
	"how": "Mengumpulkan ke-8 batik yang ada di Desa lalu, pergi menemui Kakek"
}

var batik5 := { # misi 2 kakek taman bunga
	"nama": "Pring Sedapur",
	"pathimg": "res://art/batik/pringSedapur.png",
	"deskripsi" : "Batik non-keraton yang memiliki filosofi tanaman bambu yang biasa hidup bergerombol membentuk satu kesatuan. Berasal dari pedesaan di daerah Magetan. Diperkenalkan oleh prajurit mataram yang lari setelah pecah perang. Diberikan kepada anak yang telah berkeluarga dari orang tua sebagai simbol walau sudah berkeluarga tapi tetap menjadi satu rumpun bagi keluarga besarnya",
	"ciri" : "Berbentuk seperti tanaman bambu yang disertai ornamen lainnya seperti bunga atau daun",
	"isGet": false,
	"how": "Ditemukan di dalam peti di sekitar taman bunga"
}

var batik6 := { # tolong diriset lebih jauh misi batik petarung bang dirman 2
	"nama": "Sawat",
	"pathimg": "res://art/batik/sawat.png",
	"deskripsi" : "Batik yang berasal dari Pekalongan. Sawat memiliki arti sayap garuda di kiri dan kanan serta mengembang dan menampakan ekor ditengahnya",
	"ciri" : "Memiliki ornamen menyerupai Garuda, pohon hayat, burung atau sayap, meru (gunung)",
	"isGet": false,
	"how": "Menolong petarung yang terluka di dalam Dungeon"
}

var batik7 := { # misi 6 peti harta desa
	"nama": "Sekar Jagad",
	"pathimg": "res://art/batik/sekarjagad.png",
	"deskripsi" : "Secara makna berarti 'Bunga jagad raya yang menampilkan keindahan berbagai motif'. Batik yang dibawa menyebrang dari Majapahit ke Juwana. Dibuat oleh pembatik kraton yang dijuluki Nyai Majapahit",
	"ciri" : "Kombinasi dari banyak elemen yang dituangkan dan berbentuk secara spesifik",
	"isGet": false,
	"how": "Ditemukan di dalam peti di sekitar Desa yang terbengkalai"
}

var batik8 := { # misi 1 rahmat
	"nama": "Sidomukti",
	"pathimg": "res://art/batik/sidomukti.png",
	"deskripsi" : "Memiliki filosofi 'Kiblat papat, limo pancer' yang berati empat arah yang diharmonikan dengan pusat. Berarti menyeimbangkan secara vertikal antara dunia atas (akhirat) dengan dunia bawah (fana) dan horizontal yaitu bertemunya unsur lelaki dan perempuan. Kain dengan tingkat tertinggi di lingkungan kraton saat upacara ijab atau panggin(temu). Diberikan pada pengantin sebagai doa untuk menggapai kemuliaan, kemakmuran dan kesuburan. Sepasang batik sidomukti disebut sawitan",
	"ciri" : "Bermotif belah ketupat yang disusun beraturan dan memiliki ornamen di tengahnya",
	"isGet": false,
	"how": "Membantu Rahmat menemukan barangnya"
}

var batik9 := { # misi kucing "riset lagi soal ciri"
	"nama": "Truntum",
	"pathimg": "res://art/batik/truntum.png",
	"deskripsi" : "Kain ini dibuat karena Kanjeng ratu beruk yang hatinya gundah karena pakubuwono VIII memiliki istri baru. Motif tersebut dipakai karena Kanjeng Ratu Beruk melihat keindahan Bunga Tanjung yang berguguran. Kain ini dibuat agar Pakubuwono VIII tertari terhadap Kanjeng Ratu Beruk lagi. Truntum melambangkan Harapan walau langit malam tanpa penerangan, masih ada bintang yang menyinari. Yang berarti dalam kesulitan pasti ada kemudahan setelahnya",
	"ciri" : "Memiliki motif berbentuk bunga-bunga kecil yang disusun rapih sebagai latar dari kain",
	"isGet": false,
	"how": "Membantu seekor kucing"
}

#part 2 batik

var batik10 := { # Minigame1
	"nama": "Mega Mendung",
	"pathimg": "res://art/batik/megamendung.png",
	"deskripsi" : "Mega berati awan dan mendung berati cuaca sejuk. Berasal dari Cirebon yang dibuat dengan harapan agar pemakainya selalu berusaha menjadi orang yang menyejukan suasana, tidak mudah marah dan tidak mudah tersinggung",
	"ciri" : "Motif berbentuk awan-awan dengan gradasi biru. motif ini merupakan pola hias pengaruh cina. Memiliki ciri khas dengan garis yang cenderung lonjong dengan bentuk lancip pada ujungnya membentuk segitiga",
	"isGet": false,
	"how": ""
}

var batik11 := { # Minigame1
	"nama": "Banji",
	"pathimg": "res://art/batik/banji.png",
	"deskripsi" : "Banji dari bahasa dialek Tionghoa, ban berarti sepuluh dan dzi berarti ribu. Perlambang murah rezeki atau kebahagiaan yang berlipat ganda. Pola ini banyak dipopulerkan di daerah Banyumas",
	"ciri" : "Pola ini terinspirasi dari balok bosok (kayu busuk) karena berbentuk menyerupai balok-balok bersilang yang dimakan bubuk",
	"isGet": false,
	"how": ""
}

var batik12 := { # Minigame1
	"nama": "Besurek",
	"pathimg": "res://art/batik/besurek.png",
	"deskripsi" : "Berasal dari Bengkulu. Besurek berarti bersurat atau tulisan. motif ini diperkenalkan oleh Arab dan India pada abad 17",
	"ciri" : "Memiliki motif gabungan aksara kaganga dan kaligrafi Arab dengan hiasan khas dari Bengkulu dapat berupa bunga rafflessia, rembulan atau burung kuau",
	"isGet": false,
	"how": ""
}

var batik13 := { # Minigame2
	"nama": "Papadaw",
	"pathimg": "res://art/batik/papadaw.png",
	"deskripsi" : "Visualisasi festival Iraw Tengkayu yang merupakan budaya dari masyarakat Tidung Kalimantan Utara sebagai bentuk interaksi dengan lingkungan sekitarnya. Merupakan ungkapan rasa syukur atas aktivitas mereka sebagai nelayan yang disebut juga pesta laut. ",
	"ciri" : "Terdapat motif perahu sebagai representasi masyarakat tidung yang berprofesi sebagai nelayan dengan hiasan flora lautan",
	"isGet": false,
	"how": ""
}

var batik14 := { # Minigame2
	"nama": "Honai",
	"pathimg": "res://art/batik/honai.png",
	"deskripsi" : "Terinspirasi dari tempat tinggal masyarakat pegunungan Papua yaitu Honai. Yang mana tempat masyarakat Papua dilahirkan dan dibersarkan dan mempelajari arti kehidupan dan hubungan timbal balik manusia dengan alam. Bermakna ucapan rasa syukur terhadap sang pencipta",
	"ciri" : "Berfokuskan pada bentuk honai yang merupakan rumah tradisional masyarakat tradisional Papua di pegunungan.  Biasa didampingi hiasan kecil seperti burung cendrawasih, matoa, pegunungan, danau dan hal lain yang ikonik dengan Papua",
	"isGet": false,
	"how": ""
}

var batik15 := { # Minigame2
	"nama": "Matoa",
	"pathimg": "res://art/batik/matoa.png",
	"deskripsi" : "Motif yang terinspirasi dari buah asli Papua yaitu matoa. Bermakna ungkapan rasa syukur atas anugrah kesuburan dan kekayaan alam Papua",
	"ciri" : "Motif berbentuk buah matoa yang berbentuk loncong dan kecil berwarna coklat atau kekuningan. Biasa didampingi dengan daun matoa tanpa ada banyak tambahaan desain dekoratif lainnya.",
	"isGet": false,
	"how": ""
}

var batik16 := { # Minigame2
	"nama": "Jam Gadang",
	"pathimg": "res://art/batik/jamgadang.png",
	"deskripsi" : " Motif batik yang berasal dari padang Sumatra Barat yang dibuat pada tahun 2009 untuk meningkatkan daya tarik produk batik. Desain ini mengacu pada landmark daerah padang",
	"ciri" : "Memiliki motif jam gadang",
	"isGet": false,
	"how": ""
}

var batik17 := { # Minigame2
	"nama": "Angklung Buhun",
	"pathimg": "res://art/batik/angklungbuhun.png",
	"deskripsi" : "Berasal dari lebak. terinspirasi dari alat musik pusaka dari Suku Baduy yaitu angklung buhun. Angklung buhun ini biasa digunakan oleh Suku Baduy sebagai acara penanaman padi. Motif ini Melanmbangkan Kedinamisan dan kegembiraan",
	"ciri" : "Motif terdiri dari gambar angklung buhun, bedug kecil dan rumah Suku Baduy",
	"isGet": false,
	"how": ""
}

var batik18 := { # Minigame2
	"nama": "Lebak Bertauhid",
	"pathimg": "res://art/batik/lebakbertauhid.png",
	"deskripsi" : "Bertauhid merupakan Moto Kabupaten Lebak yang berarti bersih, taqwa, hijau, dan damai, Motif ini melambangkan Citra Kehidupan yang religius dengan penuh keimanan dan ketakwaan pada Allah SWT.",
	"ciri" : "Motif terdiri dari gambar bedug, surau Masjid, Tenun Baduy dan Motif kembang",
	"isGet": false,
	"how": ""
}
