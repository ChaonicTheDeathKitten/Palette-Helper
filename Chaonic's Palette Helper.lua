-- Chaonic's Palette Helper

-- STANDARD VALUES

local ColorLeft = Color{ r = 20, g = 20, b = 51, a = 255 }
local ColorMain = app.fgColor
local ColorRight = Color{ r = 230, g = 230, b = 195, a = 255 }
local ColorClipboard = Color{ r = 0, g = 0, b = 0, a = 0 }
local amountOfColorsVar = "15"
local amountOfHuesVar = "12"
local hueInterpolationVar = "RGB"
local satInterpolationVar = "Quad"
local valInterpolationVar = "Quad"
local alphaInterpolationVar = "Quad"

-- CHANGED VALUES

local CL = ColorLeft
local CM = ColorMain
local CR = ColorRight
local CC = ColorClipboard
local AOC = amountOfColorsVar
local AOH = amountOfHuesVar
local HI = hueInterpolationVar
local SI = satInterpolationVar
local VI = valInterpolationVar
local AI = alphaInterpolationVar

-- COLOR CALCULATIONS

local function colorCalc(method, position, minAOC, leftOrRight15, easing15, leftOrRight13, easing13, leftOrRight11, easing11, leftOrRight9, easing9, leftOrRight7, easing7)
	outputColor = Color()
	if method == "sha" then
		print "Shading calculation not implemented"
		-- Just use CM for now!
		outputColor = CM
	elseif method == "ssh" then
		print "Soft Shading calculation not implemented"
		-- Just use CM for now!
		outputColor = CM
	elseif method == "lig" then
		print "Light calculation not implemented"
		-- Just use CM for now!
		outputColor = CM
	elseif method == "slg" then
		print "Soft Light calculation not implemented"
		-- Just use CM for now!
		outputColor = CM
	elseif method == "sat" then
		print "Saturation calculation not implemented"
		-- Just use CM for now!
		outputColor = CM
	elseif method == "sst" then
		print "Soft Saturation calculation not implemented"
		-- Just use CM for now!
		outputColor = CM
	else
		print ("ERROR: Calculation method unknown. It is currently ", method, "... That's not on the list. Have you messed with the colorCalc function or the calculation table?")
	end
	return outputColor
end

local function hueCalc(method, position, minAOH, baseOrCalc18, easing18, baseOrCalc12, easing12, baseOrCalc8, easing8, baseOrCalc6, easing6, baseOrCalc4, easing4)
	outputColor = Color()
	if method == "shu" then
		print "Soft Hue calculation not implemented"
		-- Just use CM for now!
		outputColor = CM
	elseif method == "hhu" then
		print "Hard Hue calculation not implemented"
		-- Just use CM for now!
		outputColor = CM
	end
	return outputColor
end

-- RELOAD COLORS

local function reloadColors(windowBounds)
	local dlg
	dlg = Dialog
	{ 
		title = "Chaonic's Palette Helper"
	}

-- COLOR TABLE

-- SHADE
	local Sha1 = colorCalc("sha",	1,	7,	1,	100/8*7,	1,	100/7*6,	1,	100/6*5,	1,	100/5*4,	1,	100/4*3	)
	local Sha2 = colorCalc("sha",	2,	7,	1,	100/8*6,	1,	100/7*5,	1,	100/6*4,	1,	100/5*3,	1,	100/4*2	)
	local Sha3 = colorCalc("sha",	3,	7,	1,	100/8*5,	1,	100/7*4,	1,	100/6*3,	1,	100/5*2,	1,	100/4	)
	local Sha4 = colorCalc("sha",	4,	7,	1,	100/8*4,	1,	100/7*3,	1,	100/6*2,	1,	100/5,		2,	0		)
	local Sha5 = colorCalc("sha",	5,	7,	1,	100/8*3,	1,	100/7*2,	1,	100/6,		2,	0,			3,	100/4	)
	local Sha6 = colorCalc("sha",	6,	7,	1,	100/8*2,	1,	100/7, 		2,	0,			3,	100/5,		3,	100/4*2	)
	local Sha7 = colorCalc("sha",	7,	7,	1,	100/8,		2,	0,			3,	100/6,		3,	100/5*2,	3,	100/4*3	)
	local Sha8 = colorCalc("sha",	8,	9,	2,	0,			3,	100/7,		3,	100/6*2,	3,	100/5*3,	0,	0		)
	local Sha9 = colorCalc("sha",	9,	9,	3,	100/8,		3,	100/7*2,	3,	100/6*3,	3,	100/5*4,	0,	0		)
	local Sha10 = colorCalc("sha",	10,	11,	3,	100/8*2,	3,	100/7*3,	3,	100/6*4,	0,	0,			0,	0		)
	local Sha11 = colorCalc("sha",	11,	11,	3,	100/8*3,	3,	100/7*4,	3,	100/6*5,	0,	0,			0,	0		)
	local Sha12 = colorCalc("sha",	12,	13,	3,	100/8*4,	3,	100/7*5,	0,	0,			0,	0,			0,	0		)
	local Sha13 = colorCalc("sha",	13,	13,	3,	100/8*5,	3,	100/7*6,	0,	0,			0,	0,			0,	0		)
	local Sha14 = colorCalc("sha",	14,	15,	3,	100/8*6,	0,	0,			0,	0,			0,	0,			0,	0		)
	local Sha15 = colorCalc("sha",	15,	15,	3,	100/8*7,	0,	0,			0,	0,			0,	0,			0,	0		)

