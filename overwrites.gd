extends Node

func _init():
# music
	var bossbot1 = preload("res://mods-unpacked/MarioSpore-TTCCpack/overwrites/audio/music/BB_club_silver.ogg")
	bossbot1.take_over_path("res://audio/music/Bossbot_Factory_v1.ogg")
	var bossbot2 = preload("res://mods-unpacked/MarioSpore-TTCCpack/overwrites/audio/music/BB_club_gold.ogg")
	bossbot2.take_over_path("res://audio/music/Bossbot_Factory_v2.ogg")
	var bossbot3 = preload("res://mods-unpacked/MarioSpore-TTCCpack/overwrites/audio/music/BB_club_diamond.ogg")
	bossbot3.take_over_path("res://audio/music/Bossbot_Factory_v3.ogg")
	var bossbotceo = preload("res://mods-unpacked/MarioSpore-TTCCpack/overwrites/audio/music/BB_club_gold_encntr.ogg")
	bossbotceo.take_over_path("res://audio/music/BossBot_CEO_v1.ogg")
	
	var daoffice = preload("res://mods-unpacked/MarioSpore-TTCCpack/overwrites/audio/music/LB_office_c.ogg")
	daoffice.take_over_path("res://audio/music/DA_Office.ogg")
	var jurybg = preload("res://mods-unpacked/MarioSpore-TTCCpack/overwrites/audio/music/LB_office_encntr_c_virtual.ogg")
	jurybg.take_over_path("res://audio/music/LB_juryBG.ogg")
	
	#var installer = preload("res://mods-unpacked/MarioSpore-TTCCpack/overwrites/audio/music/CB_mint_bullion.ogg")
	#installer.take_over_path("res://audio/music/installer.ogg")
	#var suit_winning = preload("res://mods-unpacked/MarioSpore-TTCCpack/overwrites/audio/music/CB_mint_encntr_bullion.ogg")
	#suit_winning.take_over_path("res://audio/music/encntr_suit_winning.ogg")
	
	var factory_resource := load("res://scenes/game_floor/department_floors/rooms_sell.tres")
	factory_resource.background_music.clear()
	factory_resource.background_music.append_array(load(["res://mods-unpacked/MarioSpore-TTCCpack/overwrites/audio/music/SB_factory.ogg", "res://mods-unpacked/MarioSpore-TTCCpack/overwrites/audio/music/SB_factory2.ogg]"))
	factory_resource.battle_music = load("res://mods-unpacked/MarioSpore-TTCCpack/overwrites/audio/music/SB_factory_encntr.ogg")
