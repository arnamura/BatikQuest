extends Camera2D

@export var tilemap: TileMap
 # script ini digunakan untuk limiting camera
func _ready():
	var mapRect = tilemap.get_used_rect() #untuk menghitung tile yang digunakan di seluruh layer
	var tileSize = tilemap.cell_quadrant_size #menghitung width dan height pada base tile map
	var worldSizeInPixels = mapRect.size * tileSize #menghitung jumlah tile x dengan size per tile = total size pada world
	limit_right = worldSizeInPixels.x
	limit_bottom = worldSizeInPixels.y

