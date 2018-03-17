Blu_Uppercut = Skill:new {
	Class = "Prime",
	Icon = "weapons/prime_punch.png",
	Rarity = 2,
	Explosion = "",
	LaunchSound = "/weapons/titan_fist",
	Damage = 1,
	ThrowRange = 3,
	Push = 1,
	PowerCost = 1,
	Upgrades = 2,
	UpgradeCost = { 2, 1 },
	TipImage = {
		Unit = Point(2, 3),
		Enemy = Point(2, 2),
		Target = Point(2, 2)
	},
}

Blu_Uppercut_A = Blu_Uppercut:new {
	Damage = 2,
}

Blu_Uppercut_B = Blu_Uppercut:new {
	ThrowRange = 4,
}

Blu_Uppercut_AB = Blu_Uppercut:new {
	Damage = 2,
	ThrowRange = 4,
}

function Blu_Uppercut:GetSkillEffect(p1, p2)
	local ret = SkillEffect()
	local direction = GetDirection(p2 - p1)

	local target = p2
	local throw = 0
	while (not Board:IsBlocked(target + DIR_VECTORS[direction], PATH_FLYER)) and (throw < self.ThrowRange) do
		target = target + DIR_VECTORS[direction]
		throw = throw + 1
	end

	ret:AddDamage(SpaceDamage(p2, self.Damage))
	ret:AddBounce(p2, -2)

	local move = PointList()
	move:push_back(p2)
	move:push_back(target)
	ret:AddLeap(move, 0.25)

	ret:AddBounce(target, 2)
	return ret
end


Blu_Overload = Skill:new {
	Class = "Science",
	Icon = "weapons/blu_overload.png",
	Rarity = 3,
	Explosion = "",
	LaunchSound = "/weapons/titan_fist",
	KillBuilding = true,
	ExtendReach = true,
	Range = INT_MAX,
	Damage = DAAMGE_DEATH,
	PowerCost = 2,
	Upgrades = 2,
	UpgradeCost = { 2, 2 },
	TipImage = {
		Unit = Point(2, 3),
		Building = Point(2, 1),
		Target = Point(2, 1),
		Enemy = Point(3, 1),
		Enemy2 = Point(2, 0),
		Friendly = Point(1, 1)
	},
}

Blu_Overload_A = Blu_Overload:new {
	KillBuilding = false,
}

Blu_Overload_B = Blu_Overload:new {
	ExtendReach = true,
}

Blu_Overload_AB = Blu_Overload:new {
	KillBuilding = false,
	ExtendReach = true,
}

function Blu_Overload:GetTargetArea(point)
	local ret = PointList()

	local board_size = Board:GetSize()
	for i = 0, board_size.x - 1 do
		for j = 0, board_size.y - 1 do
			if Board:IsBuilding(Point(i, j)) then
				ret:push_back(Point(i, j))
			end
		end
	end

	return ret
end

function Blu_Overload:GetSkillEffect(p1, p2)
	local hash = function(point) return point.x + point.y * 10 end
	local explored = { [hash(p2)] = true }

	local ret = SkillEffect()
	local tileDamage = SpaceDamage(p2, DAMAGE_DEATH)
	--	if not self.KillBuilding then
	--		tileDamage.iDamage = 1
	--	end
	ret:AddDamage(tileDamage)
	ret:AddAnimation(p2, "Lightning_Hit")

	for i = DIR_START, DIR_END do
		local neighbour = p2 + DIR_VECTORS[i]
		if Board:IsPawnSpace(neighbour) and (not explored[hash(neighbour)]) then
			explored[hash(neighbour)] = true

			local damage = SpaceDamage(neighbour, DAMAGE_DEATH)
			damage.sAnimation = "Lightning_Attack_" .. i
			ret:AddDamage(damage)
			ret:AddAnimation(neighbour, "Lightning_Hit")

			if self.ExtendReach then
				for j = DIR_START, DIR_END do
					local chain = neighbour + DIR_VECTORS[j]
					if Board:IsPawnSpace(chain) and (not explored[hash(chain)]) then
						explored[hash(chain)] = true
						local chainDamage = SpaceDamage(chain, DAMAGE_DEATH)
						chainDamage.sAnimation = "Lightning_Attack_" .. j
						ret:AddDamage(chainDamage)
						ret:AddAnimation(chain, "Lightning_Hit")
					end
				end
			end
		end
	end

	return ret
end
