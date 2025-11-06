local P=game:GetService("Players")
local U=game:GetService("UserInputService")
local T=game:GetService("TweenService")
local R=game:GetService("RunService")
local S={};local Panel={};local Paint={}
local lp=P.LocalPlayer;local bp=lp.Backpack;local pg=lp.PlayerGui;local m=lp:GetMouse()
local H=nil;local HF=Instance.new("Model",workspace);local UI=Instance.new("ScreenGui",pg)
local isPC=false;local md=false;local pcnt=0
local C={Paint={dkdkddidk={},reklfklfklnkl=nil,Enabled=false},PaintMode={Enabled=false,Color=nil,ififadfdadii=nil}}

local function gj4rlk1()
	local ch=lp.Character
	if ch then return ch:FindFirstChild("PaintBucket") or bp:FindFirstChild("PaintBucket") end
end

function Paint:gj4rl145(p)
	local b=gj4rlk1(); local col=C.PaintMode.Color
	if b and p and col then
		if math.round(p.Color.R*255)==math.round(col.R*255) and math.round(p.Color.G*255)==math.round(col.G*255) and math.round(p.Color.B*255)==math.round(col.B*255) then return end
		pcnt=pcnt+1
		b.Parent=lp.Character
		b:WaitForChild("Remotes"):WaitForChild("ServerControls"):InvokeServer("PaintPart",{Part=p,Color=col},"Peace")
	end
end

function Paint:gj4rl14t(p)
	for _,t in pairs(C.Paint.dkdkddidk) do if t.Province==p then return end end
	local o=p:Clone()
	o.CanCollide=false;o.CanTouch=false;o.CanQuery=false;o.AudioCanCollide=false
	o.Transparency=10;o.Material=Enum.Material.Glass;o.Anchored=true;o.Parent=HF
	table.insert(C.Paint.dkdkddidk,{Province=p,ProvinceOverlay=o})
end

function Paint:Ungj4rl14t(p)
	local idx
	for i,t in pairs(C.Paint.dkdkddidk) do if t.Province==p then idx=i end end
	if not idx then return end
	C.Paint.dkdkddidk[idx].ProvinceOverlay:Destroy()
	table.remove(C.Paint.dkdkddidk,idx)
end

function Paint:kjkkk() HF:ClearAllChildren();C.Paint.dkdkddidk={} end

function Paint:gj4rl14hh()
	H=Instance.new("Highlight",workspace);H.Adornee=HF;H.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
	H.FillTransparency=0.5;H.FillColor=Color3.fromRGB(255,255,255);H.OutlineColor=Color3.fromRGB(255,255,255)
end

function S:gtfgj5t()
	local s=Instance.new("ImageLabel");s.AnchorPoint=Vector2.new(0.5,0.5);s.BackgroundTransparency=1
	s.Position=UDim2.new(0.5,0,0.5,0);s.Size=UDim2.new(1,47,1,47);s.Image="rbxassetid://6014261993"
	s.ImageColor3=Color3.fromRGB(0,0,0);s.ImageTransparency=0.5;s.ScaleType=Enum.ScaleType.Slice
	s.SliceCenter=Rect.new(49,49,450,450);return s
end

function S:kjgtkfj(h,f)
	local dragging,om,op
	h.InputBegan:Connect(function(i)
		if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
			dragging=true;om=i.Position;op=f.Position
			i.Changed:Connect(function() if i.UserInputState==Enum.UserInputState.End then dragging=false end end)
		end
	end)
	U.InputChanged:Connect(function(i)
		if dragging then local d=i.Position-om;f.Position=UDim2.new(op.X.Scale,op.X.Offset+d.X,op.Y.Scale,op.Y.Offset+d.Y) end
	end)
end

