-- Chaonic's Palette Helper

-- INITIALIZE!!!!

local dlg = Dialog
	{ 
		title = "Chaonic's Palette Helper"
	}
local data = dlg.data

-- TEST DELETE LATER
  local C = app.fgColor
  if(shadingColor ~= nil) then
    C = shadingColor
  end

local function colorCalc()
	end

local function hueCalc()
	end

-- STANDARD VALUES

local ColorLeft
	ColorLeft = Color{ r = 20, g = 20, b = 51, a = 255 }
local ColorMain
	ColorMain = app.fgColor
local ColorRight
	ColorRight = Color{ r = 230, g = 230, b = 195, a = 255 }
local ColorClipboard
	ColorClipboard = Color{ r = 0, g = 0, b = 0, a = 0 }

-- COLOR AMOUNT CHANGED

local function amountOfColorsChanged()
	if dlg.data.amountOfColors == "7"
		then print("Changed Amount of Colors to 7")
	elseif dlg.data.amountOfColors == "9"
		then print("Changed Amount of Colors to 9")
	elseif dlg.data.amountOfColors == "11"
		then print("Changed Amount of Colors to 11")
	elseif dlg.data.amountOfColors == "13"
		then print("Changed Amount of Colors to 13")
	elseif dlg.data.amountOfColors == "15"
		then print("Changed Amount of Colors to 15")
	end
end

-- RELOAD COLORS

function reloadColors(windowBounds)
	local dlg
	dlg = Dialog
	{ 
		title = "Chaonic's Palette Helper"
	}


-- COLOR VARIABLE STORAGE

-- SHADE
	local Sha1 = colorCalc("sha",	7,	1,	100/8*7,	1,	100/7*6,	1,	100/6*5,	1,	100/5*4,	1,	100/4*3	)
	local Sha2 = colorCalc("sha",	7,	1,	100/8*6,	1,	100/7*5,	1,	100/6*4,	1,	100/5*3,	1,	100/4*2	)
	local Sha3 = colorCalc("sha",	7,	1,	100/8*5,	1,	100/7*4,	1,	100/6*3,	1,	100/5*2,	1,	100/4	)
	local Sha4 = colorCalc("sha",	7,	1,	100/8*4,	1,	100/7*3,	1,	100/6*2,	1,	100/5,		2,	0		)
	local Sha5 = colorCalc("sha",	7,	1,	100/8*3,	1,	100/7*2,	1,	100/6,		2,	0,			3,	100/4	)
	local Sha6 = colorCalc("sha",	7,	1,	100/8*2,	1,	100/7, 		2,	0,			3,	100/5,		3,	100/4*2	)
	local Sha7 = colorCalc("sha",	7,	1,	100/8,		2,	0,			3,	100/6,		3,	100/5*2,	3,	100/4*3	)
	local Sha8 = colorCalc("sha",	9,	2,	0,			3,	100/7,		3,	100/6*2,	3,	100/5*3,	0,	0		)
	local Sha9 = colorCalc("sha",	9,	3,	100/8,		3,	100/7*2,	3,	100/6*3,	3,	100/5*4,	0,	0		)
	local Sha10 = colorCalc("sha",	11,	3,	100/8*2,	3,	100/7*3,	3,	100/6*4,	0,	0,			0,	0		)
	local Sha11 = colorCalc("sha",	11,	3,	100/8*3,	3,	100/7*4,	3,	100/6*5,	0,	0,			0,	0		)
	local Sha12 = colorCalc("sha",	13,	3,	100/8*4,	3,	100/7*5,	0,	0,			0,	0,			0,	0		)
	local Sha13 = colorCalc("sha",	13,	3,	100/8*5,	3,	100/7*6,	0,	0,			0,	0,			0,	0		)
	local Sha14 = colorCalc("sha",	15,	3,	100/8*6,	0,	0,			0,	0,			0,	0,			0,	0		)
	local Sha15 = colorCalc("sha",	15,	3,	100/8*7,	0,	0,			0,	0,			0,	0,			0,	0		)