-- SOFT SHADE
	local Ssh1 = colorCalc("ssh",	1,	7,	1,	100/8*7,	1,	100/7*6,	1,	100/6*5,	1,	100/5*4,	1,	100/4*3	)
	local Ssh2 = colorCalc("ssh",	2,	7,	1,	100/8*6,	1,	100/7*5,	1,	100/6*4,	1,	100/5*3,	1,	100/4*2	)
	local Ssh3 = colorCalc("ssh",	3,	7,	1,	100/8*5,	1,	100/7*4,	1,	100/6*3,	1,	100/5*2,	1,	100/4	)
	local Ssh4 = colorCalc("ssh",	4,	7,	1,	100/8*4,	1,	100/7*3,	1,	100/6*2,	1,	100/5,		2,	0		)
	local Ssh5 = colorCalc("ssh",	5,	7,	1,	100/8*3,	1,	100/7*2,	1,	100/6,		2,	0,			3,	100/4	)
	local Ssh6 = colorCalc("ssh",	6,	7,	1,	100/8*2,	1,	100/7, 		2,	0,			3,	100/5,		3,	100/4*2	)
	local Ssh7 = colorCalc("ssh",	7,	7,	1,	100/8,		2,	0,			3,	100/6,		3,	100/5*2,	3,	100/4*3	)
	local Ssh8 = colorCalc("ssh",	8,	9,	2,	0,			3,	100/7,		3,	100/6*2,	3,	100/5*3,	0,	0		)
	local Ssh9 = colorCalc("ssh",	9,	9,	3,	100/8,		3,	100/7*2,	3,	100/6*3,	3,	100/5*4,	0,	0		)
	local Ssh10 = colorCalc("ssh",	10,	11,	3,	100/8*2,	3,	100/7*3,	3,	100/6*4,	0,	0,			0,	0		)
	local Ssh11 = colorCalc("ssh",	11,	11,	3,	100/8*3,	3,	100/7*4,	3,	100/6*5,	0,	0,			0,	0		)
	local Ssh12 = colorCalc("ssh",	12,	13,	3,	100/8*4,	3,	100/7*5,	0,	0,			0,	0,			0,	0		)
	local Ssh13 = colorCalc("ssh",	13,	13,	3,	100/8*5,	3,	100/7*6,	0,	0,			0,	0,			0,	0		)
	local Ssh14 = colorCalc("ssh",	14,	15,	3,	100/8*6,	0,	0,			0,	0,			0,	0,			0,	0		)
	local Ssh15 = colorCalc("ssh",	15,	15,	3,	100/8*7,	0,	0,			0,	0,			0,	0,			0,	0		)