function S:gj4rlk5(t,siz)
	local holder=Instance.new("Frame",UI);holder.AnchorPoint=Vector2.new(0.5,0.5);holder.BackgroundTransparency=1
	holder.Position=UDim2.new(0.5,0,0.5,0);holder.Size=siz or UDim2.new(0.5,0,0.5,0)
	local c=Instance.new("UISizeConstraint",holder);c.MinSize=Vector2.new(300,200)
	local drop=S:gtfgj5t();drop.Parent=holder
	local mwin=Instance.new("Frame",holder);mwin.AnchorPoint=Vector2.new(0.5,0.5);mwin.BackgroundColor3=Color3.fromRGB(46,46,46)
	mwin.Position=UDim2.new(0.5,0,0.5,0);mwin.Size=UDim2.new(1,0,1,0)
	Instance.new("UICorner",mwin).CornerRadius=UDim.new(0,10);Instance.new("UIStroke",mwin).Color=Color3.fromRGB(100,100,100)
	local top=Instance.new("Frame",mwin);top.BackgroundColor3=Color3.fromRGB(53,53,53);top.Size=UDim2.new(1,0,0,20);top.Name="TopBar"
	Instance.new("UICorner",top).CornerRadius=UDim.new(0,10)
	local corner=Instance.new("Frame",top);corner.AnchorPoint=Vector2.new(0,1);corner.BackgroundColor3=top.BackgroundColor3
	corner.Position=UDim2.new(0,0,1,0);corner.Size=UDim2.new(1,0,0.5,0);corner.BorderSizePixel=0
	local sep=Instance.new("Frame",top);sep.AnchorPoint=Vector2.new(0,1);sep.BackgroundColor3=Color3.fromRGB(34,34,34)
	sep.Position=UDim2.new(0,0,1,0);sep.Size=UDim2.new(1,2,0,1);sep.BorderSizePixel=0
	local close=Instance.new("ImageButton",top);close.AnchorPoint=Vector2.new(1,0);close.BackgroundColor3=Color3.fromRGB(236,105,93)
	close.Position=UDim2.new(1,-5,0,5);close.Size=UDim2.new(0,10,0,10);close.ImageTransparency=1;close.AutoButtonColor=false
	Instance.new("UICorner",close).CornerRadius=UDim.new(1,0)
	local title=Instance.new("TextLabel",top);title.BackgroundTransparency=1;title.Position=UDim2.new(0,5,0,0)
	title.Size=UDim2.new(1,0,1,0);title.Font=Enum.Font.SourceSansBold;title.Text=t or "New Window"
	title.TextColor3=Color3.fromRGB(164,164,164);title.TextSize=12;title.TextXAlignment=Enum.TextXAlignment.Left
	close.MouseButton1Down:Connect(function() holder:Destroy() end)
	return mwin,holder
end

function Panel:kjgtkfj4it()
	C.PaintMode.Enabled=not C.PaintMode.Enabled
	if C.PaintMode.Enabled then Panel.Panel.Visible=false;Panel.PaintScreen.Visible=true;game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack,false)
	else Panel.Panel.Visible=true;Panel.PaintScreen.Visible=false;game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack,true) end
end

function Panel:HideTabs()
	for _,tab in pairs(Panel.Tabs) do
		local a=tab.Button:FindFirstChildWhichIsA("ImageLabel")
		T:Create(a,TweenInfo.new(0.2),{ImageTransparency=1}):Play()
		T:Create(tab.Button,TweenInfo.new(0.2),{ImageTransparency=0}):Play()
		Panel.CurrentTab=nil;tab.Tab.Visible=false
	end
end

function Panel:ShowTab(tab)
	local a=tab.Button:FindFirstChildWhichIsA("ImageLabel");Panel:HideTabs()
	T:Create(a,TweenInfo.new(0.2),{ImageTransparency=0}):Play()
	T:Create(tab.Button,TweenInfo.new(0.2),{ImageTransparency=1}):Play()
	Panel.CurrentTab=tab;tab.Tab.Visible=true
end

function Panel:NewTabStripButton(tab,di,ai)
	local b=Instance.new("ImageButton");b.BackgroundTransparency=1;b.Image=di;b.ImageColor3=Color3.fromRGB(164,164,164)
	local o=Instance.new("ImageLabel",b);o.BackgroundTransparency=1;o.Size=UDim2.new(1,0,1,0);o.ImageTransparency=1;o.Image=ai;o.ImageColor3=Color3.fromRGB(255,255,255)
	local tbl={Button=b,Tab=tab};table.insert(Panel.Tabs,tbl)
	local function en() Panel:ShowTab(tbl) end
	local function dis() Panel:HideTabs();Panel.CurrentTab=nil end
	b.MouseButton1Down:Connect(function() if Panel.CurrentTab==tab then dis() else en() end end)
	return b
end

function Panel:NewTab()
	local t=Instance.new("ScrollingFrame");t.Visible=false;t.BackgroundTransparency=1;t.Size=UDim2.new(1,0,1,0);t.ScrollBarThickness=0
	local p=Instance.new("UIPadding",t);p.PaddingBottom=UDim.new(0,5);p.PaddingLeft=UDim.new(0,5);p.PaddingRight=UDim.new(0,5);p.PaddingTop=UDim.new(0,5)
	return t
end