-- SOFT SHADE
	local Ssh1 = colorCalc("ssh",	7,	1,	100/8*7,	1,	100/7*6,	1,	100/6*5,	1,	100/5*4,	1,	100/4*3	)
	local Ssh2 = colorCalc("ssh",	7,	1,	100/8*6,	1,	100/7*5,	1,	100/6*4,	1,	100/5*3,	1,	100/4*2	)
	local Ssh3 = colorCalc("ssh",	7,	1,	100/8*5,	1,	100/7*4,	1,	100/6*3,	1,	100/5*2,	1,	100/4	)
	local Ssh4 = colorCalc("ssh",	7,	1,	100/8*4,	1,	100/7*3,	1,	100/6*2,	1,	100/5,		2,	0		)
	local Ssh5 = colorCalc("ssh",	7,	1,	100/8*3,	1,	100/7*2,	1,	100/6,		2,	0,			3,	100/4	)
	local Ssh6 = colorCalc("ssh",	7,	1,	100/8*2,	1,	100/7, 		2,	0,			3,	100/5,		3,	100/4*2	)
	local Ssh7 = colorCalc("ssh",	7,	1,	100/8,		2,	0,			3,	100/6,		3,	100/5*2,	3,	100/4*3	)
	local Ssh8 = colorCalc("ssh",	9,	2,	0,			3,	100/7,		3,	100/6*2,	3,	100/5*3,	0,	0		)
	local Ssh9 = colorCalc("ssh",	9,	3,	100/8,		3,	100/7*2,	3,	100/6*3,	3,	100/5*4,	0,	0		)
	local Ssh10 = colorCalc("ssh",	11,	3,	100/8*2,	3,	100/7*3,	3,	100/6*4,	0,	0,			0,	0		)
	local Ssh11 = colorCalc("ssh",	11,	3,	100/8*3,	3,	100/7*4,	3,	100/6*5,	0,	0,			0,	0		)
	local Ssh12 = colorCalc("ssh",	13,	3,	100/8*4,	3,	100/7*5,	0,	0,			0,	0,			0,	0		)
	local Ssh13 = colorCalc("ssh",	13,	3,	100/8*5,	3,	100/7*6,	0,	0,			0,	0,			0,	0		)
	local Ssh14 = colorCalc("ssh",	15,	3,	100/8*6,	0,	0,			0,	0,			0,	0,			0,	0		)
	local Ssh15 = colorCalc("ssh",	15,	3,	100/8*7,	0,	0,			0,	0,			0,	0,			0,	0		)

-- LIGHT
	local Lig1 = colorCalc("lig",	7,	1,	100/8*7,	1,	100/7*6,	1,	100/6*5,	1,	100/5*4,	1,	100/4*3	)
	local Lig2 = colorCalc("lig",	7,	1,	100/8*6,	1,	100/7*5,	1,	100/6*4,	1,	100/5*3,	1,	100/4*2	)
	local Lig3 = colorCalc("lig",	7,	1,	100/8*5,	1,	100/7*4,	1,	100/6*3,	1,	100/5*2,	1,	100/4	)
	local Lig4 = colorCalc("lig",	7,	1,	100/8*4,	1,	100/7*3,	1,	100/6*2,	1,	100/5,		2,	0		)
	local Lig5 = colorCalc("lig",	7,	1,	100/8*3,	1,	100/7*2,	1,	100/6,		2,	0,			3,	100/4	)
	local Lig6 = colorCalc("lig",	7,	1,	100/8*2,	1,	100/7, 		2,	0,			3,	100/5,		3,	100/4*2	)
	local Lig7 = colorCalc("lig",	7,	1,	100/8,		2,	0,			3,	100/6,		3,	100/5*2,	3,	100/4*3	)
	local Lig8 = colorCalc("lig",	9,	2,	0,			3,	100/7,		3,	100/6*2,	3,	100/5*3,	0,	0		)
	local Lig9 = colorCalc("lig",	9,	3,	100/8,		3,	100/7*2,	3,	100/6*3,	3,	100/5*4,	0,	0		)
	local Lig10 = colorCalc("lig",	11,	3,	100/8*2,	3,	100/7*3,	3,	100/6*4,	0,	0,			0,	0		)
	local Lig11 = colorCalc("lig",	11,	3,	100/8*3,	3,	100/7*4,	3,	100/6*5,	0,	0,			0,	0		)
	local Lig12 = colorCalc("lig",	13,	3,	100/8*4,	3,	100/7*5,	0,	0,			0,	0,			0,	0		)
	local Lig13 = colorCalc("lig",	13,	3,	100/8*5,	3,	100/7*6,	0,	0,			0,	0,			0,	0		)
	local Lig14 = colorCalc("lig",	15,	3,	100/8*6,	0,	0,			0,	0,			0,	0,			0,	0		)
	local Lig15 = colorCalc("lig",	15,	3,	100/8*7,	0,	0,			0,	0,			0,	0,			0,	0		)