-- LIGHT
	local Lig1 = colorCalc("lig",	1,	7,	1,	100/8*7,	1,	100/7*6,	1,	100/6*5,	1,	100/5*4,	1,	100/4*3	)
	local Lig2 = colorCalc("lig",	2,	7,	1,	100/8*6,	1,	100/7*5,	1,	100/6*4,	1,	100/5*3,	1,	100/4*2	)
	local Lig3 = colorCalc("lig",	3,	7,	1,	100/8*5,	1,	100/7*4,	1,	100/6*3,	1,	100/5*2,	1,	100/4	)
	local Lig4 = colorCalc("lig",	4,	7,	1,	100/8*4,	1,	100/7*3,	1,	100/6*2,	1,	100/5,		2,	0		)
	local Lig5 = colorCalc("lig",	5,	7,	1,	100/8*3,	1,	100/7*2,	1,	100/6,		2,	0,			3,	100/4	)
	local Lig6 = colorCalc("lig",	6,	7,	1,	100/8*2,	1,	100/7, 		2,	0,			3,	100/5,		3,	100/4*2	)
	local Lig7 = colorCalc("lig",	7,	7,	1,	100/8,		2,	0,			3,	100/6,		3,	100/5*2,	3,	100/4*3	)
	local Lig8 = colorCalc("lig",	8,	9,	2,	0,			3,	100/7,		3,	100/6*2,	3,	100/5*3,	0,	0		)
	local Lig9 = colorCalc("lig",	9,	9,	3,	100/8,		3,	100/7*2,	3,	100/6*3,	3,	100/5*4,	0,	0		)
	local Lig10 = colorCalc("lig",	10,	11,	3,	100/8*2,	3,	100/7*3,	3,	100/6*4,	0,	0,			0,	0		)
	local Lig11 = colorCalc("lig",	11,	11,	3,	100/8*3,	3,	100/7*4,	3,	100/6*5,	0,	0,			0,	0		)
	local Lig12 = colorCalc("lig",	12,	13,	3,	100/8*4,	3,	100/7*5,	0,	0,			0,	0,			0,	0		)
	local Lig13 = colorCalc("lig",	13,	13,	3,	100/8*5,	3,	100/7*6,	0,	0,			0,	0,			0,	0		)
	local Lig14 = colorCalc("lig",	14,	15,	3,	100/8*6,	0,	0,			0,	0,			0,	0,			0,	0		)
	local Lig15 = colorCalc("lig",	15,	15,	3,	100/8*7,	0,	0,			0,	0,			0,	0,			0,	0		)

-- SOFT LIGHT
	local Slg1 = colorCalc("slg",	1,	7,	1,	100/8*7,	1,	100/7*6,	1,	100/6*5,	1,	100/5*4,	1,	100/4*3	)
	local Slg2 = colorCalc("slg",	2,	7,	1,	100/8*6,	1,	100/7*5,	1,	100/6*4,	1,	100/5*3,	1,	100/4*2	)
	local Slg3 = colorCalc("slg",	3,	7,	1,	100/8*5,	1,	100/7*4,	1,	100/6*3,	1,	100/5*2,	1,	100/4	)
	local Slg4 = colorCalc("slg",	4,	7,	1,	100/8*4,	1,	100/7*3,	1,	100/6*2,	1,	100/5,		2,	0		)
	local Slg5 = colorCalc("slg",	5,	7,	1,	100/8*3,	1,	100/7*2,	1,	100/6,		2,	0,			3,	100/4	)
	local Slg6 = colorCalc("slg",	6,	7,	1,	100/8*2,	1,	100/7, 		2,	0,			3,	100/5,		3,	100/4*2	)
	local Slg7 = colorCalc("slg",	7,	7,	1,	100/8,		2,	0,			3,	100/6,		3,	100/5*2,	3,	100/4*3	)
	local Slg8 = colorCalc("slg",	8,	9,	2,	0,			3,	100/7,		3,	100/6*2,	3,	100/5*3,	0,	0		)
	local Slg9 = colorCalc("slg",	9,	9,	3,	100/8,		3,	100/7*2,	3,	100/6*3,	3,	100/5*4,	0,	0		)
	local Slg10 = colorCalc("slg",	10,	11,	3,	100/8*2,	3,	100/7*3,	3,	100/6*4,	0,	0,			0,	0		)
	local Slg11 = colorCalc("slg",	11,	11,	3,	100/8*3,	3,	100/7*4,	3,	100/6*5,	0,	0,			0,	0		)
	local Slg12 = colorCalc("slg",	12,	13,	3,	100/8*4,	3,	100/7*5,	0,	0,			0,	0,			0,	0		)
	local Slg13 = colorCalc("slg",	13,	13,	3,	100/8*5,	3,	100/7*6,	0,	0,			0,	0,			0,	0		)
	local Slg14 = colorCalc("slg",	14,	15,	3,	100/8*6,	0,	0,			0,	0,			0,	0,			0,	0		)
	local Slg15 = colorCalc("slg",	15,	15,	3,	100/8*7,	0,	0,			0,	0,			0,	0,			0,	0		)

