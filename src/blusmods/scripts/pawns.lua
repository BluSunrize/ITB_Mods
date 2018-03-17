--AddMechAnimation("MechDesert", "units/player/mech_desert.png", -24, -14)

----Mechs----
Blu_BoxerMech = {
	Name = "Little Mech",
	Class = "Prime",
	Health = 2,
	MoveSpeed = 3,
	Image = "MechBoxer",
	ImageOffset = 4,
	SkillList = { "Blu_Uppercut" },
	--SkillList = { "Prime_Spear" },
	SoundLocation = "/mech/prime/punch_mech/",
	DefaultTeam = TEAM_PLAYER,
	ImpactMaterial = IMPACT_METAL,
	Massive = true
}
AddPawn("Blu_BoxerMech")

ANIMS.MechBoxer =		ANIMS.MechUnit:new{ Image = "units/player/mech_boxer.png", PosX = -17, PosY = -2 }
ANIMS.MechBoxera =		ANIMS.MechUnit:new{ Image = "units/player/mech_boxer_a.png", PosX = -17, PosY = -2, NumFrames = 4 }
ANIMS.MechBoxerw =		ANIMS.MechUnit:new{ Image = "units/player/mech_boxer_w.png", PosX = -17, PosY = 8 }
ANIMS.MechBoxer_broken = 	ANIMS.MechUnit:new{ Image = "units/player/mech_boxer_broken.png", PosX = -17, PosY = -2 }
ANIMS.MechBoxerw_broken = 	ANIMS.MechUnit:new{ Image = "units/player/mech_boxer_w_broken.png", PosX = -14, PosY = 6 }
ANIMS.MechBoxer_ns = 		ANIMS.MechIcon:new{ Image = "units/player/mech_boxer_ns.png" }

Blu_NomadMech = {
	Name = "Nomad Mech",
	Class = "Science",
	Health = 3,
	MoveSpeed = 3,
	Image = "MechDesert",
	ImageOffset = 4,
	SkillList = { "Prime_Spear" },
	SoundLocation = "/mech/prime/punch_mech/",
	DefaultTeam = TEAM_PLAYER,
	ImpactMaterial = IMPACT_METAL,
	Massive = true
}
AddPawn("Blu_NomadMech")

ANIMS.MechDesert = 		ANIMS.MechUnit:new{ Image = "units/player/mech_desert.png", PosX = -24, PosY = -14}
ANIMS.MechDeserta = 	ANIMS.MechUnit:new{ Image = "units/player/mech_desert_a.png", PosX = -25, PosY = -14, NumFrames = 4 }
ANIMS.MechDesertw = 	ANIMS.MechUnit:new{ Image = "units/player/mech_desert_w.png", PosX = -19, PosY = 1 }
ANIMS.MechDesert_broken = 	ANIMS.MechUnit:new{ Image = "units/player/mech_desert_broken.png", PosX = -22, PosY = -10 }
ANIMS.MechDesertw_broken = 	ANIMS.MechUnit:new{ Image = "units/player/mech_desert_w_broken.png", PosX = -19, PosY = 2 }
ANIMS.MechDesert_ns = 		ANIMS.MechIcon:new{ Image = "units/player/mech_desert_ns.png" }

Blu_WolfMech = {
	Name = "Wolf Mech",
	Class = "Brute",
	Health = 2,
	MoveSpeed = 4,
	Image = "MechWolf",
	ImageOffset = 4,
	--SkillList = { "Brute_Sniper" },
	SkillList = { "Brute_Sniper" , "Blu_Overload" },
	SoundLocation = "/mech/prime/rock_mech/",
	DefaultTeam = TEAM_PLAYER,
	ImpactMaterial = IMPACT_METAL,
	Massive = true
}
AddPawn("Blu_WolfMech")

ANIMS.MechWolf =		ANIMS.MechUnit:new{ Image = "units/player/mech_wolf.png", PosX = -17, PosY = 0 }
ANIMS.MechWolfa =		ANIMS.MechUnit:new{ Image = "units/player/mech_wolf_a.png", PosX = -17, PosY = 0, NumFrames = 4 }
ANIMS.MechWolfw =		ANIMS.MechUnit:new{ Image = "units/player/mech_wolf_w.png", PosX = -19, PosY = 10 }
ANIMS.MechWolf_broken = 	ANIMS.MechUnit:new{ Image = "units/player/mech_wolf_broken.png", PosX = -17, PosY = 0 }
ANIMS.MechWolfw_broken = 	ANIMS.MechUnit:new{ Image = "units/player/mech_wolf_w_broken.png", PosX = -19, PosY = 8 }
ANIMS.MechWolf_ns = 		ANIMS.MechIcon:new{ Image = "units/player/mech_wolf_ns.png" }
