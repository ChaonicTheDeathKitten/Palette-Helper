-- Chaonic's Palette Helper

-- YOU CAN MAKE CHANGES HERE UNTIL I SAY STOP

-- I WOULDN'T GO LOWER THAN 3, BUT GO NUTS
local minColors = 3
local maxColors = 32

-- YOUR CUSTOM PRESETS - IF YOU WANT TO GIVE THOSE A TRY!!!

-- PRESET CUSTOM 1
local presetcustom1name =						"Custom 1"
local presetcustom1colorLeft =					Color{ r = 0, g = 0, b = 0, a = 255 }
local presetcustom1colorRight =					Color{ r = 255, g = 255, b = 255, a = 255 }
local presetcustom1amountOfColorsVar =			15
local presetcustom1amountOfHuesVar =			12
local presetcustom1amountOfSoftHuesVar =		6
local presetcustom1hueStrength =				100
local presetcustom1satStrength =				100
local presetcustom1valStrenght =				100
local presetcustom1alpaStrength =				100
local presetcustom1hueInterpolationVar =		"Standard"
local presetcustom1satInterpolationVar =		"Quad"
local presetcustom1valInterpolationVar =		"Standard"
local presetcustom1alphaInterpolationVar =		"Quad"

-- PRESET CUSTOM 2
local presetcustom2name =						"Custom 2"
local presetcustom2colorLeft =					Color{ r = 0, g = 0, b = 0, a = 255 }
local presetcustom2colorRight =					Color{ r = 255, g = 255, b = 255, a = 255 }
local presetcustom2amountOfColorsVar =			15
local presetcustom2amountOfHuesVar =			12
local presetcustom2amountOfSoftHuesVar =		6
local presetcustom2hueStrength =				100
local presetcustom2satStrength =				100
local presetcustom2valStrenght =				100
local presetcustom2alpaStrength =				100
local presetcustom2hueInterpolationVar =		"Standard"
local presetcustom2satInterpolationVar =		"Quad"
local presetcustom2valInterpolationVar =		"Standard"
local presetcustom2alphaInterpolationVar =		"Quad"

-- PRESET CUSTOM 3
local presetcustom3name =						"Custom 3"
local presetcustom3colorLeft =					Color{ r = 0, g = 0, b = 0, a = 255 }
local presetcustom3colorRight =					Color{ r = 255, g = 255, b = 255, a = 255 }
local presetcustom3amountOfColorsVar =			15
local presetcustom3amountOfHuesVar =			12
local presetcustom3amountOfSoftHuesVar =		6
local presetcustom3hueStrength =				100
local presetcustom3satStrength =				100
local presetcustom3valStrenght =				100
local presetcustom3alpaStrength =				100
local presetcustom3hueInterpolationVar =		"Standard"
local presetcustom3satInterpolationVar =		"Quad"
local presetcustom3valInterpolationVar =		"Standard"
local presetcustom3alphaInterpolationVar =		"Quad"

-- PRESET CUSTOM 4
local presetcustom4name =						"Custom 4"
local presetcustom4colorLeft =					Color{ r = 0, g = 0, b = 0, a = 255 }
local presetcustom4colorRight =					Color{ r = 255, g = 255, b = 255, a = 255 }
local presetcustom4amountOfColorsVar =			15
local presetcustom4amountOfHuesVar =			12
local presetcustom4amountOfSoftHuesVar =		6
local presetcustom4hueStrength =				100
local presetcustom4satStrength =				100
local presetcustom4valStrenght =				100
local presetcustom4alpaStrength =				100
local presetcustom4hueInterpolationVar =		"Standard"
local presetcustom4satInterpolationVar =		"Quad"
local presetcustom4valInterpolationVar =		"Standard"
local presetcustom4alphaInterpolationVar =		"Quad"

-- STOP MAKING CHANGES HERE (UNLESS YOU KNOW WHAT YOU ARE DOING)

-- STANDARD VALUES

local colorLeft = Color{ r = 15, g = 15, b = 30, a = 255 }
local colorMain = app.fgColor
local colorRight = Color{ r = 245, g = 245, b = 230, a = 255 }
local colorClipboard = Color{ r = 0, g = 0, b = 0, a = 0 }
local amountOfColorsVar = 15
local amountOfHuesVar = 12
local amountOfSoftHuesVar = 6
local hueStrength = 100
local satStrength = 100
local valStrenght = 100
local alpaStrength = 100
local hueInterpolationVar = "Standard"
local satInterpolationVar = "Quad"
local valInterpolationVar = "Standard"
local alphaInterpolationVar = "Quad"
local calcTable = {}
local genericColorTable = {}

-- CHANGED VALUES

local CL = colorLeft
local CM = Color{}
CM.red = colorMain.red
CM.green = colorMain.green
CM.blue = colorMain.blue
CM.alpha = colorMain.alpha
local CR = colorRight
local CC = colorClipboard
local AOC = amountOfColorsVar
local AOH = amountOfHuesVar
local AOSH = amountOfSoftHuesVar
local HS = hueStrength
local SS = satStrength
local VS = valStrenght
local AS = alpaStrength
local HI = hueInterpolationVar
local SI = satInterpolationVar
local VI = valInterpolationVar
local AI = alphaInterpolationVar
local CT = calcTable


-- EASING CALCULATIONS

-- These calculations were taken from https://github.com/EmmanuelOga/easing
-- The authors of the LUA port are Yuichi Tateno and Emmanuel Oga

--[[
    MIT LICENSE
    Copyright (c) 2014 Enrique García Cota, Yuichi Tateno, Emmanuel Oga
    Permission is hereby granted, free of charge, to any person obtaining a
    copy of this software and associated documentation files (the
    "Software"), to deal in the Software without restriction, including
    without limitation the rights to use, copy, modify, merge, publish,
    distribute, sublicense, and/or sell copies of the Software, and to
    permit persons to whom the Software is furnished to do so, subject to
    the following conditions:
    The above copyright notice and this permission notice shall be included
    in all copies or substantial portions of the Software.
    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
    OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
    MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
    IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
    CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
    TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
    SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
  ]]

-- For all easing functions:
-- t = elapsed time
-- b = begin
-- c = change == ending - beginning
-- d = duration (total time)

local sin = math.sin
local cos = math.cos
local pi = math.pi
local sqrt = math.sqrt

local function linear(t, b, c, d)
  return c * t / d + b
end

local function inQuad(t, b, c, d)
  t = t / d
  return c * t^2 + b
end

local function outQuad(t, b, c, d)
  t = t / d
  return -c * t * (t - 2) + b
end

local function inCubic (t, b, c, d)
  t = t / d
  return c * t^3 + b
end

local function outCubic(t, b, c, d)
  t = t / d - 1
  return c * (t^3 + 1) + b
end

local function inSine(t, b, c, d)
  return -c * cos(t / d * (pi / 2)) + c + b
end

local function outSine(t, b, c, d)
  return c * sin(t / d * (pi / 2)) + b
end

local function inCirc(t, b, c, d)
  t = t / d
  return(-c * (sqrt(1 - t^2) - 1) + b)
end

local function outCirc(t, b, c, d)
  t = t / d - 1
  return(c * sqrt(1 - t^2) + b)
end


-- END OF EASING CALCULATIONS

-- CALCULATION TABLE GENERATION

local function generateCalcTable()
local hasCenter = false
local copyColorAmount = AOC
local tempTable = {}

	-- If it has a center, remove and mark it
	if copyColorAmount %2 == 1 then
		copyColorAmount = copyColorAmount -1
		hasCenter = true
	end
	
	-- Halve the number, we'll mirror it later
	copyColorAmount = copyColorAmount/2
	
	-- Let's get the actual numbers
	local addNumber = 0
	if hasCenter == true then
		for i = 1 , copyColorAmount do
			addNumber = math.abs(1-(i * (100/(copyColorAmount+1)))/100)
			table.insert(tempTable, addNumber)
		end
		table.insert(tempTable, 0)
		for i = 1 , copyColorAmount do
			addNumber = (i * (100/(copyColorAmount+1)))/100
			table.insert(tempTable, addNumber)
		end
	else
		for i = 1 , copyColorAmount do
			addNumber = ((100/copyColorAmount)*(copyColorAmount-(i*((copyColorAmount*2)/(copyColorAmount*2+1)))))/100
			table.insert(tempTable, addNumber)
		end
		for i = 1 , copyColorAmount do
			addNumber = ((100/copyColorAmount)*(math.abs((((copyColorAmount*2)/(copyColorAmount*2+1))*copyColorAmount)-copyColorAmount)+((i-1)*((copyColorAmount*2)/(copyColorAmount*2+1)))))/100
			table.insert(tempTable, addNumber)
		end
	end
	CT = tempTable
	-- -- DEBUG
	-- for k,v in pairs(tempTable) do
	-- print(v)  
	-- end
	-- -- DEBUG END