-- SATURATION
	local Sat1 = colorCalc("sat",	1,	7,	1,	100/8*7,	1,	100/7*6,	1,	100/6*5,	1,	100/5*4,	1,	100/4*3	)
	local Sat2 = colorCalc("sat",	2,	7,	1,	100/8*6,	1,	100/7*5,	1,	100/6*4,	1,	100/5*3,	1,	100/4*2	)
	local Sat3 = colorCalc("sat",	3,	7,	1,	100/8*5,	1,	100/7*4,	1,	100/6*3,	1,	100/5*2,	1,	100/4	)
	local Sat4 = colorCalc("sat",	4,	7,	1,	100/8*4,	1,	100/7*3,	1,	100/6*2,	1,	100/5,		2,	0		)
	local Sat5 = colorCalc("sat",	5,	7,	1,	100/8*3,	1,	100/7*2,	1,	100/6,		2,	0,			3,	100/4	)
	local Sat6 = colorCalc("sat",	6,	7,	1,	100/8*2,	1,	100/7, 		2,	0,			3,	100/5,		3,	100/4*2	)
	local Sat7 = colorCalc("sat",	7,	7,	1,	100/8,		2,	0,			3,	100/6,		3,	100/5*2,	3,	100/4*3	)
	local Sat8 = colorCalc("sat",	8,	9,	2,	0,			3,	100/7,		3,	100/6*2,	3,	100/5*3,	0,	0		)
	local Sat9 = colorCalc("sat",	9,	9,	3,	100/8,		3,	100/7*2,	3,	100/6*3,	3,	100/5*4,	0,	0		)
	local Sat10 = colorCalc("sat",	10,	11,	3,	100/8*2,	3,	100/7*3,	3,	100/6*4,	0,	0,			0,	0		)
	local Sat11 = colorCalc("sat",	11,	11,	3,	100/8*3,	3,	100/7*4,	3,	100/6*5,	0,	0,			0,	0		)
	local Sat12 = colorCalc("sat",	12,	13,	3,	100/8*4,	3,	100/7*5,	0,	0,			0,	0,			0,	0		)
	local Sat13 = colorCalc("sat",	13,	13,	3,	100/8*5,	3,	100/7*6,	0,	0,			0,	0,			0,	0		)
	local Sat14 = colorCalc("sat",	14,	15,	3,	100/8*6,	0,	0,			0,	0,			0,	0,			0,	0		)
	local Sat15 = colorCalc("sat",	15,	15,	3,	100/8*7,	0,	0,			0,	0,			0,	0,			0,	0		)

-- SOFT SATURATION
	local Sst1 = colorCalc("sst",	1,	7,	1,	100/8*7,	1,	100/7*6,	1,	100/6*5,	1,	100/5*4,	1,	100/4*3	)
	local Sst2 = colorCalc("sst",	2,	7,	1,	100/8*6,	1,	100/7*5,	1,	100/6*4,	1,	100/5*3,	1,	100/4*2	)
	local Sst3 = colorCalc("sst",	3,	7,	1,	100/8*5,	1,	100/7*4,	1,	100/6*3,	1,	100/5*2,	1,	100/4	)
	local Sst4 = colorCalc("sst",	4,	7,	1,	100/8*4,	1,	100/7*3,	1,	100/6*2,	1,	100/5,		2,	0		)
	local Sst5 = colorCalc("sst",	5,	7,	1,	100/8*3,	1,	100/7*2,	1,	100/6,		2,	0,			3,	100/4	)
	local Sst6 = colorCalc("sst",	6,	7,	1,	100/8*2,	1,	100/7, 		2,	0,			3,	100/5,		3,	100/4*2	)
	local Sst7 = colorCalc("sst",	7,	7,	1,	100/8,		2,	0,			3,	100/6,		3,	100/5*2,	3,	100/4*3	)
	local Sst8 = colorCalc("sst",	8,	9,	2,	0,			3,	100/7,		3,	100/6*2,	3,	100/5*3,	0,	0		)
	local Sst9 = colorCalc("sst",	9,	9,	3,	100/8,		3,	100/7*2,	3,	100/6*3,	3,	100/5*4,	0,	0		)
	local Sst10 = colorCalc("sst",	10,	11,	3,	100/8*2,	3,	100/7*3,	3,	100/6*4,	0,	0,			0,	0		)
	local Sst11 = colorCalc("sst",	11,	11,	3,	100/8*3,	3,	100/7*4,	3,	100/6*5,	0,	0,			0,	0		)
	local Sst12 = colorCalc("sst",	12,	13,	3,	100/8*4,	3,	100/7*5,	0,	0,			0,	0,			0,	0		)
	local Sst13 = colorCalc("sst",	13,	13,	3,	100/8*5,	3,	100/7*6,	0,	0,			0,	0,			0,	0		)
	local Sst14 = colorCalc("sst",	14,	15,	3,	100/8*6,	0,	0,			0,	0,			0,	0,			0,	0		)
	local Sst15 = colorCalc("sst",	15,	15,	3,	100/8*7,	0,	0,			0,	0,			0,	0,			0,	0		)