function Panel:kjgtkfjetewq()
	Panel.Tabs={}
	local main,holder=S:gj4rlk5("Auto Paint Panel PRO")
	Panel.Panel=holder;S:kjgtkfj(main.TopBar,holder)
	local ts=Instance.new("Frame",main);ts.BackgroundColor3=Color3.fromRGB(53,53,53);ts.Position=UDim2.new(0,0,0,20);ts.Size=UDim2.new(0,50,1,-20)
	Instance.new("UICorner",ts).CornerRadius=UDim.new(0,10)
	local cb=Instance.new("Frame",ts);cb.AnchorPoint=Vector2.new(1,0);cb.BackgroundColor3=ts.BackgroundColor3;cb.Position=UDim2.new(1,0,0,0);cb.Size=UDim2.new(0.5,0,1,0);cb.BorderSizePixel=0
	local sep=Instance.new("Frame",ts);sep.AnchorPoint=Vector2.new(1,0);sep.BackgroundColor3=Color3.fromRGB(34,34,34);sep.Position=UDim2.new(1,0,0,0);sep.Size=UDim2.new(0,1,1,0);sep.BorderSizePixel=0
	local tsb=Instance.new("Frame",ts);tsb.BackgroundTransparency=1;tsb.Size=UDim2.new(1,0,1,0)
	local g=Instance.new("UIGridLayout",tsb);g.CellPadding=UDim2.new(0,16,0,16);g.CellSize=UDim2.new(1,0,1,0)
	Instance.new("UIAspectRatioConstraint",g);local pad=Instance.new("UIPadding",tsb);pad.PaddingLeft=UDim.new(0,16);pad.PaddingRight=UDim.new(0,16);pad.PaddingTop=UDim.new(0,16);pad.PaddingBottom=UDim.new(0,16)
	local bb=Instance.new("Frame",main);bb.AnchorPoint=Vector2.new(0,1);bb.BackgroundColor3=Color3.fromRGB(53,53,53);bb.Position=UDim2.new(0,0,1,0);bb.Size=UDim2.new(1,0,0,20)
	Instance.new("UICorner",bb).CornerRadius=UDim.new(0,10);local ch=Instance.new("Frame",bb);ch.BackgroundColor3=bb.BackgroundColor3;ch.Size=UDim2.new(1,0,0.5,0);ch.BorderSizePixel=0
	local sp=Instance.new("Frame",bb);sp.BackgroundColor3=Color3.fromRGB(34,34,34);sp.Position=UDim2.new(0,49,0,0);sp.Size=UDim2.new(1,-50+2,0,1);sp.BorderSizePixel=0
	local psi=Instance.new("TextLabel",bb);psi.BackgroundTransparency=1;psi.Position=UDim2.new(0,-5,0,0);psi.Size=UDim2.new(1,0,1,0);psi.Font=Enum.Font.SourceSans;psi.TextXAlignment=Enum.TextXAlignment.Right
	psi.RichText=true;psi.Text=[[<font color="rgb(70, 255, 145)">0</font> paints/second]];psi.TextColor3=Color3.fromRGB(255,255,255);psi.TextSize=12
	local tabs=Instance.new("Frame",main);tabs.BackgroundTransparency=1;tabs.Position=UDim2.new(0,50,0,20);tabs.Size=UDim2.new(1,-50,1,-40)

	local home=Panel:NewTab();home.Parent=tabs
	local tb=Panel:NewTabStripButton(home,"rbxassetid://106945166786013","rbxassetid://76970145192705")
	home.CanvasSize=UDim2.new(0,0,0,420)
	local bg=Instance.new("ImageLabel",home);bg.BackgroundTransparency=1;bg.Size=UDim2.new(1,0,0,100);bg.Image="rbxassetid://2847346550";bg.ScaleType=Enum.ScaleType.Crop
	Instance.new("UICorner",bg).CornerRadius=UDim.new(0,5)
	local tlt=Instance.new("TextLabel",bg);tlt.AnchorPoint=Vector2.new(0.5,0.5);tlt.BackgroundTransparency=1;tlt.Position=UDim2.new(0.5,0,0.5,0)
	tlt.Size=UDim2.new(1,0,0.4,0);tlt.Font=Enum.Font.SourceSansBold;tlt.Text="What's new";tlt.TextColor3=Color3.fromRGB(255,255,255);tlt.TextScaled=true

	local function newBoard(pos,ttl,desc)
		local f=Instance.new("Frame",home);f.BackgroundColor3=Color3.fromRGB(55,55,55);f.Position=pos;f.Size=UDim2.new(1,-20,0,100)
		Instance.new("UICorner",f).CornerRadius=UDim.new(0,10)
		local T=Instance.new("TextLabel",f);T.BackgroundTransparency=1;T.Position=UDim2.new(0,10,0,10);T.Size=UDim2.new(1,0,0,20);T.Font=Enum.Font.SourceSansBold;T.Text=ttl;T.TextColor3=Color3.fromRGB(255,255,255);T.TextSize=20;T.TextXAlignment=Enum.TextXAlignment.Left
		local D=Instance.new("TextLabel",f);D.BackgroundTransparency=1;D.Position=UDim2.new(0,10,0,35);D.Size=UDim2.new(0.8,0,0,60);D.Font=Enum.Font.SourceSans;D.TextWrapped=true;D.Text=desc;D.TextColor3=Color3.fromRGB(255,255,255);D.TextSize=14;D.TextXAlignment=Enum.TextXAlignment.Left;D.TextYAlignment=Enum.TextYAlignment.Top
	end

	newBoard(UDim2.new(0,10,0,90),"Panel Rework","In order to enhance user experience for our users, we have decided to remake our entire panel. This comes with following new features below.")
	newBoard(UDim2.new(0,10,0,200),"Improved UI","The new more pleasing UI includes professional interface helping you to nagivate around.")
	newBoard(UDim2.new(0,10,0,310),"More Configuration","We have added more control to your panel. This new panel includes new and recycled features.")
	tb.Parent=tsb

	local paint=Panel:NewTab();paint.Parent=tabs
	local pbtn=Panel:NewTabStripButton(paint,"rbxassetid://95674804535574","rbxassetid://71787705362666")
	paint.CanvasSize=UDim2.new(0,0,0,212)
	local list=Instance.new("UIListLayout",paint);list.Padding=UDim.new(0,7)

	local function newPaintDisplay(tit,desc)
		local f=Instance.new("Frame",paint);f.BackgroundColor3=Color3.fromRGB(53,53,53);f.Size=UDim2.new(1,0,0,100)
		Instance.new("UICorner",f).CornerRadius=UDim.new(0,5);local pad=Instance.new("UIPadding",f);pad.PaddingLeft=UDim.new(0,10);pad.PaddingRight=UDim.new(0,10);pad.PaddingTop=UDim.new(0,10);pad.PaddingBottom=UDim.new(0,10)
		local stroke=Instance.new("UIStroke",f);stroke.Color=Color3.fromRGB(75,75,75);stroke.Thickness=1
		local h=Instance.new("TextLabel",f);h.BackgroundTransparency=1;h.Size=UDim2.new(0,200,0,50);h.Font=Enum.Font.SourceSansBold;h.Text=tit;h.TextColor3=Color3.fromRGB(200,200,200);h.TextSize=20;h.TextXAlignment=Enum.TextXAlignment.Left;h.TextYAlignment=Enum.TextYAlignment.Top
		local d=Instance.new("TextLabel",f);d.BackgroundTransparency=1;d.Position=UDim2.new(0,0,0,25);d.Size=UDim2.new(0,200,0,50);d.Font=Enum.Font.SourceSans;d.TextWrapped=true;d.Text=desc;d.TextColor3=Color3.fromRGB(200,200,200);d.TextSize=12;d.TextXAlignment=Enum.TextXAlignment.Left;d.TextYAlignment=Enum.TextYAlignment.Top
		return f
	end

	local ap=newPaintDisplay("Auto Paint","Allows you to enable Auto Paint.")
	local switch=Instance.new("ImageButton",ap);switch.AnchorPoint=Vector2.new(1,0);switch.BackgroundColor3=Color3.fromRGB(89,89,89);switch.Position=UDim2.new(1,0,0,0);switch.Size=UDim2.new(0,40,0,20);switch.AutoButtonColor=false
	Instance.new("UICorner",switch).CornerRadius=UDim.new(1,0)
	local handle=Instance.new("Frame",switch);handle.BackgroundColor3=Color3.fromRGB(255,255,255);handle.Position=UDim2.new(0,3,0,3);handle.Size=UDim2.new(1,-6,1,-6);Instance.new("UICorner",handle).CornerRadius=UDim.new(1,0);Instance.new("UIAspectRatioConstraint",handle)
	local state=Instance.new("TextLabel",ap);state.AnchorPoint=Vector2.new(1,0);state.BackgroundTransparency=1;state.Position=UDim2.new(1,-50,0,0);state.Size=UDim2.new(0,200,0,20);state.Text="OFF";state.TextColor3=Color3.fromRGB(100,100,100);state.TextSize=14;state.Font=Enum.Font.SourceSansBold;state.TextXAlignment=Enum.TextXAlignment.Right

	local modes=Instance.new("Frame",ap);modes.AnchorPoint=Vector2.new(0,1);modes.Position=UDim2.new(0,0,1,0);modes.Size=UDim2.new(1,0,0,30);modes.BackgroundTransparency=1
	local mlay=Instance.new("UIListLayout",modes);mlay.FillDirection=Enum.FillDirection.Horizontal;mlay.Padding=UDim.new(0,5)
	local slow=Instance.new("ImageButton",modes);slow.BackgroundColor3=Color3.fromRGB(89,89,89);slow.Size=UDim2.new(1,0,1,0);slow.ImageTransparency=1;Instance.new("UICorner",slow).CornerRadius=UDim.new(0,5);Instance.new("UIAspectRatioConstraint",slow)
	local sicon=Instance.new("ImageLabel",slow);sicon.AnchorPoint=Vector2.new(0.5,0.5);sicon.Position=UDim2.new(0.5,0,0.5,0);sicon.Size=UDim2.new(0.5,0,0.5,0);sicon.BackgroundTransparency=1;sicon.ImageColor3=Color3.fromRGB(255,255,255);sicon.Image="rbxassetid://73160551535962"
	local safe=Instance.new("ImageButton",modes);safe.BackgroundColor3=Color3.fromRGB(89,89,89);safe.Size=UDim2.new(1,0,1,0);safe.ImageTransparency=1;Instance.new("UICorner",safe).CornerRadius=UDim.new(0,5);Instance.new("UIAspectRatioConstraint",safe)
	local saicon=Instance.new("ImageLabel",safe);saicon.AnchorPoint=Vector2.new(0.5,0.5);saicon.Position=UDim2.new(0.5,0,0.5,0);saicon.Size=UDim2.new(0.5,0,0.5,0);saicon.BackgroundTransparency=1;saicon.ImageColor3=Color3.fromRGB(255,255,255);saicon.Image="rbxassetid://94928722721260"
	local fast=Instance.new("ImageButton",modes);fast.BackgroundColor3=Color3.fromRGB(89,89,89);fast.Size=UDim2.new(1,0,1,0);fast.ImageTransparency=1;Instance.new("UICorner",fast).CornerRadius=UDim.new(0,5);Instance.new("UIAspectRatioConstraint",fast)
	local ficon=Instance.new("ImageLabel",fast);ficon.AnchorPoint=Vector2.new(0.5,0.5);ficon.Position=UDim2.new(0.5,0,0.5,0);ficon.Size=UDim2.new(0.5,0,0.5,0);ficon.BackgroundTransparency=1;ficon.ImageColor3=Color3.fromRGB(255,255,255);ficon.Image="rbxassetid://89824270913211"

	local terr=newPaintDisplay("Territory","Provinces which Auto Paint controls.")
	local bh=Instance.new("Frame",terr);bh.AnchorPoint=Vector2.new(0,1);bh.BackgroundTransparency=1;bh.Position=UDim2.new(0,0,1,0);bh.Size=UDim2.new(1,0,0,30)
	local bl=Instance.new("UIListLayout",bh);bl.FillDirection=Enum.FillDirection.Horizontal;bl.Padding=UDim.new(0,5)
	local manage=Instance.new("ImageButton",bh);manage.BackgroundColor3=Color3.fromRGB(89,89,89);manage.Size=UDim2.new(0,56,1,0);Instance.new("UICorner",manage).CornerRadius=UDim.new(0,10)
	local mt=Instance.new("TextLabel",manage);mt.BackgroundTransparency=1;mt.Size=UDim2.new(1,0,1,0);mt.Font=Enum.Font.SourceSansBold;mt.Text="Manage";mt.TextColor3=Color3.fromRGB(255,255,255);mt.TextSize=14
	local clr=Instance.new("ImageButton",bh);clr.BackgroundColor3=Color3.fromRGB(190,91,91);clr.Size=UDim2.new(0,43,1,0);Instance.new("UICorner",clr).CornerRadius=UDim.new(0,10)
	local ct=Instance.new("TextLabel",clr);ct.BackgroundTransparency=1;ct.Size=UDim2.new(1,0,1,0);ct.Font=Enum.Font.SourceSansBold;ct.Text="Clear";ct.TextColor3=Color3.fromRGB(255,255,255);ct.TextSize=14

	pbtn.Parent=tsb

	local sett=Panel:NewTab();sett.Parent=tabs
	local stbtn=Panel:NewTabStripButton(sett,"rbxassetid://85130108412400","rbxassetid://104272938147796");stbtn.Parent=tsb

	local enabled=false
	switch.MouseButton1Down:Connect(function()
		enabled=not enabled;C.Paint.Enabled=enabled
		if enabled then state.Text="ON";T:Create(state,TweenInfo.new(0.25),{TextColor3=Color3.fromRGB(255,255,255)}):Play()
			T:Create(switch,TweenInfo.new(0.25),{BackgroundColor3=Color3.fromRGB(187,106,255)}):Play()
			T:Create(handle,TweenInfo.new(0.25),{Position=UDim2.new(1,-3,0,3),AnchorPoint=Vector2.new(1,0)}):Play()
		else state.Text="OFF";T:Create(state,TweenInfo.new(0.25),{TextColor3=Color3.fromRGB(100,100,100)}):Play()
			T:Create(switch,TweenInfo.new(0.25),{BackgroundColor3=Color3.fromRGB(89,89,89)}):Play()
			T:Create(handle,TweenInfo.new(0.25),{Position=UDim2.new(0,3,0,3),AnchorPoint=Vector2.new()}):Play() end
	end)

	local mlist={slow,safe,fast}
	local function deactivate()
		for _,b in pairs(mlist) do T:Create(b,TweenInfo.new(0.25),{BackgroundColor3=Color3.fromRGB(89,89,89)}):Play() end
	end
	slow.MouseButton1Down:Connect(function() C.Paint.reklfklfklnkl="Slow";deactivate();T:Create(slow,TweenInfo.new(0.25),{BackgroundColor3=Color3.fromRGB(187,106,255)}):Play() end)
	safe.MouseButton1Down:Connect(function() C.Paint.reklfklfklnkl="Safe";deactivate();T:Create(safe,TweenInfo.new(0.25),{BackgroundColor3=Color3.fromRGB(187,106,255)}):Play() end)
	fast.MouseButton1Down:Connect(function() C.Paint.reklfklfklnkl="Fast";deactivate();T:Create(fast,TweenInfo.new(0.25),{BackgroundColor3=Color3.fromRGB(187,106,255)}):Play() end)

	manage.MouseButton1Down:Connect(function() Panel:kjgtkfj4it() end)
	clr.MouseButton1Down:Connect(function() Paint:kjkkk() end)

	spawn(function() while task.wait(1) do psi.Text=[[<font color="rgb(70, 255, 145)">]]..pcnt..[[</font> paints/second]];pcnt=0 end end)