end


-- COLOR TABLE GENERATION

local function generateColorTable()
	genericColorTable = {}
	for i = 1 , AOC do
		table.insert(genericColorTable, CM)
	end
end


local function paletteShadeCalc()
	paletteShade = {}
	local copyColorAmount = AOC
	local secondRound = 0
	local hasCenter = false

	
	-- If it has a center, remove and mark it
	if copyColorAmount %2 == 1 then
		copyColorAmount = copyColorAmount -1
		hasCenter = true
	end
	
	-- Halve the number and prepare the second round
	copyColorAmount = copyColorAmount/2
	secondRound = copyColorAmount
	
	-- Let's get the actual table now
	-- Starting with left color to main color
	for i = 1, copyColorAmount do
		local tempColor = Color{}
		if HI == "Standard" then
			tempColor.red = linear(CT[i]*(HS/100), CM.red, CL.red-CM.red, 1)
			tempColor.green = linear(CT[i]*(HS/100), CM.green, CL.green-CM.green, 1)
			tempColor.blue = linear(CT[i]*(HS/100), CM.blue, CL.blue-CM.blue, 1)
		elseif HI == "Sine" then
			tempColor.red = inSine(CT[i]*(HS/100), CM.red, CL.red-CM.red, 1)
			tempColor.green = inSine(CT[i]*(HS/100), CM.green, CL.green-CM.green, 1)
			tempColor.blue = inSine(CT[i]*(HS/100), CM.blue, CL.blue-CM.blue, 1)
		elseif HI == "Quad" then
			tempColor.red = inQuad(CT[i]*(HS/100), CM.red, CL.red-CM.red, 1)
			tempColor.green = inQuad(CT[i]*(HS/100), CM.green, CL.green-CM.green, 1)
			tempColor.blue = inQuad(CT[i]*(HS/100), CM.blue, CL.blue-CM.blue, 1)
		elseif HI == "Cubic" then
			tempColor.red = inCubic(CT[i]*(HS/100), CM.red, CL.red-CM.red, 1)
			tempColor.green = inCubic(CT[i]*(HS/100), CM.green, CL.green-CM.green, 1)
			tempColor.blue = inCubic(CT[i]*(HS/100), CM.blue, CL.blue-CM.blue, 1)
		elseif HI == "Circ" then
			tempColor.red = inCirc(CT[i]*(HS/100), CM.red, CL.red-CM.red, 1)
			tempColor.green = inCirc(CT[i]*(HS/100), CM.green, CL.green-CM.green, 1)
			tempColor.blue = inCirc(CT[i]*(HS/100), CM.blue, CL.blue-CM.blue, 1)
		elseif HI == "outSine" then
			tempColor.red = outSine(CT[i]*(HS/100), CM.red, CL.red-CM.red, 1)
			tempColor.green = outSine(CT[i]*(HS/100), CM.green, CL.green-CM.green, 1)
			tempColor.blue = outSine(CT[i]*(HS/100), CM.blue, CL.blue-CM.blue, 1)
		elseif HI == "outQuad" then
			tempColor.red = outQuad(CT[i]*(HS/100), CM.red, CL.red-CM.red, 1)
			tempColor.green = outQuad(CT[i]*(HS/100), CM.green, CL.green-CM.green, 1)
			tempColor.blue = outQuad(CT[i]*(HS/100), CM.blue, CL.blue-CM.blue, 1)
		elseif HI == "outCubic" then
			tempColor.red = outCubic(CT[i]*(HS/100), CM.red, CL.red-CM.red, 1)
			tempColor.green = outCubic(CT[i]*(HS/100), CM.green, CL.green-CM.green, 1)
			tempColor.blue = outCubic(CT[i]*(HS/100), CM.blue, CL.blue-CM.blue, 1)
		elseif HI == "outCirc" then
			tempColor.red = outCirc(CT[i]*(HS/100), CM.red, CL.red-CM.red, 1)
			tempColor.green = outCirc(CT[i]*(HS/100), CM.green, CL.green-CM.green, 1)
			tempColor.blue = outCirc(CT[i]*(HS/100), CM.blue, CL.blue-CM.blue, 1)
		end
		if SI == "Standard" then
			tempColor.saturation = tempColor.saturation
		elseif SI == "Linear" then
			tempColor.saturation = linear(CT[i]*(SS/100), CM.saturation, CL.saturation-CM.saturation, 1)
		elseif SI == "Sine" then
			tempColor.saturation = inSine(CT[i]*(SS/100), CM.saturation, CL.saturation-CM.saturation, 1)
		elseif SI == "Quad" then
			tempColor.saturation = inQuad(CT[i]*(SS/100), CM.saturation, CL.saturation-CM.saturation, 1)
		elseif SI == "Cubic" then
			tempColor.saturation = inCubic(CT[i]*(SS/100), CM.saturation, CL.saturation-CM.saturation, 1)
		elseif SI == "Circ" then
			tempColor.saturation = inCirc(CT[i]*(SS/100), CM.saturation, CL.saturation-CM.saturation, 1)
		elseif SI == "outSine" then
			tempColor.saturation = outSine(CT[i]*(SS/100), CM.saturation, CL.saturation-CM.saturation, 1)
		elseif SI == "outQuad" then
			tempColor.saturation = outQuad(CT[i]*(SS/100), CM.saturation, CL.saturation-CM.saturation, 1)
		elseif SI == "outCubic" then
			tempColor.saturation = outCubic(CT[i]*(SS/100), CM.saturation, CL.saturation-CM.saturation, 1)
		elseif SI == "outCirc" then
			tempColor.saturation = outCirc(CT[i]*(SS/100), CM.saturation, CL.saturation-CM.saturation, 1)
		end
		if VI == "Standard" then
			tempColor.value = tempColor.value
		elseif VI == "Linear" then
			tempColor.value = linear(CT[i]*(VS/100), CM.value, CL.value-CM.value, 1)
		elseif VI == "Sine" then
			tempColor.value = inSine(CT[i]*(VS/100), CM.value, CL.value-CM.value, 1)
		elseif VI == "Quad" then
			tempColor.value = inQuad(CT[i]*(VS/100), CM.value, CL.value-CM.value, 1)
		elseif VI == "Cubic" then
			tempColor.value = inCubic(CT[i]*(VS/100), CM.value, CL.value-CM.value, 1)
		elseif VI == "Circ" then
			tempColor.value = inCirc(CT[i]*(VS/100), CM.value, CL.value-CM.value, 1)
		elseif VI == "outSine" then
			tempColor.value = outSine(CT[i]*(VS/100), CM.value, CL.value-CM.value, 1)
		elseif VI == "outQuad" then
			tempColor.value = outQuad(CT[i]*(VS/100), CM.value, CL.value-CM.value, 1)
		elseif VI == "outCubic" then
			tempColor.value = outCubic(CT[i]*(VS/100), CM.value, CL.value-CM.value, 1)
		elseif VI == "outCirc" then
			tempColor.value = outCirc(CT[i]*(VS/100), CM.value, CL.value-CM.value, 1)
		end
		if AI == "Standard" then
			tempColor.alpha = tempColor.alpha
		elseif AI == "Linear" then
			tempColor.alpha = linear(CT[i]*(AS/100), CM.alpha, CL.alpha-CM.alpha, 1)
		elseif AI == "Sine" then
			tempColor.alpha = inSine(CT[i]*(AS/100), CM.alpha, CL.alpha-CM.alpha, 1)
		elseif AI == "Quad" then
			tempColor.alpha = inQuad(CT[i]*(AS/100), CM.alpha, CL.alpha-CM.alpha, 1)
		elseif AI == "Cubic" then
			tempColor.alpha = inCubic(CT[i]*(AS/100), CM.alpha, CL.alpha-CM.alpha, 1)
		elseif AI == "Circ" then
			tempColor.alpha = inCirc(CT[i]*(AS/100), CM.alpha, CL.alpha-CM.alpha, 1)
		elseif AI == "outSine" then
			tempColor.alpha = outSine(CT[i]*(AS/100), CM.alpha, CL.alpha-CM.alpha, 1)
		elseif AI == "outQuad" then
			tempColor.alpha = outQuad(CT[i]*(AS/100), CM.alpha, CL.alpha-CM.alpha, 1)
		elseif AI == "outCubic" then
			tempColor.alpha = outCubic(CT[i]*(AS/100), CM.alpha, CL.alpha-CM.alpha, 1)
		elseif AI == "outCirc" then
			tempColor.alpha = outCirc(CT[i]*(AS/100), CM.alpha, CL.alpha-CM.alpha, 1)
		end
		table.insert(paletteShade, tempColor)
	end
	-- If it has a center, just add the main color in the middle
	if hasCenter == true then
		table.insert(paletteShade, CM)
		secondRound = secondRound + 1
	end
	-- Lastly, main color to right color
	for y = 1, copyColorAmount do
		local tempColor = Color{}
		if HI == "Standard" then
			tempColor.red = linear(CT[y+secondRound]*(HS/100), CM.red, CR.red-CM.red, 1)
			tempColor.green = linear(CT[y+secondRound]*(HS/100), CM.green, CR.green-CM.green, 1)
			tempColor.blue = linear(CT[y+secondRound]*(HS/100), CM.blue, CR.blue-CM.blue, 1)
		elseif HI == "Sine" then
			tempColor.red = inSine(CT[y+secondRound]*(HS/100), CM.red, CR.red-CM.red, 1)
			tempColor.green = inSine(CT[y+secondRound]*(HS/100), CM.green, CR.green-CM.green, 1)
			tempColor.blue = inSine(CT[y+secondRound]*(HS/100), CM.blue, CR.blue-CM.blue, 1)
		elseif HI == "Quad" then
			tempColor.red = inQuad(CT[y+secondRound]*(HS/100), CM.red, CR.red-CM.red, 1)
			tempColor.green = inQuad(CT[y+secondRound]*(HS/100), CM.green, CR.green-CM.green, 1)
			tempColor.blue = inQuad(CT[y+secondRound]*(HS/100), CM.blue, CR.blue-CM.blue, 1)
		elseif HI == "Cubic" then
			tempColor.red = inCubic(CT[y+secondRound]*(HS/100), CM.red, CR.red-CM.red, 1)
			tempColor.green = inCubic(CT[y+secondRound]*(HS/100), CM.green, CR.green-CM.green, 1)
			tempColor.blue = inCubic(CT[y+secondRound]*(HS/100), CM.blue, CR.blue-CM.blue, 1)
		elseif HI == "Circ" then
			tempColor.red = inCirc(CT[y+secondRound]*(HS/100), CM.red, CR.red-CM.red, 1)
			tempColor.green = inCirc(CT[y+secondRound]*(HS/100), CM.green, CR.green-CM.green, 1)
			tempColor.blue = inCirc(CT[y+secondRound]*(HS/100), CM.blue, CR.blue-CM.blue, 1)
		elseif HI == "outSine" then
			tempColor.red = outSine(CT[y+secondRound]*(HS/100), CM.red, CR.red-CM.red, 1)
			tempColor.green = outSine(CT[y+secondRound]*(HS/100), CM.green, CR.green-CM.green, 1)
			tempColor.blue = outSine(CT[y+secondRound]*(HS/100), CM.blue, CR.blue-CM.blue, 1)
		elseif HI == "outQuad" then
			tempColor.red = outQuad(CT[y+secondRound]*(HS/100), CM.red, CR.red-CM.red, 1)
			tempColor.green = outQuad(CT[y+secondRound]*(HS/100), CM.green, CR.green-CM.green, 1)
			tempColor.blue = outQuad(CT[y+secondRound]*(HS/100), CM.blue, CR.blue-CM.blue, 1)
		elseif HI == "outCubic" then
			tempColor.red = outCubic(CT[y+secondRound]*(HS/100), CM.red, CR.red-CM.red, 1)
			tempColor.green = outCubic(CT[y+secondRound]*(HS/100), CM.green, CR.green-CM.green, 1)
			tempColor.blue = outCubic(CT[y+secondRound]*(HS/100), CM.blue, CR.blue-CM.blue, 1)
		elseif HI == "outCirc" then
			tempColor.red = outCirc(CT[y+secondRound]*(HS/100), CM.red, CR.red-CM.red, 1)
			tempColor.green = outCirc(CT[y+secondRound]*(HS/100), CM.green, CR.green-CM.green, 1)
			tempColor.blue = outCirc(CT[y+secondRound]*(HS/100), CM.blue, CR.blue-CM.blue, 1)
		end
		if SI == "Standard" then
			tempColor.saturation = tempColor.saturation
		elseif SI == "Linear" then
			tempColor.saturation = linear(CT[y+secondRound]*(SS/100), CM.saturation, CR.saturation-CM.saturation, 1)
		elseif SI == "Sine" then
			tempColor.saturation = inSine(CT[y+secondRound]*(SS/100), CM.saturation, CR.saturation-CM.saturation, 1)
		elseif SI == "Quad" then
			tempColor.saturation = inQuad(CT[y+secondRound]*(SS/100), CM.saturation, CR.saturation-CM.saturation, 1)
		elseif SI == "Cubic" then
			tempColor.saturation = inCubic(CT[y+secondRound]*(SS/100), CM.saturation, CR.saturation-CM.saturation, 1)
		elseif SI == "Circ" then
			tempColor.saturation = inCirc(CT[y+secondRound]*(SS/100), CM.saturation, CR.saturation-CM.saturation, 1)
		elseif SI == "outSine" then
			tempColor.saturation = outSine(CT[y+secondRound]*(SS/100), CM.saturation, CR.saturation-CM.saturation, 1)
		elseif SI == "outQuad" then
			tempColor.saturation = outQuad(CT[y+secondRound]*(SS/100), CM.saturation, CR.saturation-CM.saturation, 1)
		elseif SI == "outCubic" then
			tempColor.saturation = outCubic(CT[y+secondRound]*(SS/100), CM.saturation, CR.saturation-CM.saturation, 1)
		elseif SI == "outCirc" then
			tempColor.saturation = outCirc(CT[y+secondRound]*(SS/100), CM.saturation, CR.saturation-CM.saturation, 1)
		end
		if VI == "Standard" then
			tempColor.value = tempColor.value
		elseif VI == "Linear" then
			tempColor.value = linear(CT[y+secondRound]*(VS/100), CM.value, CR.value-CM.value, 1)
		elseif VI == "Sine" then
			tempColor.value = inSine(CT[y+secondRound]*(VS/100), CM.value, CR.value-CM.value, 1)
		elseif VI == "Quad" then
			tempColor.value = inQuad(CT[y+secondRound]*(VS/100), CM.value, CR.value-CM.value, 1)
		elseif VI == "Cubic" then
			tempColor.value = inCubic(CT[y+secondRound]*(VS/100), CM.value, CR.value-CM.value, 1)
		elseif VI == "Circ" then
			tempColor.value = inCirc(CT[y+secondRound]*(VS/100), CM.value, CR.value-CM.value, 1)
		elseif VI == "outSine" then
			tempColor.value = outSine(CT[y+secondRound]*(VS/100), CM.value, CR.value-CM.value, 1)
		elseif VI == "outQuad" then
			tempColor.value = outQuad(CT[y+secondRound]*(VS/100), CM.value, CR.value-CM.value, 1)
		elseif VI == "outCubic" then
			tempColor.value = outCubic(CT[y+secondRound]*(VS/100), CM.value, CR.value-CM.value, 1)
		elseif VI == "outCirc" then
			tempColor.value = outCirc(CT[y+secondRound]*(VS/100), CM.value, CR.value-CM.value, 1)
		end
		if AI == "Standard" then
			tempColor.alpha = tempColor.alpha
		elseif AI == "Linear" then
			tempColor.alpha = linear(CT[y+secondRound]*(AS/100), CM.alpha, CR.alpha-CM.alpha, 1)
		elseif AI == "Sine" then
			tempColor.alpha = inSine(CT[y+secondRound]*(AS/100), CM.alpha, CR.alpha-CM.alpha, 1)
		elseif AI == "Quad" then
			tempColor.alpha = inQuad(CT[y+secondRound]*(AS/100), CM.alpha, CR.alpha-CM.alpha, 1)
		elseif AI == "Cubic" then
			tempColor.alpha = inCubic(CT[y+secondRound]*(AS/100), CM.alpha, CR.alpha-CM.alpha, 1)
		elseif AI == "Circ" then
			tempColor.alpha = inCirc(CT[y+secondRound]*(AS/100), CM.alpha, CR.alpha-CM.alpha, 1)
		elseif AI == "outSine" then
			tempColor.alpha = outSine(CT[y+secondRound]*(AS/100), CM.alpha, CR.alpha-CM.alpha, 1)
		elseif AI == "outQuad" then
			tempColor.alpha = outQuad(CT[y+secondRound]*(AS/100), CM.alpha, CR.alpha-CM.alpha, 1)
		elseif AI == "outCubic" then
			tempColor.alpha = outCubic(CT[y+secondRound]*(AS/100), CM.alpha, CR.alpha-CM.alpha, 1)
		elseif AI == "outCirc" then
			tempColor.alpha = outCirc(CT[y+secondRound]*(AS/100), CM.alpha, CR.alpha-CM.alpha, 1)
		end
		-- print (tempColor.saturation)
		table.insert(paletteShade, tempColor)
	end
	-- -- DEBUG
	-- for k,v in pairs(paletteShade) do
	-- print(v)  
	-- end
	-- -- DEBUG END
	return paletteShade