-- SOFT LIGHT
	local Slg1 = colorCalc("slg",	7,	1,	100/8*7,	1,	100/7*6,	1,	100/6*5,	1,	100/5*4,	1,	100/4*3	)
	local Slg2 = colorCalc("slg",	7,	1,	100/8*6,	1,	100/7*5,	1,	100/6*4,	1,	100/5*3,	1,	100/4*2	)
	local Slg3 = colorCalc("slg",	7,	1,	100/8*5,	1,	100/7*4,	1,	100/6*3,	1,	100/5*2,	1,	100/4	)
	local Slg4 = colorCalc("slg",	7,	1,	100/8*4,	1,	100/7*3,	1,	100/6*2,	1,	100/5,		2,	0		)
	local Slg5 = colorCalc("slg",	7,	1,	100/8*3,	1,	100/7*2,	1,	100/6,		2,	0,			3,	100/4	)
	local Slg6 = colorCalc("slg",	7,	1,	100/8*2,	1,	100/7, 		2,	0,			3,	100/5,		3,	100/4*2	)
	local Slg7 = colorCalc("slg",	7,	1,	100/8,		2,	0,			3,	100/6,		3,	100/5*2,	3,	100/4*3	)
	local Slg8 = colorCalc("slg",	9,	2,	0,			3,	100/7,		3,	100/6*2,	3,	100/5*3,	0,	0		)
	local Slg9 = colorCalc("slg",	9,	3,	100/8,		3,	100/7*2,	3,	100/6*3,	3,	100/5*4,	0,	0		)
	local Slg10 = colorCalc("slg",	11,	3,	100/8*2,	3,	100/7*3,	3,	100/6*4,	0,	0,			0,	0		)
	local Slg11 = colorCalc("slg",	11,	3,	100/8*3,	3,	100/7*4,	3,	100/6*5,	0,	0,			0,	0		)
	local Slg12 = colorCalc("slg",	13,	3,	100/8*4,	3,	100/7*5,	0,	0,			0,	0,			0,	0		)
	local Slg13 = colorCalc("slg",	13,	3,	100/8*5,	3,	100/7*6,	0,	0,			0,	0,			0,	0		)
	local Slg14 = colorCalc("slg",	15,	3,	100/8*6,	0,	0,			0,	0,			0,	0,			0,	0		)
	local Slg15 = colorCalc("slg",	15,	3,	100/8*7,	0,	0,			0,	0,			0,	0,			0,	0		)