end

function Panel:kjgtkfj4it1()
	local ps=Instance.new("Frame",UI);Panel.PaintScreen=ps;ps.Visible=false;ps.Size=UDim2.new(1,0,1,0);ps.BackgroundTransparency=1
	local bb=Instance.new("Frame",ps);bb.AnchorPoint=Vector2.new(0.5,1);bb.BackgroundTransparency=1;bb.Position=UDim2.new(0.5,0,1,-10);bb.Size=UDim2.new(0,185,0,50)
	S:gtfgj5t().Parent=bb
	local bh=Instance.new("Frame",bb);bh.AnchorPoint=Vector2.new(0.5,0.5);bh.BackgroundColor3=Color3.fromRGB(53,53,53);bh.Position=UDim2.new(0.5,0,0.5,0);bh.Size=UDim2.new(1,0,1,0)
	Instance.new("UICorner",bh).CornerRadius=UDim.new(0,10)
	local ll=Instance.new("UIListLayout",bh);ll.FillDirection=Enum.FillDirection.Horizontal;ll.HorizontalAlignment=Enum.HorizontalAlignment.Center;ll.Padding=UDim.new(0,5);ll.VerticalAlignment=Enum.VerticalAlignment.Center
	Instance.new("UIStroke",bh).Color=Color3.fromRGB(100,100,100)
	local paintBtn=Instance.new("ImageButton",bh);paintBtn.BackgroundColor3=Color3.fromRGB(89,89,89);paintBtn.Size=UDim2.new(0,40,0,40);Instance.new("UICorner",paintBtn).CornerRadius=UDim.new(0,5);Instance.new("UIAspectRatioConstraint",paintBtn)
	local icon=Instance.new("ImageLabel",paintBtn);icon.AnchorPoint=Vector2.new(0.5,0.5);icon.BackgroundTransparency=1;icon.Position=UDim2.new(0.5,0,0.5,0);icon.Size=UDim2.new(0.7,0,0.7,0);icon.Image="rbxassetid://112771668398323"
	local delBtn=Instance.new("ImageButton",bh);delBtn.BackgroundColor3=Color3.fromRGB(89,89,89);delBtn.Size=UDim2.new(0,40,0,40);Instance.new("UICorner",delBtn).CornerRadius=UDim.new(0,5);Instance.new("UIAspectRatioConstraint",delBtn)
	local dicon=Instance.new("ImageLabel",delBtn);dicon.AnchorPoint=Vector2.new(0.5,0.5);dicon.BackgroundTransparency=1;dicon.Position=UDim2.new(0.5,0,0.5,0);dicon.Size=UDim2.new(0.7,0,0.7,0);dicon.Image="rbxassetid://112771668398323"
	local img=Instance.new("ImageLabel",dicon);img.AnchorPoint=Vector2.new(0.5,0.5);img.Position=UDim2.new(0.5,0,0.5,0);img.BackgroundTransparency=1;img.Size=UDim2.new(1,0,1,0);img.Image="rbxassetid://129597876116697"
	local palBtn=Instance.new("ImageButton",bh);palBtn.BackgroundColor3=Color3.fromRGB(89,89,89);palBtn.Size=UDim2.new(0,40,0,40);Instance.new("UICorner",palBtn).CornerRadius=UDim.new(0,5);Instance.new("UIAspectRatioConstraint",palBtn)
	local picon=Instance.new("ImageLabel",palBtn);picon.AnchorPoint=Vector2.new(0.5,0.5);picon.BackgroundTransparency=1;picon.Position=UDim2.new(0.5,0,0.5,0);picon.Size=UDim2.new(0.6,0,0.6,0);picon.Image="rbxassetid://120110350705900";picon.ImageTransparency=0.25
	local conf=Instance.new("ImageButton",bh);conf.BackgroundColor3=Color3.fromRGB(89,89,89);conf.Size=UDim2.new(0,40,0,40);Instance.new("UICorner",conf).CornerRadius=UDim.new(0,5);Instance.new("UIAspectRatioConstraint",conf)
	local cicon=Instance.new("ImageLabel",conf);cicon.AnchorPoint=Vector2.new(0.5,0.5);cicon.BackgroundTransparency=1;cicon.Position=UDim2.new(0.5,0,0.5,0);cicon.Size=UDim2.new(0.6,0,0.6,0);cicon.Image="rbxassetid://91955479080025"

	local palette=Instance.new("Frame",ps);palette.Visible=false;palette.AnchorPoint=Vector2.new(0.5,1);palette.BackgroundTransparency=1;palette.Position=UDim2.new(0.5,0,1,-65);palette.Size=UDim2.new(0,200,0.4,0)
	S:gtfgj5t().Parent=palette
	local scroll=Instance.new("ScrollingFrame",palette);scroll.BackgroundColor3=Color3.fromRGB(53,53,53);scroll.Size=UDim2.new(1,0,1,0);scroll.ScrollBarThickness=0;Instance.new("UICorner",scroll).CornerRadius=UDim.new(0,10)
	local grid=Instance.new("UIGridLayout",scroll);grid.CellPadding=UDim2.new();grid.CellSize=UDim2.new(0.2,0,0.2,0);Instance.new("UIAspectRatioConstraint",grid)
	local strok=Instance.new("UIStroke",scroll);strok.Color=Color3.fromRGB(100,100,100);strok.Thickness=1
	local padd=Instance.new("UIPadding",scroll);padd.PaddingLeft=UDim.new(0,5);padd.PaddingRight=UDim.new(0,5);padd.PaddingTop=UDim.new(0,5);padd.PaddingBottom=UDim.new(0,5)

	local kd=Instance.new("Frame",UI);kd.AnchorPoint=Vector2.new(1,1);kd.BackgroundTransparency=1;kd.Position=UDim2.new(1,-20,1,-20);kd.Size=UDim2.new(0,160,0,80);kd.Visible=isPC
	local sh=S:gtfgj5t();sh.ImageTransparency=0.75;sh.Parent=kd
	local l=Instance.new("UIListLayout",sh);l.VerticalFlex=Enum.UIFlexAlignment.Fill
	local pad=Instance.new("UIPadding",sh);pad.PaddingLeft=UDim.new(0,24);pad.PaddingTop=UDim.new(0,24);pad.PaddingBottom=UDim.new(0,24);pad.PaddingRight=UDim.new(0,24)

	local mk=Instance.new("Frame",sh);mk.BackgroundTransparency=1;mk.Size=UDim2.new(1,0,1,0)
	local ll=Instance.new("UIListLayout",mk);ll.FillDirection=Enum.FillDirection.Horizontal;ll.VerticalAlignment=Enum.VerticalAlignment.Center
	local ih=Instance.new("Frame",mk);ih.BackgroundTransparency=1;ih.Size=UDim2.new(1,0,1,0);Instance.new("UIAspectRatioConstraint",ih)
	local ii=Instance.new("ImageLabel",ih);ii.AnchorPoint=Vector2.new(0.5,0.5);ii.BackgroundTransparency=1;ii.Position=UDim2.new(0.5,0,0.5,0);ii.Size=UDim2.new(0.5,0,0.5,0);ii.ImageColor3=Color3.fromRGB(255,255,255);ii.Image="rbxassetid://129676559365910"
	local tt=Instance.new("TextLabel",mk);tt.BackgroundTransparency=1;tt.Size=UDim2.new(0,0,0.5,0);tt.Font=Enum.Font.SourceSansBold;tt.Text="Manage";tt.TextScaled=true;tt.TextColor3=Color3.fromRGB(255,255,255);tt.TextXAlignment=Enum.TextXAlignment.Left;Instance.new("UIFlexItem",tt).FlexMode=Enum.UIFlexMode.Fill

	local tp=Instance.new("Frame",sh);tp.BackgroundTransparency=1;tp.Size=UDim2.new(1,0,1,0)
	local l2=Instance.new("UIListLayout",tp);l2.FillDirection=Enum.FillDirection.Horizontal;l2.VerticalAlignment=Enum.VerticalAlignment.Center
	local ih2=Instance.new("Frame",tp);ih2.BackgroundTransparency=1;ih2.Size=UDim2.new(1,0,1,0);Instance.new("UIAspectRatioConstraint",ih2)
	local ii2=Instance.new("ImageLabel",ih2);ii2.AnchorPoint=Vector2.new(0.5,0.5);ii2.BackgroundTransparency=1;ii2.Position=UDim2.new(0.5,0,0.5,0);ii2.Size=UDim2.new(0.5,0,0.5,0);ii2.ImageColor3=Color3.fromRGB(255,255,255);ii2.Image="rbxassetid://94436261296720"
	local t2=Instance.new("TextLabel",tp);t2.BackgroundTransparency=1;t2.Size=UDim2.new(0,0,0.5,0);t2.Font=Enum.Font.SourceSansBold;t2.Text="Toggle Paint";t2.TextScaled=true;t2.TextColor3=Color3.fromRGB(255,255,255);t2.TextXAlignment=Enum.TextXAlignment.Left;Instance.new("UIFlexItem",t2).FlexMode=Enum.UIFlexMode.Fill

	for i=0,127 do
		local col=BrickColor.palette(i).Color
		local cb=Instance.new("ImageButton",scroll);cb.BackgroundTransparency=1
		local ic=Instance.new("Frame",cb);ic.AnchorPoint=Vector2.new(0.5,0.5);ic.Position=UDim2.new(0.5,0,0.5,0);ic.Size=UDim2.new(1,-5,1,-5);ic.BackgroundColor3=col;Instance.new("UICorner",ic).CornerRadius=UDim.new(0,5)
		cb.MouseButton1Down:Connect(function() C.PaintMode.Color=col;T:Create(palBtn,TweenInfo.new(0.25),{BackgroundColor3=col}):Play() end)
	end

	conf.MouseButton1Down:Connect(function() Panel:kjgtkfj4it() end)
	palBtn.MouseButton1Down:Connect(function() palette.Visible=not palette.Visible;scroll.CanvasSize=UDim2.new(0,0,0,grid.AbsoluteContentSize.Y+10) end)
	paintBtn.MouseButton1Down:Connect(function() C.PaintMode.ififadfdadii="Paint" end)
	delBtn.MouseButton1Down:Connect(function() C.PaintMode.ififadfdadii="Erase" end)