end


local function paletteLightCalc()
	paletteLight = {}
	local copyColorAmount = AOC
	local secondRound = 0
	local hasCenter = false
	
	-- If it has a center, remove and mark it
	if copyColorAmount %2 == 1 then
		copyColorAmount = copyColorAmount -1
		hasCenter = true
	end
	
	-- Halve the number and prepare the second round
	copyColorAmount = copyColorAmount/2
	secondRound = copyColorAmount
	
	-- Let's get the actual table now
	-- Starting with black to normal
	for i = 1, copyColorAmount do
		local tempColor = Color{}
		tempColor.red = CM.red
		tempColor.green = CM.green
		tempColor.blue = CM.blue
		tempColor.alpha = CM.alpha
		-- print (tempColor.lightness)
		if VI == "Standard" then
			tempColor.lightness = linear(CT[i]*(VS/100), CM.lightness, 0-CM.lightness, 1)
		elseif VI == "Linear" then
			tempColor.lightness = linear(CT[i]*(VS/100), CM.lightness, 0-CM.lightness, 1)
		elseif VI == "Sine" then
			tempColor.lightness = inSine(CT[i]*(VS/100), CM.lightness, 0-CM.lightness, 1)
		elseif VI == "Quad" then
			tempColor.lightness = inQuad(CT[i]*(VS/100), CM.lightness, 0-CM.lightness, 1)
		elseif VI == "Cubic" then
			tempColor.lightness = inCubic(CT[i]*(VS/100), CM.lightness, 0-CM.lightness, 1)
		elseif VI == "Circ" then
			tempColor.lightness = inCirc(CT[i]*(VS/100), CM.lightness, 0-CM.lightness, 1)
		elseif VI == "outSine" then
			tempColor.lightness = outSine(CT[i]*(VS/100), CM.lightness, 0-CM.lightness, 1)
		elseif VI == "outQuad" then
			tempColor.lightness = outQuad(CT[i]*(VS/100), CM.lightness, 0-CM.lightness, 1)
		elseif VI == "outCubic" then
			tempColor.lightness = outCubic(CT[i]*(VS/100), CM.lightness, 0-CM.lightness, 1)
		elseif VI == "outCirc" then
			tempColor.lightness = outCirc(CT[i]*(VS/100), CM.lightness, 0-CM.lightness, 1)
		end
		-- print (tempColor.lightness)
		table.insert(paletteLight, tempColor)
	end
	-- If it has a center, just add the main color in the middle
	if hasCenter == true then
		table.insert(paletteLight, CM)
		secondRound = secondRound + 1
	end
	-- Lastly, normal to white
	for y = 1, copyColorAmount do
		local tempColor = Color{}
		tempColor.red = CM.red
		tempColor.green = CM.green
		tempColor.blue = CM.blue
		tempColor.alpha = CM.alpha
		-- print (CT[y+secondRound])
		if VI == "Standard" then
			tempColor.lightness = linear(CT[y+secondRound]*(VS/100), CM.lightness, 1-CM.lightness, 1)
		elseif VI == "Linear" then
			tempColor.lightness = linear(CT[y+secondRound]*(VS/100), CM.lightness, 1-CM.lightness, 1)
		elseif VI == "Sine" then
			tempColor.lightness = inSine(CT[y+secondRound]*(VS/100), CM.lightness, 1-CM.lightness, 1)
		elseif VI == "Quad" then
			tempColor.lightness = inQuad(CT[y+secondRound]*(VS/100), CM.lightness, 1-CM.lightness, 1)
		elseif VI == "Cubic" then
			tempColor.lightness = inCubic(CT[y+secondRound]*(VS/100), CM.lightness, 1-CM.lightness, 1)
		elseif VI == "Circ" then
			tempColor.lightness = inCirc(CT[y+secondRound]*(VS/100), CM.lightness, 1-CM.lightness, 1)
		elseif VI == "outSine" then
			tempColor.lightness = outSine(CT[y+secondRound]*(VS/100), CM.lightness, 1-CM.lightness, 1)
		elseif VI == "outQuad" then
			tempColor.lightness = outQuad(CT[y+secondRound]*(VS/100), CM.lightness, 1-CM.lightness, 1)
		elseif VI == "outCubic" then
			tempColor.lightness = outCubic(CT[y+secondRound]*(VS/100), CM.lightness, 1-CM.lightness, 1)
		elseif VI == "outCirc" then
			tempColor.lightness = outCirc(CT[y+secondRound]*(VS/100), CM.lightness, 1-CM.lightness, 1)
		end
		-- print (tempColor.lightness)
		table.insert(paletteLight, tempColor)
	end
	-- -- DEBUG
	-- for k,v in pairs(paletteLight) do
	-- print(v)  
	-- end
	-- -- DEBUG END
	return paletteLight