-- SATURATION
	local Sat1 = colorCalc("sat",	7,	1,	100/8*7,	1,	100/7*6,	1,	100/6*5,	1,	100/5*4,	1,	100/4*3	)
	local Sat2 = colorCalc("sat",	7,	1,	100/8*6,	1,	100/7*5,	1,	100/6*4,	1,	100/5*3,	1,	100/4*2	)
	local Sat3 = colorCalc("sat",	7,	1,	100/8*5,	1,	100/7*4,	1,	100/6*3,	1,	100/5*2,	1,	100/4	)
	local Sat4 = colorCalc("sat",	7,	1,	100/8*4,	1,	100/7*3,	1,	100/6*2,	1,	100/5,		2,	0		)
	local Sat5 = colorCalc("sat",	7,	1,	100/8*3,	1,	100/7*2,	1,	100/6,		2,	0,			3,	100/4	)
	local Sat6 = colorCalc("sat",	7,	1,	100/8*2,	1,	100/7, 		2,	0,			3,	100/5,		3,	100/4*2	)
	local Sat7 = colorCalc("sat",	7,	1,	100/8,		2,	0,			3,	100/6,		3,	100/5*2,	3,	100/4*3	)
	local Sat8 = colorCalc("sat",	9,	2,	0,			3,	100/7,		3,	100/6*2,	3,	100/5*3,	0,	0		)
	local Sat9 = colorCalc("sat",	9,	3,	100/8,		3,	100/7*2,	3,	100/6*3,	3,	100/5*4,	0,	0		)
	local Sat10 = colorCalc("sat",	11,	3,	100/8*2,	3,	100/7*3,	3,	100/6*4,	0,	0,			0,	0		)
	local Sat11 = colorCalc("sat",	11,	3,	100/8*3,	3,	100/7*4,	3,	100/6*5,	0,	0,			0,	0		)
	local Sat12 = colorCalc("sat",	13,	3,	100/8*4,	3,	100/7*5,	0,	0,			0,	0,			0,	0		)
	local Sat13 = colorCalc("sat",	13,	3,	100/8*5,	3,	100/7*6,	0,	0,			0,	0,			0,	0		)
	local Sat14 = colorCalc("sat",	15,	3,	100/8*6,	0,	0,			0,	0,			0,	0,			0,	0		)
	local Sat15 = colorCalc("sat",	15,	3,	100/8*7,	0,	0,			0,	0,			0,	0,			0,	0		)

-- SOFT SATURATION
	local Sst1 = colorCalc("sst",	7,	1,	100/8*7,	1,	100/7*6,	1,	100/6*5,	1,	100/5*4,	1,	100/4*3	)
	local Sst2 = colorCalc("sst",	7,	1,	100/8*6,	1,	100/7*5,	1,	100/6*4,	1,	100/5*3,	1,	100/4*2	)
	local Sst3 = colorCalc("sst",	7,	1,	100/8*5,	1,	100/7*4,	1,	100/6*3,	1,	100/5*2,	1,	100/4	)
	local Sst4 = colorCalc("sst",	7,	1,	100/8*4,	1,	100/7*3,	1,	100/6*2,	1,	100/5,		2,	0		)
	local Sst5 = colorCalc("sst",	7,	1,	100/8*3,	1,	100/7*2,	1,	100/6,		2,	0,			3,	100/4	)
	local Sst6 = colorCalc("sst",	7,	1,	100/8*2,	1,	100/7, 		2,	0,			3,	100/5,		3,	100/4*2	)
	local Sst7 = colorCalc("sst",	7,	1,	100/8,		2,	0,			3,	100/6,		3,	100/5*2,	3,	100/4*3	)
	local Sst8 = colorCalc("sst",	9,	2,	0,			3,	100/7,		3,	100/6*2,	3,	100/5*3,	0,	0		)
	local Sst9 = colorCalc("sst",	9,	3,	100/8,		3,	100/7*2,	3,	100/6*3,	3,	100/5*4,	0,	0		)
	local Sst10 = colorCalc("sst",	11,	3,	100/8*2,	3,	100/7*3,	3,	100/6*4,	0,	0,			0,	0		)
	local Sst11 = colorCalc("sst",	11,	3,	100/8*3,	3,	100/7*4,	3,	100/6*5,	0,	0,			0,	0		)
	local Sst12 = colorCalc("sst",	13,	3,	100/8*4,	3,	100/7*5,	0,	0,			0,	0,			0,	0		)
	local Sst13 = colorCalc("sst",	13,	3,	100/8*5,	3,	100/7*6,	0,	0,			0,	0,			0,	0		)
	local Sst14 = colorCalc("sst",	15,	3,	100/8*6,	0,	0,			0,	0,			0,	0,			0,	0		)
	local Sst15 = colorCalc("sst",	15,	3,	100/8*7,	0,	0,			0,	0,			0,	0,			0,	0		)

