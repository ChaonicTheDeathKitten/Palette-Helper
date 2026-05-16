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
local presetcustom1amountOfColorsVar =			9
local presetcustom1amountOfHuesVar =			9
local presetcustom1amountOfSoftHuesVar =		6
local presetcustom1hueStrength =				100
local presetcustom1satStrength =				100
local presetcustom1valStrength =				100
local presetcustom1alphaStrength =				100
local presetcustom1hueInterpolationVar =		"Standard"
local presetcustom1satInterpolationVar =		"Sine"
local presetcustom1valInterpolationVar =		"Standard"
local presetcustom1alphaInterpolationVar =		"Linear"

-- PRESET CUSTOM 2

local presetcustom2name =						"Custom 2"
local presetcustom2colorLeft =					Color{ r = 0, g = 0, b = 0, a = 255 }
local presetcustom2colorRight =					Color{ r = 255, g = 255, b = 255, a = 255 }
local presetcustom2amountOfColorsVar =			9
local presetcustom2amountOfHuesVar =			9
local presetcustom2amountOfSoftHuesVar =		6
local presetcustom2hueStrength =				100
local presetcustom2satStrength =				100
local presetcustom2valStrength =				100
local presetcustom2alphaStrength =				100
local presetcustom2hueInterpolationVar =		"Standard"
local presetcustom2satInterpolationVar =		"Sine"
local presetcustom2valInterpolationVar =		"Standard"
local presetcustom2alphaInterpolationVar =		"Linear"

-- PRESET CUSTOM 3

local presetcustom3name =						"Custom 3"
local presetcustom3colorLeft =					Color{ r = 0, g = 0, b = 0, a = 255 }
local presetcustom3colorRight =					Color{ r = 255, g = 255, b = 255, a = 255 }
local presetcustom3amountOfColorsVar =			9
local presetcustom3amountOfHuesVar =			9
local presetcustom3amountOfSoftHuesVar =		6
local presetcustom3hueStrength =				100
local presetcustom3satStrength =				100
local presetcustom3valStrength =				100
local presetcustom3alphaStrength =				100
local presetcustom3hueInterpolationVar =		"Standard"
local presetcustom3satInterpolationVar =		"Sine"
local presetcustom3valInterpolationVar =		"Standard"
local presetcustom3alphaInterpolationVar =		"Linear"

-- PRESET CUSTOM 4

local presetcustom4name =						"Custom 4"
local presetcustom4colorLeft =					Color{ r = 0, g = 0, b = 0, a = 255 }
local presetcustom4colorRight =					Color{ r = 255, g = 255, b = 255, a = 255 }
local presetcustom4amountOfColorsVar =			9
local presetcustom4amountOfHuesVar =			9
local presetcustom4amountOfSoftHuesVar =		6
local presetcustom4hueStrength =				100
local presetcustom4satStrength =				100
local presetcustom4valStrength =				100
local presetcustom4alphaStrength =				100
local presetcustom4hueInterpolationVar =		"Standard"
local presetcustom4satInterpolationVar =		"Sine"
local presetcustom4valInterpolationVar =		"Standard"
local presetcustom4alphaInterpolationVar =		"Linear"

-- STOP MAKING CHANGES HERE (UNLESS YOU KNOW WHAT YOU ARE DOING)

-- WAIT FUNCTION

-- ADVANCED SETTINGS VARIABLES

local includeLeft = "Include Left Color"
local includeRight = "Include Right Color"
local hasLeft = 0
local hasRight = 0
local copyColor = "*Copy Color*"
local saveColor = "Save Color"
local saveLine = "Save Line"
local savePalette = "Gen. Palette"
local saveSettings = "Save as"
local interpolateSoftHue = "No"
local interpolateHardHue = "No"

-- STANDARD VALUES

-- This is a bugfix.. I think..
local colorBrush = app.fgColor
-- Continuing


local colorLeft = Color{ r = 15, g = 15, b = 30, a = 255 }
local colorMain = Color{}
colorMain.red = colorBrush.red
colorMain.green = colorBrush.green
colorMain.blue = colorBrush.blue
colorMain.alpha = colorBrush.alpha
local colorRight = Color{ r = 245, g = 245, b = 230, a = 255 }
local colorClipboard = Color{ r = 0, g = 0, b = 0, a = 0 }
local amountOfColorsVar = 9
local amountOfHuesVar = 9
local amountOfSoftHuesVar = 6
local hueStrength = 100
local satStrength = 100
local valStrength = 100
local alphaStrength = 100
local hueInterpolationVar = "Standard"
local satInterpolationVar = "Sine"
local valInterpolationVar = "Standard"
local alphaInterpolationVar = "Linear"
local calcTable = {}

-- CHANGED VALUES

local CL = colorLeft
local CM = colorMain
local CR = colorRight
local CC = colorClipboard
local AOC = amountOfColorsVar
local AOH = amountOfHuesVar
local AOSH = amountOfSoftHuesVar
local HS = hueStrength
local SS = satStrength
local VS = valStrength
local AS = alphaStrength
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