end


local function paletteValueCalc()
	paletteValue = {}
	local copyColorAmount = AOC
	local secondRound = 0
	local hasCenter = false
	
	-- If it has a center, remove and mark it
	if copyColorAmount %2 == 1 then
		copyColorAmount = copyColorAmount -1
		hasCenter = true
	end
	
	-- Halve the number and prepare the second round
	copyColorAmount = copyColorAmount/2
	secondRound = copyColorAmount
	
	-- Let's get the actual table now
	-- Starting with black to normal
	for i = 1, copyColorAmount do
		local tempColor = Color{}
		tempColor.red = CM.red
		tempColor.green = CM.green
		tempColor.blue = CM.blue
		tempColor.alpha = CM.alpha
		-- print (tempColor.value)
		if VI == "Standard" then
			tempColor.value = linear(CT[i]*(VS/100), CM.value, 0-CM.value, 1)
		elseif VI == "Linear" then
			tempColor.value = linear(CT[i]*(VS/100), CM.value, 0-CM.value, 1)
		elseif VI == "Sine" then
			tempColor.value = inSine(CT[i]*(VS/100), CM.value, 0-CM.value, 1)
		elseif VI == "Quad" then
			tempColor.value = inQuad(CT[i]*(VS/100), CM.value, 0-CM.value, 1)
		elseif VI == "Cubic" then
			tempColor.value = inCubic(CT[i]*(VS/100), CM.value, 0-CM.value, 1)
		elseif VI == "Circ" then
			tempColor.value = inCirc(CT[i]*(VS/100), CM.value, 0-CM.value, 1)
		elseif VI == "outSine" then
			tempColor.value = outSine(CT[i]*(VS/100), CM.value, 0-CM.value, 1)
		elseif VI == "outQuad" then
			tempColor.value = outQuad(CT[i]*(VS/100), CM.value, 0-CM.value, 1)
		elseif VI == "outCubic" then
			tempColor.value = outCubic(CT[i]*(VS/100), CM.value, 0-CM.value, 1)
		elseif VI == "outCirc" then
			tempColor.value = outCirc(CT[i]*(VS/100), CM.value, 0-CM.value, 1)
		end
		-- print (tempColor.value)
		table.insert(paletteValue, tempColor)
	end
	-- If it has a center, just add the main color in the middle
	if hasCenter == true then
		table.insert(paletteValue, CM)
		secondRound = secondRound + 1
	end
	-- Lastly, normal to white
	for y = 1, copyColorAmount do
		local tempColor = Color{}
		tempColor.red = CM.red
		tempColor.green = CM.green
		tempColor.blue = CM.blue
		tempColor.alpha = CM.alpha
		-- print (CT[y+secondRound])
		if VI == "Standard" then
			tempColor.value = linear(CT[y+secondRound]*(VS/100), CM.value, 1-CM.value, 1)
		elseif VI == "Linear" then
			tempColor.value = linear(CT[y+secondRound]*(VS/100), CM.value, 1-CM.value, 1)
		elseif VI == "Sine" then
			tempColor.value = inSine(CT[y+secondRound]*(VS/100), CM.value, 1-CM.value, 1)
		elseif VI == "Quad" then
			tempColor.value = inQuad(CT[y+secondRound]*(VS/100), CM.value, 1-CM.value, 1)
		elseif VI == "Cubic" then
			tempColor.value = inCubic(CT[y+secondRound]*(VS/100), CM.value, 1-CM.value, 1)
		elseif VI == "Circ" then
			tempColor.value = inCirc(CT[y+secondRound]*(VS/100), CM.value, 1-CM.value, 1)
		elseif VI == "outSine" then
			tempColor.value = outSine(CT[y+secondRound]*(VS/100), CM.value, 1-CM.value, 1)
		elseif VI == "outQuad" then
			tempColor.value = outQuad(CT[y+secondRound]*(VS/100), CM.value, 1-CM.value, 1)
		elseif VI == "outCubic" then
			tempColor.value = outCubic(CT[y+secondRound]*(VS/100), CM.value, 1-CM.value, 1)
		elseif VI == "outCirc" then
			tempColor.value = outCirc(CT[y+secondRound]*(VS/100), CM.value, 1-CM.value, 1)
		end
		-- print (tempColor.value)
		table.insert(paletteValue, tempColor)
	end
	-- -- DEBUG
	-- for k,v in pairs(paletteLight) do
	-- print(v)  
	-- end
	-- -- DEBUG END
	return paletteValue