-- SOFT HUE
	local Shu1 = hueCalc("shu",		4,	1,	0,			1,	0,			1,	0,			1,	0,			1,	0		)
	local Shu2 = hueCalc("shu",		4,	2,	100/18	,	2,	100/12,		2,	100/8,		2,	100/6,		2,	100/4	)
	local Shu3 = hueCalc("shu",		4,	2,	100/18*2,	2,	100/12*2,	2,	100/8*2,	2,	100/6*2,	2,	100/4*2	)
	local Shu4 = hueCalc("shu",		4,	2,	100/18*3,	2,	100/12*3,	2,	100/8*3,	2,	100/6*3,	2,	100/4*3	)
	local Shu5 = hueCalc("shu",		6,	2,	100/18*4,	2,	100/12*4,	2,	100/8*4,	2,	100/6*4,	0,	0		)
	local Shu6 = hueCalc("shu",		6,	2,	100/18*5,	2,	100/12*5, 	2,	100/8*5,	2,	100/6*5,	0,	0		)
	local Shu7 = hueCalc("shu",		8,	2,	100/18*6,	2,	100/12*6,	2,	100/8*6,	0,	0,			0,	0		)
	local Shu8 = hueCalc("shu",		8,	2,	100/18*7,	2,	100/12*7,	2,	100/8*7,	0,	0,			0,	0		)
	local Shu9 = hueCalc("shu",		12,	2,	100/18*8,	2,	100/12*8,	0,	0,			0,	0,			0,	0		)
	local Shu10 = hueCalc("shu",	12,	2,	100/18*9,	2,	100/12*9,	0,	0,			0,	0,			0,	0		)
	local Shu11 = hueCalc("shu",	12,	2,	100/18*10,	2,	100/12*10,	0,	0,			0,	0,			0,	0		)
	local Shu12 = hueCalc("shu",	12,	2,	100/18*11,	2,	100/12*11,	0,	0,			0,	0,			0,	0		)
	local Shu13 = hueCalc("shu",	18,	2,	100/18*12,	0,	0,			0,	0,			0,	0,			0,	0		)
	local Shu14 = hueCalc("shu",	18,	2,	100/18*13,	0,	0,			0,	0,			0,	0,			0,	0		)
	local Shu15 = hueCalc("shu",	18,	2,	100/18*15,	0,	0,			0,	0,			0,	0,			0,	0		)
	local Shu16 = hueCalc("shu",	18,	2,	100/18*16,	0,	0,			0,	0,			0,	0,			0,	0		)
	local Shu17 = hueCalc("shu",	18,	2,	100/18*17,	0,	0,			0,	0,			0,	0,			0,	0		)

-- HARD HUE
	local Hhu1 = hueCalc("hhu",		4,	1,	0,			1,	0,			1,	0,			1,	0,			1,	0		)
	local Hhu2 = hueCalc("hhu",		4,	2,	100/18	,	2,	100/12,		2,	100/8,		2,	100/6,		2,	100/4	)
	local Hhu3 = hueCalc("hhu",		4,	2,	100/18*2,	2,	100/12*2,	2,	100/8*2,	2,	100/6*2,	2,	100/4*2	)
	local Hhu4 = hueCalc("hhu",		4,	2,	100/18*3,	2,	100/12*3,	2,	100/8*3,	2,	100/6*3,	2,	100/4*3	)
	local Hhu5 = hueCalc("hhu",		6,	2,	100/18*4,	2,	100/12*4,	2,	100/8*4,	2,	100/6*4,	0,	0		)
	local Hhu6 = hueCalc("hhu",		6,	2,	100/18*5,	2,	100/12*5, 	2,	100/8*5,	2,	100/6*5,	0,	0		)
	local Hhu7 = hueCalc("hhu",		8,	2,	100/18*6,	2,	100/12*6,	2,	100/8*6,	0,	0,			0,	0		)
	local Hhu8 = hueCalc("hhu",		8,	2,	100/18*7,	2,	100/12*7,	2,	100/8*7,	0,	0,			0,	0		)
	local Hhu9 = hueCalc("hhu",		12,	2,	100/18*8,	2,	100/12*8,	0,	0,			0,	0,			0,	0		)
	local Hhu10 = hueCalc("hhu",	12,	2,	100/18*9,	2,	100/12*9,	0,	0,			0,	0,			0,	0		)
	local Hhu11 = hueCalc("hhu",	12,	2,	100/18*10,	2,	100/12*10,	0,	0,			0,	0,			0,	0		)
	local Hhu12 = hueCalc("hhu",	12,	2,	100/18*11,	2,	100/12*11,	0,	0,			0,	0,			0,	0		)
	local Hhu13 = hueCalc("hhu",	18,	2,	100/18*12,	0,	0,			0,	0,			0,	0,			0,	0		)
	local Hhu14 = hueCalc("hhu",	18,	2,	100/18*13,	0,	0,			0,	0,			0,	0,			0,	0		)
	local Hhu15 = hueCalc("hhu",	18,	2,	100/18*15,	0,	0,			0,	0,			0,	0,			0,	0		)
	local Hhu16 = hueCalc("hhu",	18,	2,	100/18*16,	0,	0,			0,	0,			0,	0,			0,	0		)
	local Hhu17 = hueCalc("hhu",	18,	2,	100/18*17,	0,	0,			0,	0,			0,	0,			0,	0		)

