extends NinePatchRect

@onready var pict: TextureRect = $TextureRect
@onready var batikLabel: Label = $BatikLabel
@onready var desc: RichTextLabel = $DescLabel
@onready var btnNext: Button = $BtnNext
@onready var subTitle: Label = $SubTitle

var i = false #penanda untuk btn next
		
func _process(delta):
	if DataBatik.getBat == true:
		updateDetail(DataBatik.pressedBatik)
	else:
		pass

func updateDetail(data):
	pict.set_texture(load(data["pathimg"]))
	batikLabel.text = data["nama"]
	updateText()

func updateText():
	if i == true:
		desc.text = DataBatik.pressedBatik["ciri"]
		subTitle.text = "Ciri-ciri :"
		btnNext.text = "Deskripsi"
	elif i == false:
		desc.text = DataBatik.pressedBatik["deskripsi"]
		subTitle.text = "Deskripsi :"
		btnNext.text = "Ciri-ciri"

func _on_btn_next_pressed():
	SoundFx.buttonClick()
	if i == true:
		updateText()
		i = false
	elif i == false:
		updateText()
		i = true
	
func _on_close_pressed():
	SoundFx.buttonClick()
	DataBatik.getBat = false
	i = false
	visible = false