end


local function paletteSaturationCalc()
	paletteSaturation = {}
	local copyColorAmount = AOC
	local secondRound = 0
	local hasCenter = false
	
	-- If it has a center, remove and mark it
	if copyColorAmount %2 == 1 then
		copyColorAmount = copyColorAmount -1
		hasCenter = true
	end
	
	-- Halve the number and prepare the second round
	copyColorAmount = copyColorAmount/2
	secondRound = copyColorAmount
	
	-- Let's get the actual table now
	-- Starting with desaturated to normal
	for i = 1, copyColorAmount do
		local tempColor = Color{}
		tempColor.red = CM.red
		tempColor.green = CM.green
		tempColor.blue = CM.blue
		tempColor.alpha = CM.alpha
		-- print (tempColor.saturation)
		if SI == "Standard" then
			tempColor.saturation = linear(CT[i]*(SS/100), CM.saturation, 1-CM.saturation, 1)
		elseif SI == "Linear" then
			tempColor.saturation = linear(CT[i]*(SS/100), CM.saturation, 1-CM.saturation, 1)
		elseif SI == "Sine" then
			tempColor.saturation = inSine(CT[i]*(SS/100), CM.saturation, 1-CM.saturation, 1)
		elseif SI == "Quad" then
			tempColor.saturation = inQuad(CT[i]*(SS/100), CM.saturation, 1-CM.saturation, 1)
		elseif SI == "Cubic" then
			tempColor.saturation = inCubic(CT[i]*(SS/100), CM.saturation, 1-CM.saturation, 1)
		elseif SI == "Circ" then
			tempColor.saturation = inCirc(CT[i]*(SS/100), CM.saturation, 1-CM.saturation, 1)
		elseif SI == "outSine" then
			tempColor.saturation = outSine(CT[i]*(SS/100), CM.saturation, 1-CM.saturation, 1)
		elseif SI == "outQuad" then
			tempColor.saturation = outQuad(CT[i]*(SS/100), CM.saturation, 1-CM.saturation, 1)
		elseif SI == "outCubic" then
			tempColor.saturation = outCubic(CT[i]*(SS/100), CM.saturation, 1-CM.saturation, 1)
		elseif SI == "outCirc" then
			tempColor.saturation = outCirc(CT[i]*(SS/100), CM.saturation, 1-CM.saturation, 1)
		end
		-- print (tempColor.saturation)
		table.insert(paletteSaturation, tempColor)
	end
	-- If it has a center, just add the main color in the middle
	if hasCenter == true then
		table.insert(paletteSaturation, CM)
		secondRound = secondRound + 1
	end
	-- Lastly, normal to saturated
	for y = 1, copyColorAmount do
		local tempColor = Color{}
		tempColor.red = CM.red
		tempColor.green = CM.green
		tempColor.blue = CM.blue
		tempColor.alpha = CM.alpha
		-- print (CT[y+secondRound])
		if SI == "Standard" then
			tempColor.saturation = linear(CT[y+secondRound]*(SS/100), CM.saturation, 0-CM.saturation, 1)
		elseif SI == "Linear" then
			tempColor.saturation = linear(CT[y+secondRound]*(SS/100), CM.saturation, 0-CM.saturation, 1)
		elseif SI == "Sine" then
			tempColor.saturation = inSine(CT[y+secondRound]*(SS/100), CM.saturation, 0-CM.saturation, 1)
		elseif SI == "Quad" then
			tempColor.saturation = inQuad(CT[y+secondRound]*(SS/100), CM.saturation, 0-CM.saturation, 1)
		elseif SI == "Cubic" then
			tempColor.saturation = inCubic(CT[y+secondRound]*(SS/100), CM.saturation, 0-CM.saturation, 1)
		elseif SI == "Circ" then
			tempColor.saturation = inCirc(CT[y+secondRound]*(SS/100), CM.saturation, 0-CM.saturation, 1)
		elseif SI == "outSine" then
			tempColor.saturation = outSine(CT[y+secondRound]*(SS/100), CM.saturation, 0-CM.saturation, 1)
		elseif SI == "outQuad" then
			tempColor.saturation = outQuad(CT[y+secondRound]*(SS/100), CM.saturation, 0-CM.saturation, 1)
		elseif SI == "outCubic" then
			tempColor.saturation = outCubic(CT[y+secondRound]*(SS/100), CM.saturation, 0-CM.saturation, 1)
		elseif SI == "outCirc" then
			tempColor.saturation = outCirc(CT[y+secondRound]*(SS/100), CM.saturation, 0-CM.saturation, 1)
		end
		-- print (tempColor.saturation)
		table.insert(paletteSaturation, tempColor)
	end
	-- -- DEBUG
	-- for k,v in pairs(paletteSaturation) do
	-- print(v)  
	-- end
	-- -- DEBUG END
	return paletteSaturation
end