-- SOFT HUE
	local Shu1 = hueCalc("shu",		1,	4,	1,	0,			1,	0,			1,	0,			1,	0,			1,	0		)
	local Shu2 = hueCalc("shu",		2,	4,	2,	100/18	,	2,	100/12,		2,	100/8,		2,	100/6,		2,	100/4	)
	local Shu3 = hueCalc("shu",		3,	4,	2,	100/18*2,	2,	100/12*2,	2,	100/8*2,	2,	100/6*2,	2,	100/4*2	)
	local Shu4 = hueCalc("shu",		4,	4,	2,	100/18*3,	2,	100/12*3,	2,	100/8*3,	2,	100/6*3,	2,	100/4*3	)
	local Shu5 = hueCalc("shu",		5,	6,	2,	100/18*4,	2,	100/12*4,	2,	100/8*4,	2,	100/6*4,	0,	0		)
	local Shu6 = hueCalc("shu",		6,	6,	2,	100/18*5,	2,	100/12*5, 	2,	100/8*5,	2,	100/6*5,	0,	0		)
	local Shu7 = hueCalc("shu",		7,	8,	2,	100/18*6,	2,	100/12*6,	2,	100/8*6,	0,	0,			0,	0		)
	local Shu8 = hueCalc("shu",		8,	8,	2,	100/18*7,	2,	100/12*7,	2,	100/8*7,	0,	0,			0,	0		)
	local Shu9 = hueCalc("shu",		9,	12,	2,	100/18*8,	2,	100/12*8,	0,	0,			0,	0,			0,	0		)
	local Shu10 = hueCalc("shu",	10,	12,	2,	100/18*9,	2,	100/12*9,	0,	0,			0,	0,			0,	0		)
	local Shu11 = hueCalc("shu",	11,	12,	2,	100/18*10,	2,	100/12*10,	0,	0,			0,	0,			0,	0		)
	local Shu12 = hueCalc("shu",	12,	12,	2,	100/18*11,	2,	100/12*11,	0,	0,			0,	0,			0,	0		)
	local Shu13 = hueCalc("shu",	13,	18,	2,	100/18*12,	0,	0,			0,	0,			0,	0,			0,	0		)
	local Shu14 = hueCalc("shu",	14,	18,	2,	100/18*13,	0,	0,			0,	0,			0,	0,			0,	0		)
	local Shu15 = hueCalc("shu",	15,	18,	2,	100/18*15,	0,	0,			0,	0,			0,	0,			0,	0		)
	local Shu16 = hueCalc("shu",	16,	18,	2,	100/18*16,	0,	0,			0,	0,			0,	0,			0,	0		)
	local Shu17 = hueCalc("shu",	17,	18,	2,	100/18*17,	0,	0,			0,	0,			0,	0,			0,	0		)