--[[
Disclaimer for Robert Penner's Easing Equations license:

TERMS OF USE - EASING EQUATIONS

Open source under the BSD License.

Copyright © 2001 Robert Penner
All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
    * Neither the name of the author nor the names of contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
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
local abs = math.abs
local asin  = math.asin

local function linear(t, b, c, d)
  return c * t / d + b
end

local function inQuad(t, b, c, d)
  t = t / d
  return c * t * t + b
end

local function outQuad(t, b, c, d)
  t = t / d
  return -c * t * (t - 2) + b
end

local function inOutQuad(t, b, c, d)
  t = t / d * 2
  if t < 1 then
    return c / 2 * t * t + b
  else
    return -c / 2 * ((t - 1) * (t - 3) - 1) + b
  end
end

local function outInQuad(t, b, c, d)
  if t < d / 2 then
    return outQuad (t * 2, b, c / 2, d)
  else
    return inQuad(t * 2 - d, b + c / 2, c / 2, d)
  end
end

local function inCubic (t, b, c, d)
  t = t / d
  return c * t * t * t + b
end

local function outCubic(t, b, c, d)
  t = t / d - 1
  return c * (t * t * t + 1) + b
end

local function inOutCubic(t, b, c, d)
  t = t / d * 2
  if t < 1 then
    return c / 2 * t * t * t + b
  else
    t = t - 2
    return c / 2 * (t * t * t + 2) + b
  end
end

local function outInCubic(t, b, c, d)
  if t < d / 2 then
    return outCubic(t * 2, b, c / 2, d)
  else
    return inCubic(t * 2 - d, b + c / 2, c / 2, d)
  end
end

local function inQuart(t, b, c, d)
  t = t / d
  return c * t ^ 4 + b
end

local function outQuart(t, b, c, d)
  t = t / d - 1
  return -c * (t ^ 4 - 1) + b
end

local function inOutQuart(t, b, c, d)
  t = t / d * 2
  if t < 1 then
    return c / 2 * t ^ 4 + b
  else
    t = t - 2
    return -c / 2 * (t ^ 4 - 2) + b
  end
end

local function outInQuart(t, b, c, d)
  if t < d / 2 then
    return outQuart(t * 2, b, c / 2, d)
  else
    return inQuart(t * 2 - d, b + c / 2, c / 2, d)
  end
end

local function inQuint(t, b, c, d)
  t = t / d
  return c * t ^ 5 + b
end

local function outQuint(t, b, c, d)
  t = t / d - 1
  return c * (t ^ 5 + 1) + b
end

local function inOutQuint(t, b, c, d)
  t = t / d * 2
  if t < 1 then
    return c / 2 * t ^ 5 + b
  else
    t = t - 2
    return c / 2 * (t ^ 5 + 2) + b
  end
end

local function outInQuint(t, b, c, d)
  if t < d / 2 then
    return outQuint(t * 2, b, c / 2, d)
  else
    return inQuint(t * 2 - d, b + c / 2, c / 2, d)
  end
end

local function inSine(t, b, c, d)
  return -c * cos(t / d * (pi / 2)) + c + b
end

local function outSine(t, b, c, d)
  return c * sin(t / d * (pi / 2)) + b
end

local function inOutSine(t, b, c, d)
  return -c / 2 * (cos(pi * t / d) - 1) + b
end

local function outInSine(t, b, c, d)
  if t < d / 2 then
    return outSine(t * 2, b, c / 2, d)
  else
    return inSine(t * 2 - d, b + c / 2, c / 2, d)
  end
end

local function inExpo(t, b, c, d)
  if t == 0 then
    return b
  else
    return c * 2 ^ (10 * (t / d - 1)) + b - c * 0.001
  end
end

local function outExpo(t, b, c, d)
  if t == d then
    return b + c
  else
    return c * 1.001 * (1 - 2 ^ (-10 * t / d)) + b
  end
end

local function inOutExpo(t, b, c, d)
  if t == 0 then return b end
  if t == d then return b + c end
  t = t / d * 2
  if t < 1 then
    return c / 2 * 2 ^ (10 * (t - 1)) + b - c * 0.0005
  else
    t = t - 1
    return c / 2 * 1.0005 * (2 - 2 ^ (-10 * t)) + b
  end
end

local function outInExpo(t, b, c, d)
  if t < d / 2 then
    return outExpo(t * 2, b, c / 2, d)
  else
    return inExpo(t * 2 - d, b + c / 2, c / 2, d)
  end
end

local function inCirc(t, b, c, d)
  t = t / d
  return -c * (sqrt(1 - t ^ 2) - 1) + b
end

local function outCirc(t, b, c, d)
  t = t / d - 1
  return c * sqrt(1 - t ^ 2) + b
end

local function inOutCirc(t, b, c, d)
  t = t / d * 2
  if t < 1 then
    return -c / 2 * (sqrt(1 - t * t) - 1) + b
  else
    t = t - 2
    return c / 2 * (sqrt(1 - t * t) + 1) + b
  end
end

local function outInCirc(t, b, c, d)
  if t < d / 2 then
    return outCirc(t * 2, b, c / 2, d)
  else
    return inCirc((t * 2) - d, b + c / 2, c / 2, d)
  end
end

local function inElastic(t, b, c, d, a, p)
  if t == 0 then return b end

  t = t / d

  if t == 1  then return b + c end

  if not p then p = d * 0.3 end

  local s

  if not a or a < abs(c) then
    a = c
    s = p / 4
  else
    s = p / (2 * pi) * asin(c/a)
  end

  t = t - 1

  return -(a * 2 ^ (10 * t) * sin((t * d - s) * (2 * pi) / p)) + b
end

-- a: amplitud
-- p: period
local function outElastic(t, b, c, d, a, p)
  if t == 0 then return b end

  t = t / d

  if t == 1 then return b + c end

  if not p then p = d * 0.3 end

  local s

  if not a or a < abs(c) then
    a = c
    s = p / 4
  else
    s = p / (2 * pi) * asin(c/a)
  end

  return a * 2 ^ (-10 * t) * sin((t * d - s) * (2 * pi) / p) + c + b
end

-- p = period
-- a = amplitud
local function inOutElastic(t, b, c, d, a, p)
  if t == 0 then return b end

  t = t / d * 2

  if t == 2 then return b + c end

  if not p then p = d * (0.3 * 1.5) end
  if not a then a = 0 end

  local s

  if not a or a < abs(c) then
    a = c
    s = p / 4
  else
    s = p / (2 * pi) * asin(c / a)
  end

  if t < 1 then
    t = t - 1
    return -0.5 * (a * 2 ^ (10 * t) * sin((t * d - s) * (2 * pi) / p)) + b
  else
    t = t - 1
    return a * 2 ^ (-10 * t) * sin((t * d - s) * (2 * pi) / p ) * 0.5 + c + b
  end
end

-- a: amplitud
-- p: period
local function outInElastic(t, b, c, d, a, p)
  if t < d / 2 then
    return outElastic(t * 2, b, c / 2, d, a, p)
  else
    return inElastic((t * 2) - d, b + c / 2, c / 2, d, a, p)
  end
end

local function inBack(t, b, c, d, s)
  if not s then s = 1.70158 end
  t = t / d
  return c * t * t * ((s + 1) * t - s) + b
end

local function outBack(t, b, c, d, s)
  if not s then s = 1.70158 end
  t = t / d - 1
  return c * (t * t * ((s + 1) * t + s) + 1) + b
end

local function inOutBack(t, b, c, d, s)
  if not s then s = 1.70158 end
  s = s * 1.525
  t = t / d * 2
  if t < 1 then
    return c / 2 * (t * t * ((s + 1) * t - s)) + b
  else
    t = t - 2
    return c / 2 * (t * t * ((s + 1) * t + s) + 2) + b
  end
end

local function outInBack(t, b, c, d, s)
  if t < d / 2 then
    return outBack(t * 2, b, c / 2, d, s)
  else
    return inBack((t * 2) - d, b + c / 2, c / 2, d, s)
  end
end

local function outBounce(t, b, c, d)
  t = t / d
  if t < 1 / 2.75 then
    return c * (7.5625 * t * t) + b
  elseif t < 2 / 2.75 then
    t = t - (1.5 / 2.75)
    return c * (7.5625 * t * t + 0.75) + b
  elseif t < 2.5 / 2.75 then
    t = t - (2.25 / 2.75)
    return c * (7.5625 * t * t + 0.9375) + b
  else
    t = t - (2.625 / 2.75)
    return c * (7.5625 * t * t + 0.984375) + b
  end
end

local function inBounce(t, b, c, d)
  return c - outBounce(d - t, 0, c, d) + b
end

local function inOutBounce(t, b, c, d)
  if t < d / 2 then
    return inBounce(t * 2, 0, c, d) * 0.5 + b
  else
    return outBounce(t * 2 - d, 0, c, d) * 0.5 + c * .5 + b
  end
end

local function outInBounce(t, b, c, d)
  if t < d / 2 then
    return outBounce(t * 2, b, c / 2, d)
  else
    return inBounce((t * 2) - d, b + c / 2, c / 2, d)
  end
end


-- END OF EASING CALCULATIONS

-- OKLAB CONVERSIONS
-- I've abandoned all hope in learning how to translate the original conversions into LUA
-- This is why I'm resorting to the work of Jeremy Behreandt, who has kindly posted his versions under the MIT license.
-- I want to expressly say THANK YOU for all the help you've provided me in the past to make my tool possible and keep on doing so.
-- These calculations were taken from https://behreajj/AsepriteOkHsl/blob/main/ok_color.lua
-- In fact, it really is just the contents of that file pasted here. I know that the license allows me to do this, but I can't help but feel wrong for this.

-- Copyright(c) 2021 Bjorn Ottosson
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of
-- this software and associated documentation files(the "Software"), to deal in
-- the Software without restriction, including without limitation the rights to
-- use, copy, modify, merge, publish, distribute, sublicense, and /or sell copies
-- of the Software, and to permit persons to whom the Software is furnished to do
-- so, subject to the following conditions:
--
-- The above copyright noticeand this permission notice shall be included in all
-- copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.

ok_color = {}
ok_color.__index = ok_color

function ok_color.new()
    return setmetatable({}, ok_color)
end

-- Finds the maximum saturation possible for a given hue that fits in sRGB
-- Saturation here is defined as S = C/L
-- a and b must be normalized so a^2 + b^2 == 1
---@param a number
---@param b number
---@return number
---@nodiscard
function ok_color.compute_max_saturation(a, b)
    if a ~= 0.0 or b ~= 0.0 then
        -- Max saturation will be when one of r, g or b goes below zero.
        -- Select different coefficients depending on which component
        -- goes below zero first

        -- Blue component (default)
        local k0 = 1.35733652
        local k1 = -0.00915799
        local k2 = -1.1513021
        local k3 = -0.50559606
        local k4 = 0.00692167
        local wl = -0.0041960863
        local wm = -0.7034186147
        local ws = 1.707614701

        if -1.88170328 * a - 0.80936493 * b > 1 then
            -- Red component
            k0 = 1.19086277
            k1 = 1.76576728
            k2 = 0.59662641
            k3 = 0.75515197
            k4 = 0.56771245
            wl = 4.0767416621
            wm = -3.3077115913
            ws = 0.2309699292
        elseif 1.81444104 * a - 1.19445276 * b > 1 then
            -- Green component
            k0 = 0.73956515
            k1 = -0.45954404
            k2 = 0.08285427
            k3 = 0.1254107
            k4 = 0.14503204
            wl = -1.2684380046
            wm = 2.6097574011
            ws = -0.3413193965
        end

        -- Approximate max saturation using a polynomial:
        local S = k0 + k1 * a + k2 * b + k3 * a * a + k4 * a * b

        -- Do one step Halley's method to get closer
        -- This gives an error less than 10e6, except for
        -- some blue hues where the dS / dh is close to infinite.
        -- this should be sufficient for most applications,
        -- otherwise do two to three steps.

        local k_l <const> = 0.3963377774 * a + 0.2158037573 * b
        local k_m <const> = -0.1055613458 * a - 0.0638541728 * b
        local k_s <const> = -0.0894841775 * a - 1.291485548 * b

        do
            local l_ <const> = 1.0 + S * k_l
            local m_ <const> = 1.0 + S * k_m
            local s_ <const> = 1.0 + S * k_s

            local l_sq <const> = l_ * l_
            local m_sq <const> = m_ * m_
            local s_sq <const> = s_ * s_

            local l <const> = l_sq * l_
            local m <const> = m_sq * m_
            local s <const> = s_sq * s_

            local l_dS <const> = 3.0 * k_l * l_sq
            local m_dS <const> = 3.0 * k_m * m_sq
            local s_dS <const> = 3.0 * k_s * s_sq

            local l_dS2 <const> = 6.0 * k_l * k_l * l_
            local m_dS2 <const> = 6.0 * k_m * k_m * m_
            local s_dS2 <const> = 6.0 * k_s * k_s * s_

            local f <const> = wl * l + wm * m + ws * s
            local f1 <const> = wl * l_dS + wm * m_dS + ws * s_dS
            local f2 <const> = wl * l_dS2 + wm * m_dS2 + ws * s_dS2

            local s_denom <const> = f1 * f1 - 0.5 * f * f2
            if s_denom ~= 0.0 then S = S - f * f1 / s_denom end
        end

        return S
    else
        return 0.0
    end
end

-- finds L_cusp and C_cusp for a given hue
-- a and b must be normalized so a^2 + b^2 == 1
---@param a number
---@param b number
---@return number L
---@return number C
---@nodiscard
function ok_color.find_cusp(a, b)
    -- First, find the maximum saturation (saturation S = C/L)
    local S_cusp <const> = ok_color.compute_max_saturation(a, b)

    -- Convert to linear sRGB to find the first point
    -- where at least one of r,g or b >= 1:
    local r_at_max <const>,
    g_at_max <const>,
    b_at_max <const> = ok_color.oklab_to_linear_srgb(
        1.0, S_cusp * a, S_cusp * b)
    local max_comp <const> = math.max(r_at_max, g_at_max, b_at_max)
    if max_comp ~= 0.0 then
        local L_cusp <const> = (1.0 / max_comp) ^ 0.3333333333333333
        return L_cusp, L_cusp * S_cusp
    else
        return 0.0, 0.0
    end
end

-- Finds intersection of the line defined by
-- L = L0 * (1 - t) + t * L1
-- C = t * C1
-- a and b must be normalized so a^2 + b^2 == 1
---@param a number
---@param b number
---@param L1 number
---@param C1 number
---@param L0 number
---@param xL number?
---@param xC number?
---@return number
---@nodiscard
function ok_color.find_gamut_intersection(a, b, L1, C1, L0, xL, xC)
    -- Find the cusp of the gamut triangle
    local cuspL, cuspC = xL, xC
    if (not cuspL) or (not cuspC) then
        cuspL, cuspC = ok_color.find_cusp(a, b)
    end

    -- Find the intersection for upper and lower half separately
    local t = 0.0
    if ((L1 - L0) * cuspC - (cuspL - L0) * C1) <= 0.0 then
        -- Lower half
        local t_denom <const> = C1 * cuspL + cuspC * (L0 - L1)
        if t_denom ~= 0.0 then t = cuspC * L0 / t_denom end
    else
        -- Upper half
        -- First intersect with triangle
        local t_denom <const> = C1 * (cuspL - 1.0) + cuspC * (L0 - L1)
        if t_denom ~= 0.0 then t = cuspC * (L0 - 1.0) / t_denom end

        -- Then one step Halley's method
        do
            local dL <const> = L1 - L0
            local dC <const> = C1

            local k_l <const> = 0.3963377774 * a + 0.2158037573 * b
            local k_m <const> = -0.1055613458 * a - 0.0638541728 * b
            local k_s <const> = -0.0894841775 * a - 1.291485548 * b

            local l_dt <const> = dL + dC * k_l
            local m_dt <const> = dL + dC * k_m
            local s_dt <const> = dL + dC * k_s

            -- If higher accuracy is required, 2 or 3 iterations
            -- of the following block can be used:
            do
                local L <const> = (1.0 - t) * L0 + t * L1
                local C <const> = t * C1

                local l_ <const> = L + C * k_l
                local m_ <const> = L + C * k_m
                local s_ <const> = L + C * k_s

                local l_sq <const> = l_ * l_
                local m_sq <const> = m_ * m_
                local s_sq <const> = s_ * s_

                local l <const> = l_sq * l_
                local m <const> = m_sq * m_
                local s <const> = s_sq * s_

                local ldt <const> = 3.0 * l_dt * l_sq
                local mdt <const> = 3.0 * m_dt * m_sq
                local sdt <const> = 3.0 * s_dt * s_sq

                local ldt2 <const> = 6.0 * (l_dt * l_dt) * l_
                local mdt2 <const> = 6.0 * (m_dt * m_dt) * m_
                local sdt2 <const> = 6.0 * (s_dt * s_dt) * s_

                local r0 <const> = 4.076741661347994 * l - 3.3077115904081933 * m + 0.23096992872942793 * s - 1.0
                local r1 <const> = 4.076741661347994 * ldt - 3.3077115904081933 * mdt + 0.23096992872942793 * sdt
                local r2 <const> = 4.076741661347994 * ldt2 - 3.3077115904081933 * mdt2 + 0.23096992872942793 * sdt2

                local r_denom <const> = r1 * r1 - 0.5 * r0 * r2
                local u_r <const> = r_denom ~= 0.0 and r1 / r_denom or 0.0
                local t_r = -r0 * u_r

                local g0 <const> = -1.2684380040921763 * l + 2.6097574006633715 * m - 0.3413193963102196 * s - 1.0
                local g1 <const> = -1.2684380040921763 * ldt + 2.6097574006633715 * mdt - 0.3413193963102196 * sdt
                local g2 <const> = -1.2684380040921763 * ldt2 + 2.6097574006633715 * mdt2 - 0.3413193963102196 * sdt2

                local g_denom <const> = g1 * g1 - 0.5 * g0 * g2
                local u_g <const> = g_denom ~= 0.0 and g1 / g_denom or 0.0
                local t_g = -g0 * u_g

                local b0 <const> = -0.004196086541837079 * l - 0.7034186144594495 * m + 1.7076147009309446 * s - 1.0
                local b1 <const> = -0.004196086541837079 * ldt - 0.7034186144594495 * mdt + 1.7076147009309446 * sdt
                local b2 <const> = -0.004196086541837079 * ldt2 - 0.7034186144594495 * mdt2 + 1.7076147009309446 * sdt2

                local b_denom <const> = b1 * b1 - 0.5 * b0 * b2
                local u_b <const> = b_denom ~= 0.0 and b1 / b_denom or 0.0
                local t_b = -b0 * u_b

                if u_r < 0.0 then t_r = 3.40282347e+38 end
                if u_g < 0.0 then t_g = 3.40282347e+38 end
                if u_b < 0.0 then t_b = 3.40282347e+38 end

                t = t + math.min(t_r, t_g, t_b)
            end
        end
    end

    return t
end

---@param L number
---@param a_ number
---@param b_ number
---@return number C_0
---@return number C_mid
---@return number C_max
---@nodiscard
function ok_color.get_Cs(L, a_, b_)
    local cuspL, cuspC <const> = ok_color.find_cusp(a_, b_)
    local C_max <const> = ok_color.find_gamut_intersection(
        a_, b_, L, 1.0, L, cuspL, cuspC)
    local S_max <const>, T_max <const> = ok_color.to_ST(cuspL, cuspC)

    -- Scale factor to compensate for the curved part of gamut shape:
    local k = 0.0
    local k_denom <const> = math.min(L * S_max, (1.0 - L) * T_max)
    if k_denom ~= 0.0 then k = C_max / k_denom end

    local C_mid = 0.0
    do
        local S_mid <const>, T_mid <const> = ok_color.get_ST_mid(a_, b_)

        -- Use a soft minimum function, instead of a sharp triangle
        -- shape to get a smooth value for chroma.
        local C_a <const> = L * S_mid
        local C_b <const> = (1.0 - L) * T_mid

        local cae4 <const> = (C_a * C_a) * (C_a * C_a)
        local cbe4 <const> = (C_b * C_b) * (C_b * C_b)
        C_mid = 0.9 * k * ((1.0 / (1.0 / cae4 + 1.0 / cbe4)) ^ 0.25)
    end

    local C_0 = 0.0
    do
        -- for C_0, the shape is independent of hue, so ST are constant.
        -- Values picked to roughly be the average values of ST.
        local C_a <const> = L * 0.4
        local C_b <const> = (1.0 - L) * 0.8

        -- Use a soft minimum function, instead of a sharp triangle
        -- shape to get a smooth value for chroma.
        local cae2 <const> = C_a * C_a
        local cbe2 <const> = C_b * C_b
        C_0 = math.sqrt(1.0 / (1.0 / cae2 + 1.0 / cbe2))
    end

    return C_0, C_mid, C_max
end

-- Returns a smooth approximation of the location of the cusp
-- This polynomial was created by an optimization process
-- It has been designed so that S_mid < S_max and T_mid < T_max
---@param a_ number
---@param b_ number
---@return number S
---@return number T
---@nodiscard
function ok_color.get_ST_mid(a_, b_)
    local S = 0.11516993
    local s_denom <const> = 7.4477897 + 4.1590124 * b_
        + a_ * (-2.19557347 + 1.75198401 * b_
            + a_ * (-2.13704948 - 10.02301043 * b_
                + a_ * (-4.24894561 + 5.38770819 * b_
                    + a_ * 4.69891013)))
    if s_denom ~= 0.0 then
        S = 0.11516993 + 1.0 / s_denom
    end

    local T = 0.11239642
    local t_denom <const> = 1.6132032 - 0.68124379 * b_
        + a_ * (0.40370612 + 0.90148123 * b_
            + a_ * (-0.27087943 + 0.6122399 * b_
                + a_ * (0.00299215 - 0.45399568 * b_
                    - a_ * 0.14661872)))
    if t_denom ~= 0.0 then
        T = 0.11239642 + 1.0 / t_denom
    end

    return S, T
end

---@param cr number
---@param cg number
---@param cb number
---@return number L
---@return number a
---@return number b
---@nodiscard
function ok_color.linear_srgb_to_oklab(cr, cg, cb)
    -- See https://github.com/svgeesus/svgeesus.github.io/blob/master/
    -- Color/OKLab-notes.md#comparing-standard-code-to-published-matrices
    -- https://github.com/w3c/csswg-drafts/issues/6642#issuecomment-943521484
    -- for discussions about precision.
    local l <const> = (0.4121764591770371 * cr
        + 0.5362739742695891 * cg
        + 0.05144037229550143 * cb) ^ 0.3333333333333333
    local m <const> = (0.21190919958804857 * cr
        + 0.6807178709823131 * cg
        + 0.10739984387775398 * cb) ^ 0.3333333333333333
    local s <const> = (0.08834481407213204 * cr
        + 0.28185396309857735 * cg
        + 0.6302808688015096 * cb) ^ 0.3333333333333333

    return 0.2104542553 * l
        + 0.793617785 * m
        - 0.0040720468 * s,
        1.9779984951 * l
        - 2.428592205 * m
        + 0.4505937099 * s,
        0.0259040371 * l
        + 0.7827717662 * m
        - 0.808675766 * s
end

---@param h number
---@param s number
---@param l number
---@return number L
---@return number a
---@return number b
---@nodiscard
function ok_color.okhsl_to_oklab(h, s, l)
    if l >= 1.0 then return 1.0, 0.0, 0.0 end
    if l <= 0.0 then return 0.0, 0.0, 0.0 end

    local sCl <const> = math.min(math.max(s, 0.0), 1.0)

    local h_rad <const> = h * 6.283185307179586
    local a_ <const> = math.cos(h_rad)
    local b_ <const> = math.sin(h_rad)
    local L <const> = ok_color.toe_inv(l)

    local C_0 <const>,
    C_mid <const>,
    C_max <const> = ok_color.get_Cs(L, a_, b_)

    local mid <const> = 0.8
    local mid_inv <const> = 1.25

    local C = 0.0
    local t = 0.0
    local k_0 = 0.0
    local k_1 = 0.0
    local k_2 = 0.0
    if sCl < mid then
        t = mid_inv * sCl

        k_1 = mid * C_0
        if C_mid ~= 0.0 then
            k_2 = 1.0 - k_1 / C_mid
        end

        local k_denom <const> = 1.0 - k_2 * t
        if k_denom ~= 0.0 then
            C = t * k_1 / k_denom
        end
    else
        local t_denom <const> = 1.0 - mid
        if t_denom ~= 0.0 then
            t = (sCl - mid) / t_denom
        end

        k_0 = C_mid
        if C_0 ~= 0.0 then
            k_1 = (1.0 - mid) * C_mid * C_mid * mid_inv * mid_inv / C_0
        end

        local C_denom <const> = C_max - C_mid
        k_2 = 1.0
        if C_denom ~= 0.0 then
            k_2 = 1.0 - k_1 / C_denom
        end

        local k_denom <const> = 1.0 - k_2 * t
        if k_denom ~= 0.0 then
            C = k_0 + t * k_1 / k_denom
        end
    end

    return L,
        C * a_,
        C * b_
end

---@param h number
---@param s number
---@param l number
---@return number r
---@return number g
---@return number b
---@nodiscard
function ok_color.okhsl_to_srgb(h, s, l)
    local L <const>, a <const>, b <const> = ok_color.okhsl_to_oklab(h, s, l)
    return ok_color.oklab_to_srgb(L, a, b)
end

---@param h number
---@param s number
---@param v number
---@return number L
---@return number a
---@return number b
---@nodiscard
function ok_color.okhsv_to_oklab(h, s, v)
    if v <= 0.0 then return 0.0, 0.0, 0.0 end
    if v > 1.0 then v = 1.0 end

    local sCl <const> = math.min(math.max(s, 0.0), 1.0)

    local h_rad <const> = h * 6.283185307179586
    local a_ <const> = math.cos(h_rad)
    local b_ <const> = math.sin(h_rad)

    local cuspL <const>, cuspC <const> = ok_color.find_cusp(a_, b_)
    local S_max <const>, T_max <const> = ok_color.to_ST(cuspL, cuspC)
    local S_0 <const> = 0.5
    local k <const> = S_max ~= 0.0 and 1.0 - S_0 / S_max or 1.0

    -- First, we compute L and V as if the gamut is a perfect triangle:

    -- L, C when v==1:
    local v_denom <const> = S_0 + T_max - T_max * k * sCl
    local L_v = 1.0
    local C_v = 0.0
    if v_denom ~= 0.0 then
        L_v = 1.0 - sCl * S_0 / v_denom
        C_v = sCl * T_max * S_0 / v_denom
    end

    local L = v * L_v
    local C = v * C_v

    -- Then we compensate for both toe and the curved top part of the triangle:
    local L_vt <const> = ok_color.toe_inv(L_v)
    local C_vt <const> = L_v ~= 0.0 and C_v * L_vt / L_v or 0.0

    local L_new <const> = ok_color.toe_inv(L)
    if L ~= 0.0 then
        C = C * L_new / L
    else
        C = 0.0
    end
    L = L_new

    local r_scale <const>,
    g_scale <const>,
    b_scale <const> = ok_color.oklab_to_linear_srgb(L_vt, a_ * C_vt, b_ * C_vt)
    local max_comp <const> = math.max(
        r_scale,
        g_scale,
        b_scale, 0.0)
    local scale_L <const> = max_comp ~= 0.0
        and (1.0 / max_comp) ^ 0.3333333333333333
        or 0.0

    C = C * scale_L
    return L * scale_L,
        C * a_,
        C * b_
end

---@param h number
---@param s number
---@param v number
---@return number r
---@return number g
---@return number b
---@nodiscard
function ok_color.okhsv_to_srgb(h, s, v)
    local L <const>, a <const>, b <const> = ok_color.okhsv_to_oklab(h, s, v)
    return ok_color.oklab_to_srgb(L, a, b)
end

---@param lgt number
---@param a number
---@param b number
---@return number red
---@return number green
---@return number blue
---@nodiscard
function ok_color.oklab_to_linear_srgb(lgt, a, b)
    local l_cbrt <const> = 0.9999999984505196 * lgt
        + 0.39633779217376774 * a
        + 0.2158037580607588 * b
    local m_cbrt <const> = 1.0000000088817607 * lgt
        - 0.10556134232365633 * a
        - 0.0638541747717059 * b
    local s_cbrt <const> = 1.0000000546724108 * lgt
        - 0.08948418209496574 * a
        - 1.2914855378640917 * b

    local l <const> = (l_cbrt * l_cbrt) * l_cbrt
    local m <const> = (m_cbrt * m_cbrt) * m_cbrt
    local s <const> = (s_cbrt * s_cbrt) * s_cbrt

    return 4.076741661347994 * l
        - 3.3077115904081933 * m
        + 0.23096992872942793 * s,
        -1.2684380040921763 * l
        + 2.6097574006633715 * m
        - 0.3413193963102196 * s,
        -0.004196086541837079 * l
        - 0.7034186144594495 * m
        + 1.7076147009309446 * s
end

---@param L number
---@param a number
---@param b number
---@return number h
---@return number s
---@return number l
---@nodiscard
function ok_color.oklab_to_okhsl(L, a, b)
    if L >= 1.0 then return 0.0, 0.0, 1.0 end
    if L <= 0.0 then return 0.0, 0.0, 0.0 end

    local a_ = a
    local b_ = b
    local Csq = a_ * a_ + b_ * b_
    if Csq > 0.0 then
        local C <const> = math.sqrt(Csq)
        a_ = a_ / C
        b_ = b_ / C

        -- 1.0 / tau = 0.1591549430919
        local h <const> = math.atan(-b_, -a_) * 0.1591549430919 + 0.5

        local C_0 <const>,
        C_mid <const>,
        C_max <const> = ok_color.get_Cs(L, a_, b_)

        -- Inverse of the interpolation in okhsl_to_srgb:
        local mid <const> = 0.8
        local mid_inv <const> = 1.25

        local s = 0.0
        if C < C_mid then
            local k_1 <const> = mid * C_0
            local k_2 = 1.0
            if C_mid ~= 0.0 then
                k_2 = (1.0 - k_1 / C_mid)
            end

            local t_denom <const> = k_1 + k_2 * C
            local t = 0.0
            if t_denom ~= 0.0 then
                t = C / t_denom
            end

            s = t * mid
        else
            local k_0 <const> = C_mid
            local k_1 = 0.0
            if C_0 ~= 0.0 then
                k_1 = (1.0 - mid) * C_mid * C_mid * mid_inv * mid_inv / C_0
            end

            local C_denom <const> = C_max - C_mid
            local k_2 = 1.0
            if C_denom ~= 0.0 then
                k_2 = 1.0 - k_1 / C_denom
            end

            local t_denom <const> = k_1 + k_2 * (C - k_0)
            local t = 0.0
            if t_denom ~= 0.0 then
                t = (C - k_0) / t_denom
            end

            s = mid + (1.0 - mid) * t
        end

        return h, s, ok_color.toe(L)
    else
        return 0.0, 0.0, L
    end
end

---@param L number
---@param a number
---@param b number
---@return number h
---@return number s
---@return number v
---@nodiscard
function ok_color.oklab_to_okhsv(L, a, b)
    if L >= 1.0 then return 0.0, 0.0, 1.0 end
    if L <= 0.0 then return 0.0, 0.0, 0.0 end

    local a_ = a
    local b_ = b
    local Csq <const> = a_ * a_ + b_ * b_
    if Csq > 0.0 then
        local C = math.sqrt(Csq)
        a_ = a_ / C
        b_ = b_ / C

        -- 1.0 / tau = 0.1591549430919
        local h <const> = math.atan(-b_, -a_) * 0.1591549430919 + 0.5

        local cuspL <const>, cuspC <const> = ok_color.find_cusp(a_, b_)
        local S_max <const>, T_max <const> = ok_color.to_ST(cuspL, cuspC)
        local S_0 <const> = 0.5
        local k <const> = S_max ~= 0.0 and 1.0 - S_0 / S_max or 1.0

        -- first we find L_v, C_v, L_vt and C_vt
        local t_denom <const> = C + L * T_max
        local t <const> = t_denom ~= 0.0 and T_max / t_denom or 0.0
        local L_v <const> = t * L
        local C_v <const> = t * C

        local L_vt <const> = ok_color.toe_inv(L_v)
        local C_vt <const> = L_v ~= 0.0 and C_v * L_vt / L_v or 0.0

        -- we can then use these to invert the step that compensates
        -- for the toe and the curved top part of the triangle:
        local r_scale <const>, g_scale <const>, b_scale <const> = ok_color.oklab_to_linear_srgb(
            L_vt, a_ * C_vt, b_ * C_vt)
        local scale_denom <const> = math.max(
            r_scale,
            g_scale,
            b_scale, 0.0)
        local scale_L = 0.0
        if scale_denom ~= 0.0 then
            scale_L = (1.0 / scale_denom) ^ 0.3333333333333333
            L = L / scale_L
            C = C / scale_L
        end

        local toel <const> = ok_color.toe(L)
        C = C * toel / L
        L = toel

        -- we can now compute v and s:
        local v = 0.0
        if L_v ~= 0.0 then v = L / L_v end

        local s = 0.0
        local s_denom <const> = ((T_max * S_0) + T_max * k * C_v)
        if s_denom ~= 0.0 then
            s = (S_0 + T_max) * C_v / s_denom
        end

        return h, s, v
    else
        return 0.0, 0.0, L
    end
end

---@param L number
---@param a number
---@param b number
---@return number r
---@return number g
---@return number b
---@nodiscard
function ok_color.oklab_to_srgb(L, a, b)
    local lr <const>, lg <const>, lb <const> = ok_color.oklab_to_linear_srgb(
        L, a, b)
    return ok_color.srgb_transfer_function(lr),
        ok_color.srgb_transfer_function(lg),
        ok_color.srgb_transfer_function(lb)
end

---@param red number
---@param green number
---@param blue number
---@return number h
---@return number s
---@return number l
---@nodiscard
function ok_color.srgb_to_okhsl(red, green, blue)
    local L <const>, a <const>, b <const> = ok_color.srgb_to_oklab(
        red, green, blue)
    return ok_color.oklab_to_okhsl(L, a, b)
end

---@param red number
---@param green number
---@param blue number
---@return number h
---@return number s
---@return number v
---@nodiscard
function ok_color.srgb_to_okhsv(red, green, blue)
    local L <const>, a <const>, b <const> = ok_color.srgb_to_oklab(
        red, green, blue)
    return ok_color.oklab_to_okhsv(L, a, b)
end

---@param red number
---@param green number
---@param blue number
---@return number L
---@return number a
---@return number b
---@nodiscard
function ok_color.srgb_to_oklab(red, green, blue)
    return ok_color.linear_srgb_to_oklab(
        ok_color.srgb_transfer_function_inv(red),
        ok_color.srgb_transfer_function_inv(green),
        ok_color.srgb_transfer_function_inv(blue))
end

---@param a number
---@return number
---@nodiscard
function ok_color.srgb_transfer_function(a)
    if 0.0031308 >= a then
        return 12.92 * a
    else
        return 1.055 * (a ^ 0.4166666666666667) - 0.055
    end
end

---@param a number
---@return number
---@nodiscard
function ok_color.srgb_transfer_function_inv(a)
    if 0.04045 < a then
        return ((a + 0.055) * 0.9478672985781991) ^ 2.4
    else
        return a * 0.07739938080495357
    end
end

---@param L number
---@param C number
---@return number S
---@return number T
---@nodiscard
function ok_color.to_ST(L, C)
    if L ~= 0.0 and L ~= 1.0 then
        return C / L, C / (1.0 - L)
    elseif L ~= 0.0 then
        return C / L, 0.0
    elseif L ~= 1.0 then
        return 0.0, C / (1.0 - L)
    else
        return 0.0, 0.0
    end
end

---@param x number
---@return number
---@nodiscard
function ok_color.toe(x)
    local y <const> = 1.170873786407767 * x - 0.206
    return 0.5 * (y + math.sqrt(y * y + 0.14050485436893204 * x))
end

---@param x number
---@return number
---@nodiscard
function ok_color.toe_inv(x)
    local denom <const> = 1.170873786407767 * (x + 0.03)
    if denom ~= 0.0 then
        return (x * x + 0.206 * x) / denom
    else
        return 0.0
    end
end

-- END OF OKLAB CONVERSIONS

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
	
	-- Separate the left and right
	local copyColorAmountLeft = copyColorAmount - hasLeft
	local copyColorAmountRight = copyColorAmount - hasRight
	
	-- Let's get the actual numbers
	local addNumber = 0
	if hasCenter == true then
		if hasLeft == 1 then
		table.insert(tempTable, 1)
		end
		for i = 1 , copyColorAmountLeft do
			addNumber = math.abs(1-(i * (100/(copyColorAmountLeft+1)))/100)
			table.insert(tempTable, addNumber)
		end
		table.insert(tempTable, 0)
		for i = 1 , copyColorAmountRight do
			addNumber = (i * (100/(copyColorAmountRight+1)))/100
			table.insert(tempTable, addNumber)
		end
		if hasRight == 1 then
		table.insert(tempTable, 1)
		end
	else
		if hasLeft == 1 then
		table.insert(tempTable, 1)
		end
		for i = 1 , copyColorAmountLeft do
			addNumber = ((100/copyColorAmountLeft)*(copyColorAmountLeft-(i*((copyColorAmountLeft*2)/(copyColorAmountLeft*2+1)))))/100
			table.insert(tempTable, addNumber)
		end
		for i = 1 , copyColorAmountRight do
			addNumber = ((100/copyColorAmountRight)*(math.abs((((copyColorAmountRight*2)/(copyColorAmountRight*2+1))*copyColorAmountRight)-copyColorAmountRight)+((i-1)*((copyColorAmountRight*2)/(copyColorAmountRight*2+1)))))/100
			table.insert(tempTable, addNumber)
		end
		if hasRight == 1 then
		table.insert(tempTable, 1)
		end
	end
	CT = tempTable
	-- -- DEBUG
	-- for k,v in pairs(tempTable) do
	-- print(v)  
	-- end
	-- -- DEBUG END
end

-- STUFF TO MAKE THE CALCULATIONS MORE COMPACT... BECAUSE OTHERWISE MY APPROACH GETS WAYYYY OUT OF HAND
-- Going from 10 easing functions to 23 seems.. excessive.. I hope that this isn't... TOO much? Drop down menus will get very long..

local easingCalculations =
	{
	Standard = linear,
	Linear = linear,
	Sine = inSine,
	Quad = inQuad,
	Cubic = inCubic,
	Circ = inCirc,
	Quart = inQuart,
	Quint = inQuint,
	Expo = inExpo,
	outSine = outSine,
	outQuad = outQuad,
	outCubic = outCubic,
	outCirc = outCirc,
	outQuart = outQuart,
	outQuint = outQuint,
	outExpo = outExpo,
	inOutSine = inOutSine,
	inOutQuad = inOutQuad,
	inOutCubic = inOutCubic,
	inOutCirc = inOutCirc,
	inOutQuart = inOutQuart,
	inOutQuint = inOutQuint,
	inOutExpo = inOutExpo
	}



-- COLOR TABLE GENERATION


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
		-- print (CM.saturation)
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
		if HI == "Standard" or interpolateHardHue == "No" then
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
		if HI == "Standard" or interpolateSoftHue == "No" then
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

local function advancedSettings(windowBounds)
	local dlg
	dlg = Dialog
	{ 
		title = "Chaonic's Advanced Settings"
	}
	dlg
	:separator
	{
		id = "separator",
		text = "Advanced Color Control"
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
			advancedSettings(dlg.bounds)
			reloadColorWindow()
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
			advancedSettings(dlg.bounds)
			reloadColorWindow()
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
			advancedSettings(dlg.bounds)
			reloadColorWindow()
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
			advancedSettings(dlg.bounds)
			reloadColorWindow()
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
			advancedSettings(dlg.bounds)
			reloadColorWindow()
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
			advancedSettings(dlg.bounds)
			reloadColorWindow()
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
			advancedSettings(dlg.bounds)
			reloadColorWindow()
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
			advancedSettings(dlg.bounds)
			reloadColorWindow()
			dlg:close()
		end
	}
	:label
	{
		id = includeSoftHue,
		label = "Include:",
		text= "Soft Hue Interpolation"
	}
	:label
	{
		id = includeHardHue,
		text= "Hard Hue Interpolation"
	}
	:button
	{
		id = "buttonInterpolateSoftHue",
		label = "",
		text = interpolateSoftHue,
		onclick = function()
			if interpolateSoftHue == "No" then
				interpolateSoftHue = "Yes"
			else
				interpolateSoftHue = "No"
			end
			advancedSettings(dlg.bounds)
			reloadColorWindow()
			dlg:close()
		end
	}
	:button
	{
		id = "buttonInterpolateHardHue",
		text = interpolateHardHue,
		onclick = function()
			if interpolateHardHue == "No" then
				interpolateHardHue = "Yes"
			else
				interpolateHardHue = "No"
			end
			advancedSettings(dlg.bounds)
			reloadColorWindow()
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
			VS = 	valStrength
			AS = 	alphaStrength
			HI = 	hueInterpolationVar
			SI = 	satInterpolationVar
			VI = 	valInterpolationVar
			AI =	alphaInterpolationVar
			advancedSettings(dlg.bounds)
			reloadColorWindow()
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
			AOC = 	9
			AOH = 	9
			AOSH = 	6
			HS = 	100
			SS = 	100
			VS = 	100
			AS = 	100
			HI = 	"Standard"
			SI = 	"Sine"
			VI = 	"Standard"
			AI =	"Linear"
			advancedSettings(dlg.bounds)
			reloadColorWindow()
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
			AOC = 	9
			AOH = 	9
			AOSH = 	6
			HS = 	100
			SS = 	100
			VS = 	100
			AS = 	100
			HI = 	"Standard"
			SI = 	"Sine"
			VI = 	"Standard"
			AI =	"Linear"
			advancedSettings(dlg.bounds)
			reloadColorWindow()
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
			AOC = 	9
			AOH = 	9
			AOSH = 	6
			HS = 	100
			SS = 	100
			VS = 	100
			AS = 	100
			HI = 	"Standard"
			SI = 	"Sine"
			VI = 	"Standard"
			AI =	"Linear"
			advancedSettings(dlg.bounds)
			reloadColorWindow()
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
			AOC = 	9
			AOH = 	9
			AOSH = 	6
			HS = 	100
			SS = 	100
			VS = 	100
			AS = 	100
			HI = 	"Standard"
			SI = 	"Sine"
			VI = 	"Standard"
			AI =	"Linear"
			advancedSettings(dlg.bounds)
			reloadColorWindow()
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
			AOC = 	9
			AOH = 	9
			AOSH = 	6
			HS = 	100
			SS = 	100
			VS = 	100
			AS = 	100
			HI = 	"Standard"
			SI = 	"Sine"
			VI = 	"Standard"
			AI =	"Linear"
			advancedSettings(dlg.bounds)
			reloadColorWindow()
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
			AOC = 	9
			AOH = 	9
			AOSH = 	6
			HS = 	100
			SS = 	100
			VS = 	100
			AS = 	100
			HI = 	"Standard"
			SI = 	"Sine"
			VI = 	"Standard"
			AI =	"Linear"
			advancedSettings(dlg.bounds)
			reloadColorWindow()
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
			AOC = 	9
			AOH = 	9
			AOSH = 	6
			HS = 	80
			SS = 	100
			VS = 	100
			AS = 	100
			HI = 	"Standard"
			SI = 	"Sine"
			VI = 	"Standard"
			AI =	"Linear"
			advancedSettings(dlg.bounds)
			reloadColorWindow()
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
			VS = 	presetcustom1valStrength
			AS = 	presetcustom1alphaStrength
			HI = 	presetcustom1hueInterpolationVar
			SI = 	presetcustom1satInterpolationVar
			VI = 	presetcustom1valInterpolationVar
			AI =	presetcustom1alphaInterpolationVar
			advancedSettings(dlg.bounds)
			reloadColorWindow()
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
			VS = 	presetcustom2valStrength
			AS = 	presetcustom2alphaStrength
			HI = 	presetcustom2hueInterpolationVar
			SI = 	presetcustom2satInterpolationVar
			VI = 	presetcustom2valInterpolationVar
			AI =	presetcustom2alphaInterpolationVar
			advancedSettings(dlg.bounds)
			reloadColorWindow()
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
			VS = 	presetcustom3valStrength
			AS = 	presetcustom3alphaStrength
			HI = 	presetcustom3hueInterpolationVar
			SI = 	presetcustom3satInterpolationVar
			VI = 	presetcustom3valInterpolationVar
			AI =	presetcustom3alphaInterpolationVar
			advancedSettings(dlg.bounds)
			reloadColorWindow()
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
			VS = 	presetcustom4valStrength
			AS = 	presetcustom4alphaStrength
			HI = 	presetcustom4hueInterpolationVar
			SI = 	presetcustom4satInterpolationVar
			VI = 	presetcustom4valInterpolationVar
			AI =	presetcustom4alphaInterpolationVar
			advancedSettings(dlg.bounds)
			reloadColorWindow()
			dlg:close()
		end
	}
:separator
	{
		id = "separator",
		text = "",
	}
-- PRESET CONTROL END
	:button
	{
		id = "AdvancedCancel",
		label = "",
		text = "Reload",
		onclick = function()
			advancedSettings(dlg.bounds)
			reloadColorWindow()
			dlg:close()
		end
	}
	:show
	{
	wait = false, bounds = windowBounds
	}
end

local function reloadColors(windowBounds)
	local dlg
	dlg = Dialog
	{ 
		title = "Chaonic's Palette Helper"
	}
	
	-- First, let's get the calculation table
	generateCalcTable()


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
				local tempColor = Color{}
				tempColor = app.fgColor
				CL = Color{}
				CL.red = tempColor.red
				CL.green = tempColor.green
				CL.blue = tempColor.blue
				CL.alpha = tempColor.alpha
				reloadColors(dlg.bounds)
				dlg:close()
		end
	}
	:button
	{
		id = "buttonSetMain",
		text = "Set",
		onclick = function()
				local tempColor = Color{}
				tempColor = app.fgColor
				CM = Color{}
				CM.red = tempColor.red
				CM.green = tempColor.green
				CM.blue = tempColor.blue
				CM.alpha = tempColor.alpha
				reloadColors(dlg.bounds)
				dlg:close()
		end
	}
	:button
	{
		id = "buttonSetRight",
		text = "Set",
		onclick = function(ev)
				local tempColor = Color{}
				tempColor = app.fgColor
				CR = Color{}
				CR.red = tempColor.red
				CR.green = tempColor.green
				CR.blue = tempColor.blue
				CR.alpha = tempColor.alpha
				reloadColors(dlg.bounds)
				dlg:close()
		end
	}
	:button
	{
		id = "buttonSetClipboard",
		text = "Set",
		onclick = function(ev)
				local tempColor = Color{}
				tempColor = app.fgColor
				CC = Color{}
				CC.red = tempColor.red
				CC.green = tempColor.green
				CC.blue = tempColor.blue
				CC.alpha = tempColor.alpha
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
	
	
	-- ADVANCED SETTINGS BUTTON GOES HERE
	:button
	{
	id = "buttonSettings",
		text = "Advanced Settings",
		onclick = function()
			advancedSettings()
		end
	}
-- SHADE
	:separator
	{
		id = "separator",
		text = "Shades"
	}
	:button
	{
		id = "buttonIncludeLeft",
		text = includeLeft,
		onclick = function()
			if includeLeft == "Include Left Color" then
				includeLeft = "*Includes Left Color*"
				hasLeft = 1
				reloadColors(dlg.bounds)
				dlg:close()
			else
				includeLeft = "Include Left Color"
				hasLeft = 0
				reloadColors(dlg.bounds)
				dlg:close()
			end
		end
	}
	:button
	{
		id = "buttonIncludeRight",
		text = includeRight,
		onclick = function()
			if includeRight == "Include Right Color" then
				includeRight = "*Includes Right Color*"
				hasRight = 1
				reloadColors(dlg.bounds)
				dlg:close()
			else
				includeRight = "Include Right Color"
				hasRight = 0
				reloadColors(dlg.bounds)
				dlg:close()
			end
		end
	}
	:button
	{
		id = "buttonCopyColor",
		label = "",
		text = copyColor,
		onclick = function()
			if copyColor == "Copy Color" then
				copyColor = "*Copy Color*"
				saveColor = "Save Color"
				saveLine = "Save Line"
				savePalette = "Gen. Palette"
				reloadColors(dlg.bounds)
				dlg:close()
			else
				copyColor = "Copy Color"
				reloadColors(dlg.bounds)
				dlg:close()
			end
		end
	}
	:button
	{
		id = "buttonSaveColor",
		text = saveColor,
		onclick = function()
			if saveColor == "Save Color" then
				copyColor = "Copy Color"
				saveColor = "*Save Color*"
				saveLine = "Save Line"
				savePalette = "Gen. Palette"
				reloadColors(dlg.bounds)
				dlg:close()
			else
				saveColor = "Save Color"
				reloadColors(dlg.bounds)
				dlg:close()
			end
		end
	}
	:button
	{
		id = "buttonSaveLine",
		text = saveLine,
		onclick = function()
			if saveLine == "Save Line" then
				copyColor = "Copy Color"
				saveColor = "Save Color"
				saveLine = "*Save Line*"
				savePalette = "Gen. Palette"
				reloadColors(dlg.bounds)
				dlg:close()
			else
				saveLine = "Save Line"
				reloadColors(dlg.bounds)
				dlg:close()
			end
		end
	}
	:button
	{
		id = "buttonGeneratePalette",
		text = savePalette,
		onclick = function()
			if savePalette == "Gen. Palette" then
				copyColor = "Copy Color"
				saveColor = "Save Color"
				saveLine = "Save Line"
				savePalette = "*Gen. Palette*"
				reloadColors(dlg.bounds)
				dlg:close()
			else
				savePalette = "Gen. Palette"
				reloadColors(dlg.bounds)
				dlg:close()
			end
		end
	}
	:shades
	{
		id = "paletteShade",
		label = "Custom Shade",
		colors = paletteShadeCalc(),
		onclick =
		function(ev)
			local saveToPalette = Color{}
			if (ev.button == MouseButton.LEFT) and copyColor == "*Copy Color*" then
				app.fgColor = ev.color
			elseif (ev.button == MouseButton.RIGHT) and copyColor == "*Copy Color*" then
				app.bgColor = ev.color
			elseif (ev.button == MouseButton.LEFT) and saveColor == "*Save Color*" then
				for i = 1, AOSH do
				app.command.AddColor
					{
						color = ev.color
					}
				end
			elseif (ev.button == MouseButton.LEFT) and saveLine == "*Save Line*" then
				for i = 1, AOC do
					local saveToPalette = paletteShade[i]
					app.command.AddColor
						{
							color = saveToPalette
						}
			end
			elseif (ev.button == MouseButton.LEFT) and savePalette == "*Gen. Palette*" then
				for y = 1, AOH do
					for i = 1, AOC do
						local saveToPalette = paletteShade[i]
						app.command.AddColor
							{
								color = saveToPalette
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
		end
	}
-- SHADE END
-- LIGHT
	:shades
	{
		id = "paletteLight",
		label = "Light",
		colors = paletteLightCalc(),
		onclick =
		function(ev)
			local saveToPalette = Color{}
			if (ev.button == MouseButton.LEFT) and copyColor == "*Copy Color*" then
				app.fgColor = ev.color
			elseif (ev.button == MouseButton.RIGHT) and copyColor == "*Copy Color*" then
				app.bgColor = ev.color
			elseif (ev.button == MouseButton.LEFT) and saveColor == "*Save Color*" then
				for i = 1, AOSH do
				app.command.AddColor
					{
						color = ev.color
					}
				end
			elseif (ev.button == MouseButton.LEFT) and saveLine == "*Save Line*" then
				for i = 1, AOC do
					local saveToPalette = paletteLight[i]
					app.command.AddColor
						{
							color = saveToPalette
						}
			end
			elseif (ev.button == MouseButton.LEFT) and savePalette == "*Gen. Palette*" then
				for y = 1, AOH do
					for i = 1, AOC do
						local saveToPalette = paletteLight[i]
						app.command.AddColor
							{
								color = saveToPalette
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
		end
	}
-- LIGHT END
-- VALUE
	:shades
	{
		id = "paletteValue",
		label = "Value",
		colors = paletteValueCalc(),
		onclick =
		function(ev)
			local saveToPalette = Color{}
			if (ev.button == MouseButton.LEFT) and copyColor == "*Copy Color*" then
				app.fgColor = ev.color
			elseif (ev.button == MouseButton.RIGHT) and copyColor == "*Copy Color*" then
				app.bgColor = ev.color
			elseif (ev.button == MouseButton.LEFT) and saveColor == "*Save Color*" then
				for i = 1, AOSH do
				app.command.AddColor
					{
						color = ev.color
					}
				end
			elseif (ev.button == MouseButton.LEFT) and saveLine == "*Save Line*" then
				for i = 1, AOC do
					local saveToPalette = paletteValue[i]
					app.command.AddColor
						{
							color = saveToPalette
						}
			end
			elseif (ev.button == MouseButton.LEFT) and savePalette == "*Gen. Palette*" then
				for y = 1, AOH do
					for i = 1, AOC do
						local saveToPalette = paletteValue[i]
						app.command.AddColor
							{
								color = saveToPalette
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
		end
	}
-- VALUE END
-- SATURATION
	:shades
	{
		id = "paletteSaturation",
		label = "Saturation",
		colors = paletteSaturationCalc(),
		onclick =
		function(ev)
			local saveToPalette = Color{}
			if (ev.button == MouseButton.LEFT) and copyColor == "*Copy Color*" then
				app.fgColor = ev.color
			elseif (ev.button == MouseButton.RIGHT) and copyColor == "*Copy Color*" then
				app.bgColor = ev.color
			elseif (ev.button == MouseButton.LEFT) and saveColor == "*Save Color*" then
				for i = 1, AOSH do
				app.command.AddColor
					{
						color = ev.color
					}
				end
			elseif (ev.button == MouseButton.LEFT) and saveLine == "*Save Line*" then
				for i = 1, AOC do
					local saveToPalette = paletteSaturation[i]
					app.command.AddColor
						{
							color = saveToPalette
						}
			end
			elseif (ev.button == MouseButton.LEFT) and savePalette == "*Gen. Palette*" then
				for y = 1, AOH do
					for i = 1, AOC do
						local saveToPalette = paletteSaturation[i]
						app.command.AddColor
							{
								color = saveToPalette
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
		end
	}
-- SATURATION END
-- SOFT HUE
	:shades
	{
		id = "paletteSoftHue",
		label = "Soft Hue",
		colors = paletteSoftHueCalc(),
		onclick =
		function(ev)
			if (ev.button == MouseButton.LEFT) and copyColor == "*Copy Color*" then
				app.fgColor = ev.color
			elseif (ev.button == MouseButton.RIGHT) and copyColor == "*Copy Color*" then
				app.bgColor = ev.color
			elseif (ev.button == MouseButton.LEFT) and saveColor == "*Save Color*" then
				for i = 1, AOSH do
				app.command.AddColor
					{
						color = ev.color
					}
				end
			elseif (ev.button == MouseButton.LEFT) and saveLine == "*Save Line*" then
				for i = 1, AOSH do
				app.command.AddColor
					{
						color = paletteSoftHue[i]
					}
				end
			elseif (ev.button == MouseButton.LEFT) and savePalette == "*Gen. Palette*" then
				for y = 1, AOH do
					for i = 1, AOSH do
						local saveToPalette = paletteSoftHue[i]
						app.command.AddColor
							{
								color = saveToPalette
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
		end
	}
-- SOFT HUE END
-- HARD HUE
	:shades
	{
		id = "paletteHardHue",
		label = "Hard Hue",
		colors = paletteHueCalc(),
		onclick =
		function(ev)
			if (ev.button == MouseButton.LEFT) and copyColor == "*Copy Color*" then
				app.fgColor = ev.color
			elseif (ev.button == MouseButton.RIGHT) and copyColor == "*Copy Color*" then
				app.bgColor = ev.color
			elseif (ev.button == MouseButton.LEFT) and saveColor == "*Save Color*" then
				for i = 1, AOSH do
				app.command.AddColor
					{
						color = ev.color
					}
				end
			elseif (ev.button == MouseButton.LEFT) and saveLine == "*Save Line*" then
				local saveToPalette = Color{}
				for i = 1, AOH do
					saveToPalette = paletteHue[i]
					app.command.AddColor
						{
							color = saveToPalette
						}
				end
			elseif (ev.button == MouseButton.LEFT) and savePalette == "*Gen. Palette*" then
				local saveToPalette = Color{}
				for i = 1, AOH do
					saveToPalette = paletteHue[i]
					app.command.AddColor
						{
							color = saveToPalette
						}
				end
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
			CR = colorRight
			CC = colorClipboard
			AOC = amountOfColorsVar
			AOSH = amountOfSoftHuesVar
			AOH = amountOfHuesVar
			HS = hueStrength
			SS = satStrength
			VS = valStrength
			AS = alphaStrength
			HI = hueInterpolationVar
			SI = satInterpolationVar
			VI = valInterpolationVar
			AI = alphaInterpolationVar
			reloadColors()
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
	function reloadColorWindow()
		reloadColors(dlg.bounds)
		dlg:close()
	end
end



do
	reloadColors()
	-- -- table.save({ r = 15, g = 15, b = { r = 15, g = 15, b = 30, a = 255 }, a = 255 },"corn.lua")
end