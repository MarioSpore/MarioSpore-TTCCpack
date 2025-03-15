extends Node

func _init():
# music
	#bossbot
	var club_resource := load("res://scenes/game_floor/department_floors/rooms_boss.tres")
	club_resource.background_music.clear()
	club_resource.background_music.append_array([load("res://mods-unpacked/MarioSpore-TTCCpack/overwrites/audio/music/BB_club_silver.ogg"), load("res://mods-unpacked/MarioSpore-TTCCpack/overwrites/audio/music/BB_club_gold.ogg"), load("res://mods-unpacked/MarioSpore-TTCCpack/overwrites/audio/music/BB_club_diamond.ogg")])
	club_resource.battle_music = load("res://mods-unpacked/MarioSpore-TTCCpack/overwrites/audio/music/BB_club_gold_encntr.ogg")
	
	#lawbot
	var office_resource := load("res://scenes/game_floor/department_floors/rooms_law.tres")
	office_resource.background_music.clear()
	office_resource.background_music.append_array([load("res://mods-unpacked/MarioSpore-TTCCpack/overwrites/audio/music/LB_office_a.ogg"), load("res://mods-unpacked/MarioSpore-TTCCpack/overwrites/audio/music/LB_office_b.ogg"), load("res://mods-unpacked/MarioSpore-TTCCpack/overwrites/audio/music/LB_office_c.ogg")])
	office_resource.battle_music = load("res://mods-unpacked/MarioSpore-TTCCpack/overwrites/audio/music/LB_office_encntr_c_virtual.ogg")
	
	#cashbot
	var mint_resource := load("res://scenes/game_floor/department_floors/rooms_cash.tres")
	mint_resource.background_music.clear()
	mint_resource.background_music.append_array([load("res://mods-unpacked/MarioSpore-TTCCpack/overwrites/audio/music/CB_mint_coin.ogg"), load("res://mods-unpacked/MarioSpore-TTCCpack/overwrites/audio/music/CB_mint_dollar.ogg"), load("res://mods-unpacked/MarioSpore-TTCCpack/overwrites/audio/music/CB_mint_bullion.ogg")])
	mint_resource.battle_music = load("res://mods-unpacked/MarioSpore-TTCCpack/overwrites/audio/music/CB_mint_encntr_bullion.ogg")
	
	#sellbot
	var factory_resource := load("res://scenes/game_floor/department_floors/rooms_sell.tres")
	factory_resource.background_music.clear()
	factory_resource.background_music.append_array([load("res://mods-unpacked/MarioSpore-TTCCpack/overwrites/audio/music/SB_factory.ogg"), load("res://mods-unpacked/MarioSpore-TTCCpack/overwrites/audio/music/SB_factory_side.ogg")])
	factory_resource.battle_music = load("res://mods-unpacked/MarioSpore-TTCCpack/overwrites/audio/music/SB_factory_encntr.ogg")

	#turn-based bosses
  ## Run this once game is initialized:
	#BattleService.s_battle_spawned.connect(on_battle_spawned)
#
#func on_battle_spawned(battle : BattleNode) -> void:
	#if battle.override_intro:
		#match battle.override_intro.get_class():
			#LavaBossMovie:
				#battle.override_intro.override_music = load("new_lavaboss_battle.ogg")
			#MoleCogIntro:
				#battle.override_intro.override_music = load("new_molecog_battle.ogg")
