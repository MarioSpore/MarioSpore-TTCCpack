extends Node

## CHANGE THESE FOR YOUR MOD!!!!!
const ROOM_LOADER_DIR := "MarioSpore-TTCCpack"
const ROOM_LOADER_LOG := "MarioSpore-TTCCpack:Main"


const MUSIC_MAPPINGS : Dictionary[String, String] = {
	"climb_boss.ogg" : "GS_Race_SS.ogg",
	"clown_boss.ogg" : "Flock_of_one.ogg",
	"main_theme.ogg" : "tt_theme.ogg",
	"MG_Pairing.ogg" : "MG_Pairing.ogg"
	
}
const RANDOM_FACTORY_MUSIC: Dictionary[String, String] = {
	"res://mods-unpacked/MarioSpore-TTCCpack/music_tracks/SB_factory.ogg" : "res://mods-unpacked/MarioSpore-TTCCpack/music_tracks/SB_factory_encntr.ogg",
	"res://mods-unpacked/MarioSpore-TTCCpack/music_tracks/SB_factory_side.ogg" : "res://mods-unpacked/MarioSpore-TTCCpack/music_tracks/SB_factory_encntr_side.ogg",
}
const RANDOM_MINT_MUSIC: Dictionary[String, String] = {
	"res://mods-unpacked/MarioSpore-TTCCpack/music_tracks/CB_mint_coin.ogg" : "res://mods-unpacked/MarioSpore-TTCCpack/music_tracks/CB_mint_encntr_coin.ogg",
	"res://mods-unpacked/MarioSpore-TTCCpack/music_tracks/CB_mint_dollar.ogg": "res://mods-unpacked/MarioSpore-TTCCpack/music_tracks/CB_mint_encntr_dollar.ogg",
	"res://mods-unpacked/MarioSpore-TTCCpack/music_tracks/CB_mint_bullion.ogg" : "res://mods-unpacked/MarioSpore-TTCCpack/music_tracks/CB_mint_encntr_bullion.ogg",
}
const RANDOM_OFFICE_MUSIC: Dictionary[String, String] = {
	"res://mods-unpacked/MarioSpore-TTCCpack/music_tracks/LB_office_a.ogg" : "res://mods-unpacked/MarioSpore-TTCCpack/music_tracks/LB_office_encntr_a.ogg",
	"res://mods-unpacked/MarioSpore-TTCCpack/music_tracks/LB_office_b.ogg" : "res://mods-unpacked/MarioSpore-TTCCpack/music_tracks/LB_office_encntr_b.ogg",
	"res://mods-unpacked/MarioSpore-TTCCpack/music_tracks/LB_office_c.ogg" : "res://mods-unpacked/MarioSpore-TTCCpack/music_tracks/LB_office_encntr_c.ogg",
}
const RANDOM_VIRTUAL_COGS: Dictionary[String, String] = {
	"res://mods-unpacked/MarioSpore-TTCCpack/music_tracks/LB_office_encntr_a.ogg" : "res://mods-unpacked/MarioSpore-TTCCpack/music_tracks/LB_office_encntr_a_virtual.ogg",
	"res://mods-unpacked/MarioSpore-TTCCpack/music_tracks/LB_office_encntr_b.ogg" : "res://mods-unpacked/MarioSpore-TTCCpack/music_tracks/LB_office_encntr_b_virtual.ogg",
	"res://mods-unpacked/MarioSpore-TTCCpack/music_tracks/LB_office_encntr_c.ogg" : "res://mods-unpacked/MarioSpore-TTCCpack/music_tracks/LB_office_encntr_c_virtual.ogg",
}
const RANDOM_GOLF_MUSIC: Dictionary[String, String] = {
	"res://mods-unpacked/MarioSpore-TTCCpack/music_tracks/BB_club_silver.ogg" : "res://mods-unpacked/MarioSpore-TTCCpack/music_tracks/BB_club_silver_encntr.ogg",
	"res://mods-unpacked/MarioSpore-TTCCpack/music_tracks/BB_club_gold.ogg" : "res://mods-unpacked/MarioSpore-TTCCpack/music_tracks/BB_club_gold_encntr.ogg",
	"res://mods-unpacked/MarioSpore-TTCCpack/music_tracks/BB_club_diamond.ogg" : "res://mods-unpacked/MarioSpore-TTCCpack/music_tracks/BB_club_diamond_encntr.ogg",
}