-- HARD HUE
	local Hhu1 = hueCalc("hhu",		1,	4,	1,	0,			1,	0,			1,	0,			1,	0,			1,	0		)
	local Hhu2 = hueCalc("hhu",		2,	4,	2,	100/18	,	2,	100/12,		2,	100/8,		2,	100/6,		2,	100/4	)
	local Hhu3 = hueCalc("hhu",		3,	4,	2,	100/18*2,	2,	100/12*2,	2,	100/8*2,	2,	100/6*2,	2,	100/4*2	)
	local Hhu4 = hueCalc("hhu",		4,	4,	2,	100/18*3,	2,	100/12*3,	2,	100/8*3,	2,	100/6*3,	2,	100/4*3	)
	local Hhu5 = hueCalc("hhu",		5,	6,	2,	100/18*4,	2,	100/12*4,	2,	100/8*4,	2,	100/6*4,	0,	0		)
	local Hhu6 = hueCalc("hhu",		6,	6,	2,	100/18*5,	2,	100/12*5, 	2,	100/8*5,	2,	100/6*5,	0,	0		)
	local Hhu7 = hueCalc("hhu",		7,	8,	2,	100/18*6,	2,	100/12*6,	2,	100/8*6,	0,	0,			0,	0		)
	local Hhu8 = hueCalc("hhu",		8,	8,	2,	100/18*7,	2,	100/12*7,	2,	100/8*7,	0,	0,			0,	0		)
	local Hhu9 = hueCalc("hhu",		9,	12,	2,	100/18*8,	2,	100/12*8,	0,	0,			0,	0,			0,	0		)
	local Hhu10 = hueCalc("hhu",	10,	12,	2,	100/18*9,	2,	100/12*9,	0,	0,			0,	0,			0,	0		)
	local Hhu11 = hueCalc("hhu",	11,	12,	2,	100/18*10,	2,	100/12*10,	0,	0,			0,	0,			0,	0		)
	local Hhu12 = hueCalc("hhu",	12,	12,	2,	100/18*11,	2,	100/12*11,	0,	0,			0,	0,			0,	0		)
	local Hhu13 = hueCalc("hhu",	13,	18,	2,	100/18*12,	0,	0,			0,	0,			0,	0,			0,	0		)
	local Hhu14 = hueCalc("hhu",	14,	18,	2,	100/18*13,	0,	0,			0,	0,			0,	0,			0,	0		)
	local Hhu15 = hueCalc("hhu",	15,	18,	2,	100/18*15,	0,	0,			0,	0,			0,	0,			0,	0		)
	local Hhu16 = hueCalc("hhu",	16,	18,	2,	100/18*16,	0,	0,			0,	0,			0,	0,			0,	0		)
	local Hhu17 = hueCalc("hhu",	17,	18,	2,	100/18*17,	0,	0,			0,	0,			0,	0,			0,	0		)

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
		colors = {CL, CM, CR, CC},
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
				CL = app.fgColor
				reloadColors(dlg.bounds)
				dlg:close()
		end
	}
	:button
	{
		id = "buttonSetMain",
		text = "Set",
		onclick = function()
				CM = app.fgColor
				reloadColors(dlg.bounds)
				dlg:close()
		end
	}
	:button
	{
		id = "buttonSetRight",
		text = "Set",
		onclick = function(ev)
				CR = app.fgColor
				reloadColors(dlg.bounds)
				dlg:close()
		end
	}
	:button
	{
		id = "buttonSetClipboard",
		text = "Set",
		onclick = function(ev)
				CC = app.fgColor
				reloadColors(dlg.bounds)
				dlg:close()
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
		option = AOC,
		options =
		{
			"7",
			"9",
			"11",
			"13",
			"15"
		},
		onchange = function()
			AOC = dlg.data.amountOfColors
		end
	}
	:combobox
	{
		id = "amountOfHues",
		option = AOH,
		options =
		{
			"4",
			"6",
			"8",
			"12",
			"18"
		},
		onchange = function()
			AOH = dlg.data.amountOfHues
		end
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
		id = "hueInterpolation",
		option = HI,
		options =
		{
			"Standard",
			"Sine",
			"Quad",
			"Cubic",
			"Circ",
			"Linear",
			"outSine",
			"outQuad",
			"outCubic",
			"outCirc"
		},
		onchange = function()
			HI = dlg.data.hueInterpolation
		end
	}
	:combobox
	{
		id = "satInterpolation",
		option = SI,
		options =
		{
			"Standard",
			"Sine",
			"Quad",
			"Cubic",
			"Circ",
			"Linear",
			"outSine",
			"outQuad",
			"outCubic",
			"outCirc"
		},
		onchange = function()
			SI = dlg.data.satInterpolation
		end
	}
	:combobox
	{
		id = "valInterpolation",
		option = VI,
		options =
		{
			"Standard",
			"Sine",
			"Quad",
			"Cubic",
			"Circ",
			"Linear",
			"outSine",
			"outQuad",
			"outCubic",
			"outCirc"
		},
		onchange = function()
			VI = dlg.data.valInterpolation
		end
	}
	:combobox
	{
		id = "alphaInterpolation",
		option = AI,
		options =
		{
			"Standard",
			"Sine",
			"Quad",
			"Cubic",
			"Circ",
			"Linear",
			"outSine",
			"outQuad",
			"outCubic",
			"outCirc"
		},
		onchange = function()
			AI = dlg.data.alphaInterpolation
		end
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
		colors = {Sha1, Sha2, Sha3, Sha4, Sha5, Sha6, Sha7, Sha8, Sha9, Sha10, Sha11, Sha12, Sha13, Sha14, Sha15},
		onclick = function(ev)
			if (ev.button == MouseButton.LEFT) then
				app.fgColor = ev.color
			end
		end
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
		colors = {Ssh1, Ssh2, Ssh3, Ssh4, Ssh5, Ssh6, Ssh7, Ssh8, Ssh9, Ssh10, Ssh11, Ssh12, Ssh13, Ssh14, Ssh15},
		onclick = function(ev)
			if (ev.button == MouseButton.LEFT) then
				app.fgColor = ev.color
			end
		end
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
		colors = {Lig1, Lig2, Lig3, Lig4, Lig5, Lig6, Lig7, Lig8, Lig9, Lig10, Lig11, Lig12, Lig13, Lig14, Lig15},
		onclick = function(ev)
			if (ev.button == MouseButton.LEFT) then
				app.fgColor = ev.color
			end
		end
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
		colors = {Slg1, Slg2, Slg3, Slg4, Slg5, Slg6, Slg7, Slg8, Slg9, Slg10, Slg11, Slg12, Slg13, Slg14, Slg15},
		onclick = function(ev)
			if (ev.button == MouseButton.LEFT) then
				app.fgColor = ev.color
			end
		end
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
		colors = {Sat1, Sat2, Sat3, Sat4, Sat5, Sat6, Sat7, Sat8, Sat9, Sat10, Sat11, Sat12, Sat13, Sat14, Sat15},
		onclick = function(ev)
			if (ev.button == MouseButton.LEFT) then
				app.fgColor = ev.color
			end
		end
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
		colors = {Sst1, Sst2, Sst3, Sst4, Sst5, Sst6, Sst7, Sst8, Sst9, Sst10, Sst11, Sst12, Sst13, Sst14, Sst15},
		onclick = function(ev)
			if (ev.button == MouseButton.LEFT) then
				app.fgColor = ev.color
			end
		end
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
		colors = {Shu1, Shu2, Shu3, Shu4, Shu5, Shu6, Shu7, Shu8, Shu9, Shu10, Shu11, Shu12, Shu13, Shu14, Shu15, Shu16, Shu17, Shu18},
		onclick = function(ev)
			if (ev.button == MouseButton.LEFT) then
				app.fgColor = ev.color
			end
		end
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
		colors = {Hhu1, Hhu2, Hhu3, Hhu4, Hhu5, Hhu6, Hhu7, Hhu8, Hhu9, Hhu10, Hhu11, Hhu12, Hhu13, Hhu14, Hhu15, Hhu16, Hhu17, Hhu18},
		onclick = function(ev)
			if (ev.button == MouseButton.LEFT) then
				app.fgColor = ev.color
			end
		end
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
		id = "buttonReset",
		text = "Reset",
		onclick = function()
			CL = ColorLeft
			CM = app.fgColor
			CR = ColorRight
			CC = ColorClipboard
			AOC = amountOfColorsVar
			AOH = amountOfHuesVar
			HI = hueInterpolationVar
			SI = satInterpolationVar
			VI = valInterpolationVar
			AI = alphaInterpolationVar
			reloadColors(dlg.bounds)
			dlg:close()
		end
	}
	:button
	{
		id = "buttonReload",
		text = "Reload",
		onclick = function()
			reloadColors(dlg.bounds)
			dlg:close()
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
	reloadColors()
end