end

local b=gj4rlk1()
if b then b.Parent=lp.Backpack for _,s in pairs(b:GetChildren()) do if s:IsA("LocalScript") or s:IsA("Script") then s:Destroy() end end end

isPC = not U.TouchEnabled and U.KeyboardEnabled and U.MouseEnabled
Panel:kjgtkfjetewq();Panel:kjgtkfj4it1()

local tip=S:gtfgj5t();tip.Visible=false;tip.ImageTransparency=0.6;tip.Parent=UI;tip.Size=UDim2.new(0,82,0,50)
local pad=Instance.new("UIPadding",tip);pad.PaddingBottom=UDim.new(0,15);pad.PaddingLeft=UDim.new(0,20);pad.PaddingRight=UDim.new(0,20);pad.PaddingTop=UDim.new(0,15)
local t=Instance.new("TextLabel",tip);t.BackgroundTransparency=1;t.Size=UDim2.new(1,0,1,0);t.Font=Enum.Font.SourceSansBold;t.Text="Slow";t.TextColor3=Color3.fromRGB(255,255,255);t.TextScaled=true

Paint:gj4rl14hh()

m.Button1Down:Connect(function() md=true end)
m.Button1Up:Connect(function() md=false end)

R.Heartbeat:Connect(function()
	if md then local targ=m.Target if targ and C.PaintMode.Enabled then if C.PaintMode.ififadfdadii=="Paint" then Paint:gj4rl14t(targ) end if C.PaintMode.ififadfdadii=="Erase" then Paint:Ungj4rl14t(targ) end end end
	if C.Paint.Enabled then for _,t in pairs(C.Paint.dkdkddidk) do Paint:gj4rl145(t.Province) end end
end)
