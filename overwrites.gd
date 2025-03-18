extends Node
#
func _init():
# music
	var raising_paint = preload("res://mods-unpacked/MarioSpore-TTCCpack/overwrites/audio/music/GS_Race_SS.ogg")
	raising_paint.take_over_path("res://audio/music/climb_boss.ogg")
	var clown_paint = preload("res://mods-unpacked/MarioSpore-TTCCpack/overwrites/audio/music/Flock_of_one.ogg")
	clown_paint.take_over_path("res://audio/music/clown_boss.ogg")