local function paletteHueCalc()
	paletteHue = {}

	for i = 1, AOH do
		local tempColor = Color{}
		tempColor.red = CM.red
		tempColor.green = CM.green
		tempColor.blue = CM.blue
		tempColor.alpha = CM.alpha
		-- print (tempColor.hue)
		if HI == "Standard" then
			tempColor.hue = linear((1/AOH)*(i-1), CM.hue, 360, 1)
			while tempColor.hue >= 360 do
				tempColor.hue = tempColor.hue - 360
			end
		elseif HI == "Sine" then
			tempColor.hue = inSine((1/AOH)*(i-1), CM.hue, 360, 1)
			while tempColor.hue >= 360 do
				tempColor.hue = tempColor.hue - 360
			end
		elseif HI == "Quad" then
			tempColor.hue = inQuad((1/AOH)*(i-1), CM.hue, 360, 1)
			while tempColor.hue >= 360 do
				tempColor.hue = tempColor.hue - 360
			end
		elseif HI == "Cubic" then
			tempColor.hue = inCubic((1/AOH)*(i-1), CM.hue, 360, 1)
			while tempColor.hue >= 360 do
				tempColor.hue = tempColor.hue - 360
			end
		elseif HI == "Circ" then
			tempColor.hue = inCirc((1/AOH)*(i-1), CM.hue, 360, 1)
			while tempColor.hue >= 360 do
				tempColor.hue = tempColor.hue - 360
			end
		elseif HI == "outSine" then
			tempColor.hue = outSine((1/AOH)*(i-1), CM.hue, 360, 1)
			while tempColor.hue >= 360 do
				tempColor.hue = tempColor.hue - 360
			end
		elseif HI == "outQuad" then
			tempColor.hue = outQuad((1/AOH)*(i-1), CM.hue, 360, 1)
			while tempColor.hue >= 360 do
				tempColor.hue = tempColor.hue - 360
			end
		elseif HI == "outCubic" then
			tempColor.hue = outCubic((1/AOH)*(i-1), CM.hue, 360, 1)
			while tempColor.hue >= 360 do
				tempColor.hue = tempColor.hue - 360
			end
		elseif HI == "outCirc" then
			tempColor.hue = outCirc((1/AOH)*(i-1), CM.hue, 360, 1)
			while tempColor.hue >= 360 do
				tempColor.hue = tempColor.hue - 360
			end
		end
		-- print (tempColor.hue)
		table.insert(paletteHue, tempColor)
	end
	-- -- DEBUG
	-- for k,v in pairs(paletteHue) do
	-- print(v)  
	-- end
	-- -- DEBUG END
	return paletteHue
end


local function paletteSoftHueCalc()
	paletteSoftHue = {}

	for i = 1, AOSH do
		local tempColor = Color{}
		tempColor.red = CM.red
		tempColor.green = CM.green
		tempColor.blue = CM.blue
		tempColor.alpha = CM.alpha
		-- print (tempColor.hue)
		if HI == "Standard" then
			tempColor.hue = linear((1/AOSH)*(i-1), CM.hue, 360/AOH, 1)
			while tempColor.hue >= 360 do
				tempColor.hue = tempColor.hue - 360
			end
		elseif HI == "Sine" then
			tempColor.hue = inSine((1/AOSH)*(i-1), CM.hue, 360/AOH, 1)
			while tempColor.hue >= 360 do
				tempColor.hue = tempColor.hue - 360
			end
		elseif HI == "Quad" then
			tempColor.hue = inQuad((1/AOSH)*(i-1), CM.hue, 360/AOH, 1)
			while tempColor.hue >= 360 do
				tempColor.hue = tempColor.hue - 360
			end
		elseif HI == "Cubic" then
			tempColor.hue = inCubic((1/AOSH)*(i-1), CM.hue, 360/AOH, 1)
			while tempColor.hue >= 360 do
				tempColor.hue = tempColor.hue - 360
			end
		elseif HI == "Circ" then
			tempColor.hue = inCirc((1/AOSH)*(i-1), CM.hue, 360/AOH, 1)
			while tempColor.hue >= 360 do
				tempColor.hue = tempColor.hue - 360
			end
		elseif HI == "outSine" then
			tempColor.hue = outSine((1/AOSH)*(i-1), CM.hue, 360/AOH, 1)
			while tempColor.hue >= 360 do
				tempColor.hue = tempColor.hue - 360
			end
		elseif HI == "outQuad" then
			tempColor.hue = outQuad((1/AOSH)*(i-1), CM.hue, 360/AOH, 1)
			while tempColor.hue >= 360 do
				tempColor.hue = tempColor.hue - 360
			end
		elseif HI == "outCubic" then
			tempColor.hue = outCubic((1/AOSH)*(i-1), CM.hue, 360/AOH, 1)
			while tempColor.hue >= 360 do
				tempColor.hue = tempColor.hue - 360
			end
		elseif HI == "outCirc" then
			tempColor.hue = outCirc((1/AOSH)*(i-1), CM.hue, 360/AOH, 1)
			while tempColor.hue >= 360 do
				tempColor.hue = tempColor.hue - 360
			end
		end
		-- print (tempColor.hue)
		table.insert(paletteSoftHue, tempColor)
	end
	-- -- DEBUG
	-- for k,v in pairs(paletteHue) do
	-- print(v)  
	-- end
	-- -- DEBUG END
	return paletteSoftHue
end


-- RELOAD COLORS

local function reloadColors(windowBounds)
	local dlg
	dlg = Dialog
	{ 
		title = "Chaonic's Palette Helper"
	}
	
	-- First, let's get the calculation table and the generic palette
	generateCalcTable()
	generateColorTable()


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
	:separator
	{
		id = "separator",
		text = "Color Control"
	}
	:label
	{
		id = labelColorsLeft,
		label = "Amount of:",
		text= "Colors"
	}
	:label
	{
		id=labelColorsLeft,
		text= "Hues"
	}
	:label
	{
		id=labelColorsLeft,
		text= "Soft Hues"
	}
	:slider
	{
		id = "amountOfColorsSlider",
		min=minColors,
		max=maxColors,
		value=AOC,
		onchange=function()
			AOC = dlg.data.amountOfColorsSlider
		end,
		onrelease=function()
			AOC = dlg.data.amountOfColorsSlider
			reloadColors(dlg.bounds)
			dlg:close()
			end
	}
	:slider
	{
		id = "amountOfHuesSlider",
		min=minColors,
		max=maxColors,
		value=AOH,
		onchange=function()
			AOH = dlg.data.amountOfHuesSlider
		end,
		onrelease=function()
			AOH = dlg.data.amountOfHuesSlider
			reloadColors(dlg.bounds)
			dlg:close()
		end
	}
	:slider
	{
		id = "amountOfSoftHuesSlider",
		min=minColors,
		max=maxColors,
		value=AOSH,
		onchange=function()
			AOSH = dlg.data.amountOfSoftHuesSlider
		end,
		onrelease=function()
			AOSH = dlg.data.amountOfSoftHuesSlider
			reloadColors(dlg.bounds)
			dlg:close()
		end
	}
	:label
	{
		id = labelStrengthHue,
		label = "Strength of:",
		text= "Hue/Color"
	}
	:label
	{
		id=labelStrengthSaturation,
		text= "Saturation"
	}
	:slider
	{
		id = "hueStrengthSlider",
		min=0,
		max=100,
		value=HS,
		onchange=function()
			HS = dlg.data.hueStrengthSlider
		end,
		onrelease=function()
			HS = dlg.data.hueStrengthSlider
			reloadColors(dlg.bounds)
			dlg:close()
			end
	}
	:slider
	{
		id = "satStrengthSlider",
		min=0,
		max=100,
		value=SS,
		onchange=function()
			SS = dlg.data.satStrengthSlider
		end,
		onrelease=function()
			SS = dlg.data.satStrengthSlider
			reloadColors(dlg.bounds)
			dlg:close()
			end
	}
	:label
	{
		id=labelStrengthValueLight,
		label = "",
		text= "Value/Light"
	}
	:label
	{
		id=labelStrengthAlpha,
		text= "Alpha"
	}
	:slider
	{
		id = "valStrengthSlider",
		min=0,
		max=100,
		value=VS,
		onchange=function()
			VS = dlg.data.valStrengthSlider
		end,
		onrelease=function()
			VS = dlg.data.valStrengthSlider
			reloadColors(dlg.bounds)
			dlg:close()
			end
	}
	:slider
	{
		id = "alphaStrengthSlider",
		min=0,
		max=100,
		value=AS,
		onchange=function()
			AS = dlg.data.alphaStrengthSlider
		end,
		onrelease=function()
			AS = dlg.data.alphaStrengthSlider
			reloadColors(dlg.bounds)
			dlg:close()
			end
	}
	:label
	{
		id = "huelabel",
		label = "Interpolations: ",
		text = "Hue/Color"
	}
	:label
	{
		id = "satlabel",
		text = "Saturation"
	}
	:label
	{
		id = "vallabel",
		text = "Value/Light"
	}
	:label
	{
		id = "alphalabel",
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
			"outSine",
			"outQuad",
			"outCubic",
			"outCirc"
		},
		onchange = function()
			HI = dlg.data.hueInterpolation
			reloadColors(dlg.bounds)
			dlg:close()
		end
	}
	:combobox
	{
		id = "satInterpolation",
		option = SI,
		options =
		{
			"Standard",
			"Linear",
			"Sine",
			"Quad",
			"Cubic",
			"Circ",
			"outSine",
			"outQuad",
			"outCubic",
			"outCirc"
		},
		onchange = function()
			SI = dlg.data.satInterpolation
			reloadColors(dlg.bounds)
			dlg:close()
		end
	}
	:combobox
	{
		id = "valInterpolation",
		option = VI,
		options =
		{
			"Standard",
			"Linear",
			"Sine",
			"Quad",
			"Cubic",
			"Circ",
			"outSine",
			"outQuad",
			"outCubic",
			"outCirc"
		},
		onchange = function()
			VI = dlg.data.valInterpolation
			reloadColors(dlg.bounds)
			dlg:close()
		end
	}
	:combobox
	{
		id = "alphaInterpolation",
		option = AI,
		options =
		{
			"Linear",
			"Sine",
			"Quad",
			"Cubic",
			"Circ",
			"outSine",
			"outQuad",
			"outCubic",
			"outCirc"
		},
		onchange = function()
			AI = dlg.data.alphaInterpolation
			reloadColors(dlg.bounds)
			dlg:close()
		end
	}
