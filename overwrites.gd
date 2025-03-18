extends Node
#
func _init():
# music
	print("Hello from overwrites.gd")
	var raising_paint = preload("res://mods-unpacked/MarioSpore-TTCCpack/overwrites/audio/music/GS_Race_SS.ogg")
	raising_paint.take_over_path("res://audio/music/climb_boss.ogg")
	var clown_paint = preload("res://mods-unpacked/MarioSpore-TTCCpack/overwrites/audio/music/Flock_of_one.ogg")
	clown_paint.take_over_path("res://audio/music/clown_boss.ogg")
	#var boss_music = preload("res://mods-unpacked/MarioSpore-TTCCpack/overwrites/audio/music/Instance_rainmaker_battle_empty.ogg")
	#boss_music.take_over_path("res://audio/music/ground_floor_investor.ogg")
	#var minesweeper = preload("res://mods-unpacked/MarioSpore-TTCCpack/overwrites/audio/music/LB_boss_cutscene.ogg")
	#minesweeper.take_over_path("res://audio/music/encntr_skull_master.ogg")