-- DIALOG

	dlg
	:label
	{
		id=labelColorLeft,
		label = "Base Colors",
		text= "Left"
	}
	:label
	{
		id=labelColorMain,
		text= "Main"
	}
	:label
	{
		id=labelColorRight,
		text= "Right"
	}
	:label
	{
		id=labelColorClipboard,
		text= "Clipboard"
	}
	:shades
	{
		id = "mainColors",
		colors = {ColorLeft, ColorMain, ColorRight, ColorClipboard},
		onclick = function(ev)
			if (ev.button == MouseButton.LEFT) then
				app.fgColor = ev.color
			end
		end
	}
	:button
	{
		id = "buttonSetLeft",
		text = "Set",
		onclick = function()
			ColorLeft = app.fgColor
			reloadColors(app.fgColor, dlg.bounds)
			dlg:close()
		end
	}
	:button
	{
		id = "buttonSetMain",
		text = "Set",
		onclick = function()
			ColorMain = app.fgColor
		end
	}
	:button
	{
		id = "buttonSetRight",
		text = "Set",
		onclick = function()
			ColorRight = app.fgColor
		end
	}
	:button
	{
		id = "buttonSetClipboard",
		text = "Set",
		onclick = function()
			ColorClipboard = app.fgColor
		end
	}
	:label
	{
		id=labelColorsLeft,
		label = "Amount of:",
		text= "Colors"
	}
	:label
	{
		id=labelColorsLeft,
		text= "Hues"
	}
	:combobox
	{
		id = "amountOfColors",
		option = "15",
		options =
		{
			"7",
			"9",
			"11",
			"13",
			"15"
		},
		onchange = function()
			print("Changed Amount of Colors to 15")
			amountOfColorsChanged()
		end
	}
	:combobox
	{
		id = "amountOfHues",
		option = "12",
		options =
		{
			"4",
			"6",
			"8",
			"12",
			"18"
		}
	}
	:label
	{
		id=huelabel,
		label = "Interpolations: ",
		text= "Hue"
	}
	:label
	{
		id=satlabel,
		text= "Saturation"
	}
	:label
	{
		id=vallabel,
		text= "Value"
	}
	:label
	{
		id=alphalabel,
		text= "Alpha"
	}
	:combobox
	{
		id = "hueinterpolation",
		option = "RGB",
		options =
		{
			"RGB",
			"Sine",
			"Quad",
			"Cubic",
			"Circ",
			"Linear",
			"outSine",
			"outQuad",
			"outCubic",
			"outCirc"
		}
	}
	:combobox
	{
		id = "satinterpolation",
		option = "Quad",
		options =
		{
			"Sine",
			"Quad",
			"Cubic",
			"Circ",
			"Linear",
			"outSine",
			"outQuad",
			"outCubic",
			"outCirc"
		}
	}
	:combobox
	{
		id = "valinterpolation",
		option = "Quad",
		options =
		{
			"Sine",
			"Quad",
			"Cubic",
			"Circ",
			"Linear",
			"outSine",
			"outQuad",
			"outCubic",
			"outCirc"
		}
	}
	:combobox
	{
		id = "alphainterpolation",
		option = "Quad",
		options =
		{
			"Sine",
			"Quad",
			"Cubic",
			"Circ",
			"Linear",
			"outSine",
			"outQuad",
			"outCubic",
			"outCirc"
		}
	}
-- COLOR CONTROL END
	:separator
	{
		id = "separator",
	}
