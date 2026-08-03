local enable_pm_bodygroup_drop = CreateConVar("yl_pm_tactical_lumine_vp9_mag_bgd", "0", {FCVAR_ARCHIVE}, "PM模型掉落") -- 是否开启PM模型掉落身体部件
local enable_npc_bodygroup_drop = CreateConVar("yl_npc_tactical_lumine_vp9_mag_bgd", "0", {FCVAR_ARCHIVE}, "NPC模型掉落") -- 是否开启NPC模型掉落身体部件

local targetBodygroupName = "vp9_mag"
local BODYGROUP_ON = 0
local BODYGROUP_OFF = 1
local targetModelPlayer = "models/elemental_warfare/tactical_lumine/pm/tactical_lumine.mdl"
local targetModelNPC = "models/elemental_warfare/tactical_lumine/npc/tactical_lumine.mdl"
local dropModel = {
    "models/elemental_warfare/tactical_lumine/props/vp9_mag.mdl",
    "models/elemental_warfare/tactical_lumine/props/vp9_mag.mdl",
    "models/elemental_warfare/tactical_lumine/props/vp9_mag.mdl",
    "models/elemental_warfare/tactical_lumine/props/vp9_mag.mdl"
}
-- 同步Bodygroup状态到所有客户端
local function BpStateSync(ent, bgID)
    if IsValid(ent) then
        net.Start("BpStateSync_tactical_lumine_vp9_mag")
            net.WriteEntity(ent)
            net.WriteUInt(bgID, 8)
        net.Broadcast()
    else
        print("Error: Invalid entity in BpStateSync.")
    end
end

-- 同步创建物体到所有客户端
local function ObjCreatedSync(models, pos, ang)
    net.Start("ObjCreatedSync_tactical_lumine_vp9_mag")
        net.WriteString(models)
        net.WriteVector(pos)
        net.WriteAngle(ang)
    net.Broadcast()
end

-- 生成掉落物体
local function createDrop(drops, models, pos, ang)    
    
    if IsValid(drops[1]) then
        for i, model in ipairs(models) do
            drops[i]:SetModel(model)
            drops[i]:SetPos(pos)
            drops[i]:SetAngles(ang)
            drops[i]:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
            drops[i]:Spawn()

            local phys = drops[i]:GetPhysicsObject()        
            -- print("Creating drop:", model)
            local random_num = math.random(0, 5)
            local symbol = math.random(0, 3)
            local phy_num = random_num
            if symbol > 1 then
                phy_num = -random_num
            end
            -- print("symbol:", symbol)
            -- print("phy_num:", phy_num)
            if IsValid(phys) then
                phys:ApplyForceCenter(Vector(i*0.5*phy_num, i*0.5*phy_num, 4*i) * 100)
            else
                print("Error: Invalid physics object in createDrop.")
            end

            timer.Simple(60, function()
                if IsValid(drops[i]) then
                    drops[i]:Remove()
                end
            end) 
        end
    else
        print("Error: Failed to create drop entity.")
    end
end

-- 物体掉落函数
local function dropBodyPart(ent)   
    if not IsValid(ent) then
        print("Error: Invalid entity in dropBodyPart.")
        return
    end

    -- 验证实体
    local targetModel = ent:IsPlayer() and targetModelPlayer or targetModelNPC    
    if ent:GetModel() ~= targetModel then
        return
    end

    local targetBodygroupIndex, targetBodygroupValue = 0, BODYGROUP_OFF
    for i = 0, ent:GetNumBodyGroups() - 1 do
        if ent:GetBodygroupName(i) == targetBodygroupName then
            targetBodygroupIndex, targetBodygroupValue = i, ent:GetBodygroup(i)
            break
        end
    end

    if targetBodygroupValue == BODYGROUP_ON then
        ent:SetBodygroup(targetBodygroupIndex, BODYGROUP_OFF)
        BpStateSync(ent, targetBodygroupIndex)

        local boneID = ent:LookupBone("ValveBiped.Bip01_Head1")
        if not boneID then
            print("Error: Bone not found in dropBodyPart.")
            return
        end

        local pos, ang = ent:GetBonePosition(boneID)
        local drop1 = ents.Create("prop_physics")
        local drop2 = ents.Create("prop_physics")
        local drop3 = ents.Create("prop_physics")
        local drop4 = ents.Create("prop_physics")
        local drops = {
            drop1,
            drop2,
            drop3,
            drop4
        }
        if IsValid(drop1) then
            -- ObjCreatedSync(dropModel, pos, ang)
            createDrop(drops, dropModel, pos, ang)
        else
            print("Error: Failed to create drop entity.")
        end
    end
end

if SERVER then
    util.AddNetworkString("BpStateSync_tactical_lumine_vp9_mag")
    util.AddNetworkString("ObjCreatedSync_tactical_lumine_vp9_mag")

    -- 注册实体死亡事件
    hook.Add("PlayerDeath", "DropBodyParts_tactical_lumine_vp9_mag", function(ply)
        if enable_pm_bodygroup_drop:GetBool() then
            dropBodyPart(ply)
        end
    end)

    -- 注册NPC死亡事件
    hook.Add("OnNPCKilled", "DropNPCBodyParts_tactical_lumine_vp9_mag", function(npc)
        if enable_npc_bodygroup_drop:GetBool() then
            dropBodyPart(npc)
        end
    end)
end

if CLIENT then
    net.Receive("BpStateSync_tactical_lumine_vp9_mag", function()
        local ent = net.ReadEntity()
        local bgID = net.ReadUInt(8)
        if IsValid(ent) then
            ent:SetBodygroup(bgID, BODYGROUP_OFF)
        else
            print("Error: Received invalid entity in BpStateSync.")
        end
    end)

    net.Receive("ObjCreatedSync_tactical_lumine_vp9_mag", function()
        local models = net.ReadString()
        local pos = net.ReadVector()
        local ang = net.ReadAngle()

        local drop1 = ents.Create("prop_physics")
        local drop2 = ents.Create("prop_physics")
        local drop3 = ents.Create("prop_physics")
        local drop4 = ents.Create("prop_physics")
        local drops = {
            drop1,
            drop2,
            drop3,
            drop4
        }
        if IsValid(drop1) then
            createDrop(drops, models, pos, ang)
        else
            print("Error: Received invalid entity in ObjCreatedSync.")
        end
    end)
end