-- COLOR CONTROL END
-- PRESET CONTROL
	:separator
	{
		id = "separator",
		text = "Presets",
	}
	:button
	{
		id = "buttonPreset1",
		text = "Default",
		onclick = function()
			CL = 	colorLeft
			CR = 	colorRight
			AOC = 	amountOfColorsVar
			AOH = 	amountOfHuesVar
			AOSH = 	amountOfSoftHuesVar
			HS = 	hueStrength
			SS = 	satStrength
			VS = 	valStrenght
			AS = 	alpaStrength
			HI = 	hueInterpolationVar
			SI = 	satInterpolationVar
			VI = 	valInterpolationVar
			AI =	alphaInterpolationVar
			reloadColors(dlg.bounds)
			dlg:close()
		end
	}
	:button
	{
		id = "buttonPreset2",
		text = "Beta",
		onclick = function()
			CL = 	Color{ r = 20, g = 20, b = 51, a = 255 }
			CR = 	Color{ r = 230, g = 230, b = 195, a = 255 }
			AOC = 	15
			AOH = 	12
			AOSH = 	6
			HS = 	100
			SS = 	100
			VS = 	100
			AS = 	100
			HI = 	"Standard"
			SI = 	"Quad"
			VI = 	"Standard"
			AI =	"Quad"
			reloadColors(dlg.bounds)
			dlg:close()
		end
	}
	:button
	{
		id = "buttonPreset3",
		text = "Preset 3",
		onclick = function()
			CL = 	Color{ r = 26, g = 34, b = 51, a = 255 }
			CR = 	Color{ r = 242, g = 218, b = 170, a = 255 }
			AOC = 	15
			AOH = 	12
			AOSH = 	6
			HS = 	100
			SS = 	100
			VS = 	100
			AS = 	100
			HI = 	"Standard"
			SI = 	"Circ"
			VI = 	"Standard"
			AI =	"Quad"
			reloadColors(dlg.bounds)
			dlg:close()
		end
	}
	:button
	{
		id = "buttonPreset4",
		text = "Preset 4",
		onclick = function()
			CL = 	Color{ r = 43, g = 22, b = 64, a = 255 }
			CR = 	Color{ r = 228, g = 242, b = 157, a = 255 }
			AOC = 	15
			AOH = 	12
			AOSH = 	6
			HS = 	100
			SS = 	100
			VS = 	100
			AS = 	100
			HI = 	"Standard"
			SI = 	"Quad"
			VI = 	"Standard"
			AI =	"Quad"
			reloadColors(dlg.bounds)
			dlg:close()
		end
	}
	:button
	{
		id = "buttonPreset5",
		label = "",
		text = "Preset 5",
		onclick = function()
			CL = 	Color{ r = 0, g = 25, b = 38, a = 255 }
			CR = 	Color{ r = 235, g = 235, b = 164, a = 255 }
			AOC = 	15
			AOH = 	12
			AOSH = 	6
			HS = 	100
			SS = 	100
			VS = 	100
			AS = 	100
			HI = 	"Standard"
			SI = 	"Quad"
			VI = 	"Standard"
			AI =	"Quad"
			reloadColors(dlg.bounds)
			dlg:close()
		end
	}
	:button
	{
		id = "buttonPreset6",
		text = "Preset 6",
		onclick = function()
			CL = 	Color{ r = 0, g = 21, b = 64, a = 255 }
			CR = 	Color{ r = 255, g = 255, b = 191, a = 255 }
			AOC = 	15
			AOH = 	12
			AOSH = 	6
			HS = 	100
			SS = 	100
			VS = 	100
			AS = 	100
			HI = 	"Standard"
			SI = 	"Quad"
			VI = 	"Standard"
			AI =	"Quad"
			reloadColors(dlg.bounds)
			dlg:close()
		end
	}
	:button
	{
		id = "buttonPreset7",
		text = "Preset 7",
		onclick = function()
			CL = 	Color{ r = 0, g = 26, b = 51, a = 255 }
			CR = 	Color{ r = 255, g = 247, b = 204, a = 255 }
			AOC = 	15
			AOH = 	12
			AOSH = 	6
			HS = 	100
			SS = 	100
			VS = 	100
			AS = 	100
			HI = 	"Standard"
			SI = 	"Quad"
			VI = 	"Standard"
			AI =	"Quad"
			reloadColors(dlg.bounds)
			dlg:close()
		end
	}
	:button
	{
		id = "buttonPreset8",
		text = "Preset 8",
		onclick = function()
			CL = 	Color{ r = 34, g = 0, b = 51, a = 255 }
			CR = 	Color{ r = 247, g = 255, b = 204, a = 255 }
			AOC = 	15
			AOH = 	12
			AOSH = 	6
			HS = 	80
			SS = 	100
			VS = 	100
			AS = 	100
			HI = 	"Standard"
			SI = 	"Quad"
			VI = 	"Standard"
			AI =	"Quad"
			reloadColors(dlg.bounds)
			dlg:close()
		end
	}
	:button
	{
		id = "buttonPresetCustom1",
		label = "",
		text = presetcustom1name,
		onclick = function()
			CL = 	presetcustom1colorLeft
			CR = 	presetcustom1colorRight
			AOC = 	presetcustom1amountOfColorsVar
			AOH = 	presetcustom1amountOfHuesVar
			AOSH = 	presetcustom1amountOfSoftHuesVar
			HS = 	presetcustom1hueStrength
			SS = 	presetcustom1satStrength
			VS = 	presetcustom1valStrenght
			AS = 	presetcustom1alpaStrength
			HI = 	presetcustom1hueInterpolationVar
			SI = 	presetcustom1satInterpolationVar
			VI = 	presetcustom1valInterpolationVar
			AI =	presetcustom1alphaInterpolationVar
			reloadColors(dlg.bounds)
			dlg:close()
		end
	}
	:button
	{
		id = "buttonPresetCustom2",
		text = presetcustom2name,
		onclick = function()
			CL = 	presetcustom2colorLeft
			CR = 	presetcustom2colorRight
			AOC = 	presetcustom2amountOfColorsVar
			AOH = 	presetcustom2amountOfHuesVar
			AOSH = 	presetcustom2amountOfSoftHuesVar
			HS = 	presetcustom2hueStrength
			SS = 	presetcustom2satStrength
			VS = 	presetcustom2valStrenght
			AS = 	presetcustom2alpaStrength
			HI = 	presetcustom2hueInterpolationVar
			SI = 	presetcustom2satInterpolationVar
			VI = 	presetcustom2valInterpolationVar
			AI =	presetcustom2alphaInterpolationVar
			reloadColors(dlg.bounds)
			dlg:close()
		end
	}
	:button
	{
		id = "buttonPresetCustom3",
		text = presetcustom3name,
		onclick = function()
			CL = 	presetcustom3colorLeft
			CR = 	presetcustom3colorRight
			AOC = 	presetcustom3amountOfColorsVar
			AOH = 	presetcustom3amountOfHuesVar
			AOSH = 	presetcustom3amountOfSoftHuesVar
			HS = 	presetcustom3hueStrength
			SS = 	presetcustom3satStrength
			VS = 	presetcustom3valStrenght
			AS = 	presetcustom3alpaStrength
			HI = 	presetcustom3hueInterpolationVar
			SI = 	presetcustom3satInterpolationVar
			VI = 	presetcustom3valInterpolationVar
			AI =	presetcustom3alphaInterpolationVar
			reloadColors(dlg.bounds)
			dlg:close()
		end
	}
	:button
	{
		id = "buttonPresetCustom4",
		text = presetcustom4name,
		onclick = function()
			CL = 	presetcustom4colorLeft
			CR = 	presetcustom4colorRight
			AOC = 	presetcustom4amountOfColorsVar
			AOH = 	presetcustom4amountOfHuesVar
			AOSH = 	presetcustom4amountOfSoftHuesVar
			HS = 	presetcustom4hueStrength
			SS = 	presetcustom4satStrength
			VS = 	presetcustom4valStrenght
			AS = 	presetcustom4alpaStrength
			HI = 	presetcustom4hueInterpolationVar
			SI = 	presetcustom4satInterpolationVar
			VI = 	presetcustom4valInterpolationVar
			AI =	presetcustom4alphaInterpolationVar
			reloadColors(dlg.bounds)
			dlg:close()
		end
	}