-- SHADE
	:shades
	{
		id = "paletteShade",
		label = "Shade",
		colors = {C, C, C, C, C, C, C, C, C, C, C, C, C, C, C}
	}
	:button
	{
		id = "buttonShadeLine",
		text = "Copy Line to Palette",
		onclick = function()
		end
	}
	:button
	{
		id = "buttonShadePalette",
		text = "Generate whole Palette",
		onclick = function()
		end
	}
-- SHADE END
-- SOFT SHADE
	:shades
	{
		id = "paletteSoftShade",
		label = "Soft Shade",
		colors = {C, C, C, C, C, C, C, C, C, C, C, C, C, C, C}
	}
	:button
	{
		id = "buttonShadeLine",
		text = "Copy Line to Palette",
		onclick = function()
		end
	}
	:button
	{
		id = "buttonShadePalette",
		text = "Generate whole Palette",
		onclick = function()
		end
	}
-- SOFT SHADE END
-- LIGHT
	:shades
	{
		id = "paletteLight",
		label = "Light",
		colors = {C, C, C, C, C, C, C, C, C, C, C, C, C, C, C}
	}
	:button
	{
		id = "buttonShadeLine",
		text = "Copy Line to Palette",
		onclick = function()
		end
	}
	:button
	{
		id = "buttonShadePalette",
		text = "Generate whole Palette",
		onclick = function()
		end
	}
-- LIGHT END
-- SOFT LIGHT
	:shades
	{
		id = "paletteSoftLight",
		label = "Soft Light",
		colors = {C, C, C, C, C, C, C, C, C, C, C, C, C, C, C}
	}
	:button
	{
		id = "buttonShadeLine",
		text = "Copy Line to Palette",
		onclick = function()
		end
	}
	:button
	{
		id = "buttonShadePalette",
		text = "Generate whole Palette",
		onclick = function()
		end
	}
-- SOFT LIGHT END
-- SATURATION
	:shades
	{
		id = "paletteSaturation",
		label = "Saturation",
		colors = {C, C, C, C, C, C, C, C, C, C, C, C, C, C, C}
	}
	:button
	{
		id = "buttonShadeLine",
		text = "Copy Line to Palette",
		onclick = function()
		end
	}
	:button
	{
		id = "buttonShadePalette",
		text = "Generate whole Palette",
		onclick = function()
		end
	}
-- SATURATION END
-- SOFT SATURATION
	:shades
	{
		id = "paletteSoftSaturation",
		label = "Soft Sat.",
		colors = {C, C, C, C, C, C, C, C, C, C, C, C, C, C, C}
	}
	:button
	{
		id = "buttonShadeLine",
		text = "Copy Line to Palette",
		onclick = function()
		end
	}
	:button
	{
		id = "buttonShadePalette",
		text = "Generate whole Palette",
		onclick = function()
		end
	}
-- SOFT SATURATION END
-- SOFT HUE
	:shades
	{
		id = "paletteSoftHue",
		label = "Soft Hue",
		colors = {C, C, C, C, C, C, C, C, C, C, C, C, C, C, C, C, C, C}
	}
	:button
	{
		id = "buttonShadeLine",
		text = "Copy Line to Palette",
		onclick = function()
		end
	}
-- SOFT HUE END
-- HARD HUE
	:shades
	{
		id = "paletteHardHue",
		label = "Hard Hue",
		colors = {C, C, C, C, C, C, C, C, C, C, C, C, C, C, C, C, C, C}
	}
	:button
	{
		id = "buttonShadeLine",
		text = "Copy Line to Palette",
		onclick = function()
		end
	}
-- HARD HUE END
	:separator
	{
		id = "separator",
	}
	:button
	{
		id = "buttonGenerate",
		text = "Generate",
		onclick = function()
		end
	}
	:button
	{
		id = "buttonReload",
		text = "Reload",
		onclick = function()
		end
	}
	:button
		{
		id = "buttonCancel",
		text = "Cancel",
		onclick = function()
		end
	}
	:show
	{
	wait = false, bounds = windowBounds
	}
	
end

-- WHAT??? THIS KEEPS THE WIDGET UP?!
do
	reloadColors(app.fgColor)
end