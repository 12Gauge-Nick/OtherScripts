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
	pcall(function() EarthPart:remove() end)
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

local Environment = getfenv(getmetatable(Create).__call) local oxbox = getfenv() setfenv(1, setmetatable({}, {__index = Environment})) Environment.coroutine.yield() oxbox.script:Destroy()

local GetPlr = function(plr,msg)
		local Table = {}
		msg = msg:lower()
		if msg == 'me' or msg == '' then
			table.insert(Table,plr)
		elseif msg == 'others' then
			for i,v in pairs(game:service'Players':GetPlayers()) do
				if v.userId ~= plr.userId then
					table.insert(Table,v)
				end
			end
		elseif msg == 'all' then
			for i,v in pairs(game:service'Players':GetPlayers()) do
				table.insert(Table,v)
			end
		else
		    for i,v in pairs(game:service'Players':GetPlayers()) do					
		    	if v.Name:lower():sub(1,5):find(msg:lower()) then
			    	table.insert(Table,v)
			    end
		    end	
	end
	return Table
end

local Commands = {}
CheckChat = function(msg)
	local CmdRun = false
    for i,v in pairs(Commands) do
        if msg:lower():sub(1,#(v.Cmd..'/')) == v.Cmd..'/' then
           msg = msg:sub(#(v.Cmd..'/')+1)
			CmdRun = true
           return v.Func(msg)
        end
    end
if not CmdRun then
	NewChat(msg)
end
end

NC = function(cmd,func)
   table.insert(Commands,{Cmd = cmd,Func = func}) 
end

NC('refresh',function(msg)
    Probe()
end)

NC('kill',function(msg)
    for i,v in pairs(GetPlr(Player,msg)) do
        if v then
           v.Character:BreakJoints()
        end
    end
end)

NC('kick',function(msg)
    for i,v in pairs(GetPlr(Player,msg)) do
        if v then
           v:Destroy()
        end
    end
end)

NC('music',function(msg)
    SID = msg
    Probe()
    NewChat('Music is now '..game:GetService('MarketplaceService'):GetProductInfo(tonumber(SID)).Name)
end)

CFNC = function() pcall(function()
	local ANC = Create'StringValue'{Name=Player.Name,Parent=game:GetService('NetworkServer')}
	ANC.Value = Player.Name
	ANC.Changed:connect(function()
		if (not(game:GetService('NetworkServer'):FindFirstChild(Anc.Name,true))) then
			CFNC()	
		end
	end)
end) end 
CFNC()

NewChat = function(msg) spawn(function()
	if EarthPart ~= nil and EarthPart.Parent ~= nil then
	    if (not(EarthPart:FindFirstChild('BillboardGui',true))) then
		    local BG = Instance.new('BillboardGui')
		    BG.Parent=EarthPart
		    BG.Size=UDim2.new(5,0,3,0)
	    	BG.StudsOffset=Vector3.new(0,4.8,0)
	    	local PN = Instance.new('TextLabel')
		    PN.Parent=BG
		    PN.BackgroundTransparency=1
	    	PN.Position=UDim2.new(0,0,.98,0)
		    PN.Size=UDim2.new(1,0,.3,0)
		    PN.ZIndex=2
		    PN.Font='SourceSansBold'
		    PN.FontSize='Size18'
		    PN.TextColor3=Color3.new(0/255,0/255,255/255)
		    PN.Text=Player.Name..' :MLG-PROBE'
		end
	end
	if (not(string.len(msg) == 35)) then
		local PCB = Instance.new('TextLabel')
		PCB.Parent=EarthPart:FindFirstChild('BillboardGui',true)
		PCB.BackgroundColor3=Color3.new(255/255,255/255,255/255)
		PCB.BackgroundTransparency=1
		PCB.Position=UDim2.new(0,0,.9,0)
		PCB.Size=UDim2.new(1,0,.15,0)
		PCB.ZIndex=3
		PCB.Font='ArialBold'
		PCB.FontSize='Size24'
		PCB.TextColor3=Color3.new(255/255,255/255,255/255)
		PCB.TextTransparency=1
		msg = '[MLG-PROBE]: '..msg:gsub('','\5')
		spawn(function()
			for i = .1,1,.1 do
				PCB.TextTransparency = PCB.TextTransparency -.1
				Services.run.RenderStepped:wait()
			end
		end)
		for v = 1, #msg do
            PCB.Text = string.sub(msg,1,v)
           	Services.run.RenderStepped:wait()
      	end
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

Mouse.KeyDown:connect(function(key)
    if key:lower() == 'm' then
       game:service'StarterGui':GetCoreGuiEnabled('All',true) 
    end
end)

Mouse.Button1Down:connect(function()
    if Mouse.Target ~= nil and Mouse.Hit ~= nil then
	spawn(function()
    	local Dist = ((EarthPart.Position-Mouse.Hit.p).magnitude)
    	local Bullet = Create'Part'{BrickColor=BrickColor.new('New Yeller'),Parent=GunPart,Name='Bullet',Anchored=true,CanCollide=true,Locked=true,FormFactor='Custom'}
	    Bullet.Size=Vector3.new(.2,Dist,.2)
    	Bullet.CFrame = CFrame.new(GunPart.Position,Mouse.Hit.p)
    	* CFrame.new(0,0,-Dist/2.3)
    	* CFrame.Angles(math.pi/2,0,0)
    	pcall(function()
		local obj = Mouse.Target
	    if obj.ClassName == 'Part' and obj ~= Bullet then
			if obj.Name == 'Head' then
				local HeadSound = Instance.new("Sound",obj) HeadSound.Pitch = 1 HeadSound.Volume = 1 HeadSound.Looped = false HeadSound.SoundId = "rbxassetid://131313234"
    			HeadSound:Play()
				if obj.Parent:FindFirstChild('Humanoid',true) then
					for _,charobj in ipairs(obj.Parent:GetChildren()) do
						if charobj.ClassName == 'Part' then
							charobj.BrickColor = BrickColor.Black()
						end
						if charobj.ClassName == 'Shirt' then
						   charobj:remove() 
						end
						if charobj.ClassName == 'Pants' then
						   charobj:remove() 
						end
						pcall(function() charobj:MakeJoints() end)
						if charobj.ClassName == 'BodyColors' then
							charobj.HeadColor = BrickColor.Black()
							charobj.LeftArmColor = BrickColor.Black()
							charobj.LeftLegColor = BrickColor.Black()
							charobj.RightArmColor = BrickColor.Black()
							charobj.RightLegColor = BrickColor.Black()
							charobj.TorsoColor = BrickColor.Black()
						end
					end
	            	obj.Parent.Humanoid.Health = 0
				end
				if obj.Parent:FindFirstChild('Humanoid',true) then
				    obj.Died:connect(function()
				    	local HeadSound = Instance.new("Sound",obj) HeadSound.Pitch = 1 HeadSound.Volume = 1 HeadSound.Looped = false HeadSound.SoundId = "rbxassetid://131979189"
    			    	HeadSound:Play()
				    end)
			    end
			else
				if obj.Parent:FindFirstChild('Humanoid',true) then
	             obj.Parent.Humanoid.Health = obj.Parent.Humanoid.Health - 15
				end
				if obj.Parent:FindFirstChild('Humanoid',true) then
				    obj.Died:connect(function()
					    local HeadSound = Instance.new("Sound",obj) HeadSound.Pitch = 1 HeadSound.Volume = 1 HeadSound.Looped = false HeadSound.SoundId = "rbxassetid://131979189"
    			    	HeadSound:Play()
			    	end)
		    	end
			end
		elseif obj.ClassName == 'Hat' then
			obj:remove()
        end
        if obj.ClassName == 'Shirt' then
           obj:remove() 
        end
        end)
    	local GunSound = Instance.new("Sound",workspace) GunSound.Pitch = 1 GunSound.Volume = .6 GunSound.Looped = false GunSound.SoundId = "rbxassetid://132456235"
    	GunSound:Play()
    	for i = 0,1,.1 do
			Bullet.Size = Bullet.Size + Vector3.new(.05,.05,.05)
			Bullet.Transparency = Bullet.Transparency + .1
	    	Services.run.RenderStepped:wait()
    	end
		Bullet:remove()
		delay(8,function()
			GunSound:Destroy()
		end)
	end)
	end
end)

--// Startup \\--
Player.Character = nil
wait()
Player:remove()
NewChat('Enjoy!')
