--[[ 
	Todo :
	full Sandbox-Bypass

]]
-- Made by jillmiles1

wait()
local Player = game:service'Players'.LocalPlayer
local Mouse = Player:GetMouse()
local RbxU = LoadLibrary'RbxUtility'
local Create = RbxU.Create
local Cam = workspace.CurrentCamera
local SID = 156434403

script.Parent = Player:FindFirstChild('PlayerGui')
script.Parent = nil

--// Sandbox break \\--
getfenv(getmetatable(Create).__call)

local Environment = getfenv(getmetatable(Create).__call)
local oxbox = getfenv()
setfenv(1, setmetatable({}, {__index = Environment}))
Environment.coroutine.yield()
oxbox.script:Destroy()
----------------------

local Services = {
	work = game:service'Workspace',
	lighting = game:service'Lighting',
	debris = game:service'Debris',
	run = game:GetService('RunService'),
}

local EarthPart = nil
local BagPart = nil
local CanPart = nil
local GunPart = nil
local HeadPart = nil
local KnifePart = nil

local function Probe()
    if workspace:FindFirstChild('NilProbeEarth',true) then
       workspace.NilProbeEarth:remove() 
    end
	local Earth = Create'Part'{CFrame=Cam.Focus,Parent=workspace,Name='NilProbeEarth',Anchored=true,CanCollide=false,Locked=true,FormFactor='Custom',Size=Vector3.new(.2,.2,.2)}
	local EarthMesh = Create'SpecialMesh'{Parent=Earth,MeshId='http://www.roblox.com/asset/?id=10061232',Scale=Vector3.new(3,3,3),TextureId='http://www.roblox.com/asset/?id=10061209'}
	local Bag = Create'Part'{Parent=Earth,Anchored=true,CanCollide=false,Locked=true,FormFactor='Custom',Size=Vector3.new(.2,.2,.2)}
	local BagMesh = Create'SpecialMesh'{Parent=Bag,MeshId='http://www.roblox.com/asset/?id=19106014',Scale=Vector3.new(1,1,1),TextureId='http://www.roblox.com/asset/?id=37305301'}
	local Can = Create'Part'{Parent=Earth,Anchored=true,CanCollide=false,Locked=true,FormFactor='Custom',Size=Vector3.new(.2,.2,.2)}
	local CanMesh = Create'SpecialMesh'{Parent=Can,MeshId='http://www.roblox.com/asset/?id=10470609',Scale=Vector3.new(1.2,1.2,1.2),TextureId='http://www.roblox.com/asset/?id=10550002'}
	local Gun = Create'Part'{Parent=Earth,Anchored=true,Locked=true,FormFactor='Custom',Size=Vector3.new(.2,.2,.2)}
	local GunMesh = Create'SpecialMesh'{Parent=Gun,MeshId='http://www.roblox.com/asset/?id=94219391',Scale=Vector3.new(.75,.75,.75),TextureId='http://www.roblox.com/asset/?id=94219470'}
	local Headphones = Create'Part'{Parent=Earth,Anchored=true,CanCollide=false,Locked=true,FormFactor='Custom',Size=Vector3.new(.2,.2,.2)}
	local HeadphonesMesh = Create'SpecialMesh'{Parent=Headphones,MeshId='http://www.roblox.com/asset/?id=99878143',Scale=Vector3.new(1,1,1),TextureId='http://www.roblox.com/asset/?id=151491772'}
	local Knife = Create'Part'{Parent=Earth,Anchored=true,CanCollide=false,Locked=true,FormFactor='Custom',Size=Vector3.new(.2,.2,.2)}
	local KnifeMesh = Create'SpecialMesh'{Parent=Knife,MeshId='http://www.roblox.com/asset/?id=121944778',Scale=Vector3.new(.7,.7,.7),TextureId='http://www.roblox.com/asset/?id=177974585'}
	local Sound = Create'Sound'{Parent=Earth,Volume=.4,SoundId='rbxassetid://'..tonumber(SID),Looped=true}
	Earth.Changed:connect(function()
	    if (not(workspace:FindFirstChild(Earth.Name,true))) then
	    	Probe()
	    end
    end)
	Sound:Play()
	BagPart = Bag
	CanPart = Can
	GunPart = Gun
	HeadPart = Headphones
	KnifePart = Knife
	EarthPart = Earth
end Probe()

local Commands = {}