var mod_dir_path := ""


func _init() -> void:
	mod_dir_path = ModLoaderMod.get_unpacked_dir().path_join(ROOM_LOADER_LOG)

func _ready() -> void:
	AudioManager.s_music_changed.connect(on_music_changed)
	ModLoaderLog.info("Ready!", ROOM_LOADER_LOG)
	Util.s_floor_started.connect(on_floor_started)
	BattleService.s_battle_spawned.connect(cog_battle_started)

func cog_battle_started(battle: BattleNode) -> void:
	if battle.override_intro is VirtualCogIntro:
		virtual_cog_battle(battle.override_intro)

func virtual_cog_battle(intro : VirtualCogIntro) -> void:
	var virtual_cog_music: String = RandomService.array_pick_random('true_random', RANDOM_VIRTUAL_COGS.keys())
	intro.override_music = load(RANDOM_VIRTUAL_COGS[(virtual_cog_music)])

func on_music_changed(new_music : AudioStream, _is_default) -> void:
	if not MUSIC_MAPPINGS.keys().find(new_music.resource_path.get_file()) == -1:
		AudioManager.set_music(get_music_file(MUSIC_MAPPINGS[new_music.resource_path.get_file()]))

func get_music_file(file_name : String) -> AudioStream:
	return load(ModLoaderMod.get_unpacked_dir().path_join(ROOM_LOADER_DIR + "/music_tracks/" + file_name))

func on_floor_started(game_floor: GameFloor) -> void:
	var floor_variant: FloorVariant = game_floor.floor_variant
	floor_variant.floor_type = floor_variant.floor_type.duplicate()
	if floor_variant.floor_name.to_lower().contains("factory"):
		on_factory_entered(floor_variant)
	if floor_variant.floor_name.to_lower().contains("mint"):
		on_mint_entered(floor_variant)
	if floor_variant.floor_name.to_lower().contains("office"):
		on_office_entered(floor_variant)
	if floor_variant.floor_name.to_lower().contains("golf"):
		on_golf_entered(floor_variant)

func on_factory_entered(floor_variant: FloorVariant) -> void:
	var factory_facility_music: String = RandomService.array_pick_random('true_random', RANDOM_FACTORY_MUSIC.keys())
	var factory_battle_music: String = RANDOM_FACTORY_MUSIC[factory_facility_music]
	floor_variant.floor_type.background_music = [load(factory_facility_music)]
	floor_variant.floor_type.battle_music = load(factory_battle_music)

func on_mint_entered(floor_variant: FloorVariant) -> void:
	var mint_facility_music: String = RandomService.array_pick_random('true_random', RANDOM_MINT_MUSIC.keys())
	var mint_battle_music: String = RANDOM_MINT_MUSIC[mint_facility_music]
	floor_variant.floor_type.background_music = [load(mint_facility_music)]
	floor_variant.floor_type.battle_music = load(mint_battle_music)
	
func on_office_entered(floor_variant: FloorVariant) -> void:
	var office_facility_music: String = RandomService.array_pick_random('true_random', RANDOM_OFFICE_MUSIC.keys())
	var office_battle_music: String = RANDOM_OFFICE_MUSIC[office_facility_music]
	floor_variant.floor_type.background_music = [load(office_facility_music)]
	floor_variant.floor_type.battle_music = load(office_battle_music)
	
func on_golf_entered(floor_variant: FloorVariant) -> void:
	var golf_facility_music: String = RandomService.array_pick_random('true_random', RANDOM_GOLF_MUSIC.keys())
	var golf_battle_music: String = RANDOM_GOLF_MUSIC[golf_facility_music]
	floor_variant.floor_type.background_music = [load(golf_facility_music)]
	floor_variant.floor_type.battle_music = load(golf_battle_music)
