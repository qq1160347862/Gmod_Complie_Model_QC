--Add Playermodel
player_manager.AddValidModel( "character", "models/groups/character/pm/character.mdl" )                         --PM模型
player_manager.AddValidHands( "character", "models/groups/character/arms/character_arms.mdl", 0, "00000000" )      --PM手模


local Category = "groups"                                                                        --NPC MOD分类

local NPC = 
{
	Name = "character(Friendly)",                                                            --友好NPC名字
	Class = "npc_citizen", 
	Health = "100",                                                                    --NPC血量
	KeyValues = { citizentype = 4 }, 
	Model = "models/groups/character/npc/character.mdl",                                                  --友好NPC模型
	Weapons = { "weapon_ar2","weapon_smg1"},                                           --NPC出生自带武器
	Category = Category
}

list.Set( "NPC", "character_friendly", NPC )

local NPC =
{
	Name = "character(Enemy)",                                                                --敌人NPC名字
	Class = "npc_combine_s",
	Health = "100",
	Numgrenades = "4",
	Model = "models/groups/character/npc/character.mdl",                                                  --敌人NPC模型
	Weapons = { "weapon_ar2","weapon_smg1"},
	Category = Category
}

list.Set( "NPC", "character_enemy", NPC )
