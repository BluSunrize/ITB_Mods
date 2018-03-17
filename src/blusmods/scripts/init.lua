local function addMechSprites(self, name)
	modApi:appendAsset("img/units/player/mech_" .. name .. ".png", self.resourcePath .. "/img/units/mech_" .. name .. ".png")
	modApi:appendAsset("img/units/player/mech_" .. name .. "_a.png", self.resourcePath .. "/img/units/mech_" .. name .. "_a.png")
	modApi:appendAsset("img/units/player/mech_" .. name .. "_broken.png", self.resourcePath .. "/img/units/mech_" .. name .. "_broken.png")
	modApi:appendAsset("img/units/player/mech_" .. name .. "_h.png", self.resourcePath .. "/img/units/mech_" .. name .. "_h.png")
	modApi:appendAsset("img/units/player/mech_" .. name .. "_ns.png", self.resourcePath .. "/img/units/mech_" .. name .. "_ns.png")
	modApi:appendAsset("img/units/player/mech_" .. name .. "_w.png", self.resourcePath .. "/img/units/mech_" .. name .. "_w.png")
	modApi:appendAsset("img/units/player/mech_" .. name .. "_w_broken.png", self.resourcePath .. "/img/units/mech_" .. name .. "_w_broken.png")
end

local function addWeaponSprite(self, name)
	modApi:appendAsset("img/weapons/" .. name .. ".png", self.resourcePath .. "/img/weapons/" .. name .. ".png")
end



local function init(self)
	modApi:appendAsset("img/ui/corps/archive.png", self.resourcePath .. "/img/ui/corps/archive.png")
	modApi:appendAsset("img/ui/corps/archive_small.png", self.resourcePath .. "/img/ui/corps/archive_small.png")
	
	addMechSprites(self, "boxer")
	addMechSprites(self, "desert")
	addMechSprites(self, "wolf")

	addWeaponSprite(self, "blu_overload")

	modApi:addWeapon_Texts(require(self.scriptPath .. "text_weapons"))
	require(self.scriptPath .. "weapons")
	require(self.scriptPath .. "pawns")
end

local function load(self, options, version)

	modApi:addSquad(SQUAD_RUST_A, { "Desert Nomads", "Blu_BoxerMech", "Blu_WolfMech", "PulseMech" })
	modApi:overwriteText("TipTitle_Rust_A", "Desert Nomads")
	modApi:overwriteText("TipText_Rust_A", "A set of hardened mechs, molded by their training in the R.S.T. deserts.")
end

return {
	id = "Blu_DesertNomads",
	name = "Desert Nomads",
	version = "0.7.0",
	requirements = {}, --Not a list of mods needed for our mod to function, but rather the mods that we need to load before ours to maintain compability
	init = init,
	load = load,
}