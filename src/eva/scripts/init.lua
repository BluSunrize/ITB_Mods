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

local changedAssets = {
	"ui/corps/archive",
	"ui/corps/archive_small",
	"ui/corps/rust",
	"ui/corps/rust_small",

	"portraits/ceo/ceo_archive",
	"portraits/ceo/ceo_rst",
	"portraits/pilots/back_1",
	"portraits/pilots/back_2",
	"portraits/pilots/Pilot_Artificial",
	"portraits/pilots/Pilot_Artificial_2"
}


local function init(self)
	for i, asset in ipairs(changedAssets) do
		modApi:appendAsset("img/" .. asset .. ".png", self.resourcePath .. "/img/" .. asset .. ".png")
	end

end

local function load(self, options, version)
	for key,value in ipairs(require(self.scriptPath .. "texOverride")) do
		modApi:overwriteText(key, value)
	end
end

return {
	id = "Blu_Evangelion",
	name = "Evangelion Conversion",
	version = "0.1.0",
	requirements = {}, --Not a list of mods needed for our mod to function, but rather the mods that we need to load before ours to maintain compability
	init = init,
	load = load,
}