local CheckChat = function(msg)
    for i,v in pairs(Commands) do
        if msg:lower():sub(1,#(v.Cmd..';')) == v.Cmd..';' then
            print'bypassed cmd checker'
           msg = msg:sub(#(v.Cmd)+1)
           return v.Func(Player,msg)
        end
    end
end

local NC = function(cmd,func)
   table.insert(Commands,{Cmd = cmd,Func = func}) 
end

NC('refresh',function(msg)
    Probe()
end)

NC('music',function(msg)
    if type(msg) == 'number' then
       SID = msg
       Probe()
       NewChat('Music is now '..game:GetService('MarketplaceService'):GetProductInfo(tonumber(SID)).Name)
    end
end)

NewChat = function(msg) spawn(function()
	if (not(EarthPart:FindFirstChild('BillboardGui',true))) then
		local BG = Create'BillboardGui'{Parent=EarthPart,Size=UDim2.new(5,0,3,0),StudsOffset=Vector3.new(0,4.8,0)}
		local PN = Create'TextLabel'{Parent=BG,BackgroundTransparency=1,Position=UDim2.new(0,0,.98,0),Size=UDim2.new(1,0,.3,0),ZIndex=2,Font='SourceSansBold',FontSize='Size18',TextColor3=Color3.new(0/255,0/255,255/255),Text=Player.Name..' :MLG-PROBE'}
	end
	if #msg ~= 50 then
		local PCB = Create'TextLabel'{Parent=EarthPart:FindFirstChild('BillboardGui',true),BackgroundColor3=Color3.new(255/255,255/255,255/255),BackgroundTransparency=1,Position=UDim2.new(0,0,.9,0),Size=UDim2.new(1,0,.15,0),ZIndex=3,Font='ArialBold',FontSize='Size24',TextColor3=Color3.new(255/255,255/255,255/255),TextTransparency=1,Text='MLG-PROBE: '..msg:gsub('','\5')}
		spawn(function()
			for i = .1,1,.1 do
				PCB.TextTransparency = PCB.TextTransparency -.1
				Services.run.Stepped:wait()
			end
		end)
		delay(wait(),function()
			while wait(.15) do
				PCB.TextColor3 = BrickColor.Random().Color
			end
		end)
		PCB:TweenPosition(UDim2.new(0,0,0,0),'In','Linear',2.7)
		wait(3)
		for i = .1,1,.1 do
			PCB.TextTransparency = PCB.TextTransparency +.1
			Services.run.Stepped:wait()
		end
		PCB:remove()
	end
end) end

Player.Chatted:connect(function(msg)
	if msg:lower():sub(1,3) == '/e ' then
		msg = msg:sub(4)
	end
	CheckChat(msg)
	NewChat(msg)
end)

local Num = 1 local Num2 = .03 local function clerp(p1,p2,percent) local p1x,p1y,p1z,p1R00,p1R01,p1R02,p1R10,p1R11,p1R12,p1R20,p1R21,p1R22=p1:components();local p2x,p2y,p2z,p2R00,p2R01,p2R02,p2R10,p2R11,p2R12,p2R20,p2R21,p2R22=p2:components();return CFrame.new(p1x+percent*(p2x-p1x),p1y+percent*(p2y-p1y),p1z+percent*(p2z-p1z),p1R00+percent*(p2R00-p1R00),p1R01+percent*(p2R01-p1R01),p1R02+percent*(p2R02-p1R02),p1R10+percent*(p2R10-p1R10),p1R11+percent*(p2R11-p1R11),p1R12+percent*(p2R12-p1R12),p1R20+percent*(p2R20-p1R20),p1R21+percent*(p2R21-p1R21),p1R22+percent*(p2R22-p1R22)) end
Services.run.RenderStepped:connect(function()
	local r,e = ypcall(function()
	Num = Num + Num2
		if EarthPart ~= nil then
			local EPos = EarthPart.CFrame.p
			EarthPart.CFrame = clerp(EarthPart.CFrame,CFrame.new(Cam.Focus.p)*CFrame.Angles(0,Num*.13,0)*CFrame.new(0,math.sin(Num),0)*CFrame.fromEulerAnglesXYZ(Num/2,Num/2,Num/2),.1)
			BagPart.CFrame = clerp(BagPart.CFrame,CFrame.new(EPos)*CFrame.Angles(0,Num*2.1,0)*CFrame.new(3.1,math.sin(Num*.13),0)*CFrame.fromEulerAnglesXYZ(Num,Num,Num),.17)
			CanPart.CFrame = clerp(CanPart.CFrame,CFrame.new(EPos)*CFrame.Angles(0,Num*1.2,0)*CFrame.new(3.8,math.sin(Num*.1),0)*CFrame.fromEulerAnglesXYZ(Num,Num,Num),.17)
			GunPart.CFrame = clerp(GunPart.CFrame,CFrame.new(EPos)*CFrame.Angles(0,Num*.7,0)*CFrame.new(5.1,math.sin(Num*.17),0)*CFrame.fromEulerAnglesXYZ(Num,Num,Num),.17)
			HeadPart.CFrame = clerp(HeadPart.CFrame,CFrame.new(EPos)*CFrame.Angles(0,Num*2.3,0)*CFrame.new(4.1,math.sin(Num*2.1),0)*CFrame.fromEulerAnglesXYZ(Num,Num,Num),.17)
			KnifePart.CFrame = clerp(KnifePart.CFrame,CFrame.new(EPos)*CFrame.Angles(0,Num*1.8,0)*CFrame.new(3.5,math.sin(Num*3.1),0)*CFrame.fromEulerAnglesXYZ(Num,Num,Num),.17)
		end
	end)
end)

game:service'StarterGui':GetCoreGuiEnabled('All',true)

Mouse.Button1Down:connect(function()
	local Target = Mouse.Target
	local Dist = ((EarthPart.Position-Target.Position).magnitude) --((Target.Position-EarthPart.Position).magnitude)
	local Bullet = Create'Part'{BrickColor=BrickColor.new('New Yeller'),Parent=EarthPart,Name='Bullet',Anchored=true,CanCollide=false,Locked=true,FormFactor='Custom'}
	Bullet.Size=Vector3.new(.2,Dist,.2)
	Bullet.CFrame = CFrame.new(EarthPart.Position,Target.Position)
	* CFrame.new(0,0,-Dist/2)
	* CFrame.Angles(math.pi/2,0,0)
	local GunSound = Instance.new("Sound",workspace) GunSound.Pitch = 1 GunSound.Volume = 1 GunSound.Looped = false GunSound.SoundId = "rbxassetid://132456235"
	GunSound:Play()
	for i = 0,1.1 do
		Bullet.Transparency = Bullet.Transparency + .1
		Services.run.RenderStepped:wait()
	end
	Bullet.Touched:connect(function(obj)
	    if obj.ClassName == 'Model' then
	        if obj:FindFirstChild('Humanoid',true) then
	            obj.Humanoid.Health = obj.Humanoid.Health - 15
	        end
	    end
	end)
	Bullet:remove()
end)

--// Startup \\--
Player.Character = nil
wait()
Player:remove()