-- PRESET CONTROL END
	:separator
	{
		id = "separator",
		text = "Shades"
	}
-- SHADE
	:shades
	{
		id = "paletteShade",
		label = "Custom Shade",
		colors = paletteShadeCalc(),
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
			copyColor = Color{}
			for i = 1, AOC do
				copyColor = paletteShade[i]
				app.command.AddColor
					{
						color = copyColor
					}
			end
		end
	}
	:button
	{
		id = "buttonShadePalette",
		text = "Generate whole Palette",
		onclick = function()
			for y = 1, AOH do
				for i = 1, AOC do
					copyColor = paletteShade[i]
					app.command.AddColor
						{
							color = copyColor
						}
				end
				local wrap = 0
				if y + 1 > AOH then
					wrap = AOH
				end
				CM = paletteHue[y+1-wrap]
				paletteShadeCalc()
			end
		end
	}
-- SHADE END
-- LIGHT
	:shades
	{
		id = "paletteLight",
		label = "Light",
		colors = paletteLightCalc(),
		onclick = function(ev)
			if (ev.button == MouseButton.LEFT) then
				app.fgColor = ev.color
			end
		end
	}
	:button
	{
		id = "buttonLightLine",
		text = "Copy Line to Palette",
		onclick = function()
			copyColor = Color{}
			for i = 1, AOC do
				copyColor = paletteLight[i]
				app.command.AddColor
					{
						color = copyColor
					}
			end
		end
	}
	:button
	{
		id = "buttonLightPalette",
		text = "Generate whole Palette",
		onclick = function()
			for y = 1, AOH do
				for i = 1, AOC do
					copyColor = paletteLight[i]
					app.command.AddColor
						{
							color = copyColor
						}
				end
				local wrap = 0
				if y + 1 > AOH then
					wrap = AOH
				end
				CM = paletteHue[y+1-wrap]
				paletteLightCalc()
			end
		end
	}
-- LIGHT END
-- VALUE
	:shades
	{
		id = "paletteValue",
		label = "Value",
		colors = paletteValueCalc(),
		onclick = function(ev)
			if (ev.button == MouseButton.LEFT) then
				app.fgColor = ev.color
			end
		end
	}
	:button
	{
		id = "buttonValueLine",
		text = "Copy Line to Palette",
		onclick = function()
			copyColor = Color{}
			for i = 1, AOC do
				copyColor = paletteValue[i]
				app.command.AddColor
					{
						color = copyColor
					}
			end
		end
	}
	:button
	{
		id = "buttonValuePalette",
		text = "Generate whole Palette",
		onclick = function()
			for y = 1, AOH do
				for i = 1, AOC do
					copyColor = paletteValue[i]
					app.command.AddColor
						{
							color = copyColor
						}
				end
				local wrap = 0
				if y + 1 > AOH then
					wrap = AOH
				end
				CM = paletteHue[y+1-wrap]
				paletteValueCalc()
			end
		end
	}
-- VALUE END
-- SATURATION
	:shades
	{
		id = "paletteSaturation",
		label = "Saturation",
		colors = paletteSaturationCalc(),
		onclick = function(ev)
			if (ev.button == MouseButton.LEFT) then
				app.fgColor = ev.color
			end
		end
	}
	:button
	{
		id = "buttonSaturationLine",
		text = "Copy Line to Palette",
		onclick = function()
			copyColor = Color{}
			for i = 1, AOC do
				copyColor = paletteSaturation[i]
				app.command.AddColor
					{
						color = copyColor
					}
			end
		end
	}
	:button
	{
		id = "buttonSaturationPalette",
		text = "Generate whole Palette",
		onclick = function()
			for y = 1, AOH do
				for i = 1, AOC do
					copyColor = paletteSaturation[i]
					app.command.AddColor
						{
							color = copyColor
						}
				end
				local wrap = 0
				if y + 1 > AOH then
					wrap = AOH
				end
				CM = paletteHue[y+1-wrap]
				paletteSaturationCalc()
			end
		end
	}
-- SATURATION END
-- SOFT HUE
	:shades
	{
		id = "paletteSoftHue",
		label = "Soft Hue",
		colors = paletteSoftHueCalc(),
		onclick = function(ev)
			if (ev.button == MouseButton.LEFT) then
				app.fgColor = ev.color
			end
		end
	}
	:button
	{
		id = "buttonSoftHueLine",
		text = "Copy Line to Palette",
		onclick = function()
			copyColor = Color{}
			for i = 1, AOSH do
				copyColor = paletteSoftHue[i]
				app.command.AddColor
					{
						color = copyColor
					}
			end
		end
	}
	:button
	{
		id = "buttonSoftHuePalette",
		text = "Generate whole Palette",
		onclick = function()
			for y = 1, AOH do
				for i = 1, AOSH do
					copyColor = paletteSoftHue[i]
					app.command.AddColor
						{
							color = copyColor
						}
				end
				local wrap = 0
				if y + 1 > AOH then
					wrap = AOH
				end
				CM = paletteHue[y+1-wrap]
				paletteSoftHueCalc()
			end
		end
	}
-- SOFT HUE END
-- HARD HUE
	:shades
	{
		id = "paletteHardHue",
		label = "Hard Hue",
		colors = paletteHueCalc(),
		onclick = function(ev)
			if (ev.button == MouseButton.LEFT) then
				app.fgColor = ev.color
			end
		end
	}
	:button
	{
		id = "buttonHardHueLine",
		text = "Copy Line to Palette",
		onclick = function()
			copyColor = Color{}
			for i = 1, AOH do
				copyColor = paletteHue[i]
				app.command.AddColor
					{
						color = copyColor
					}
			end
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
			CL = colorLeft
			CM = app.fgColor
			CR = colorRight
			CC = colorClipboard
			AOC = amountOfColorsVar
			AOH = amountOfHuesVar
			HS = hueStrength
			SS = satStrength
			VS = valStrenght
			AS = alpaStrength
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
			dlg:close()
		end
	}
	:show
	{
	wait = false, bounds = windowBounds
	}	

end

do
	reloadColors()
end