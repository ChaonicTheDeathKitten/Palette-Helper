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
local presetcustom1valStrenght =				100
local presetcustom1alpaStrength =				100
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
local presetcustom2valStrenght =				100
local presetcustom2alpaStrength =				100
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
local presetcustom3valStrenght =				100
local presetcustom3alpaStrength =				100
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
local presetcustom4valStrenght =				100
local presetcustom4alpaStrength =				100
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
local valStrenght = 100
local alpaStrength = 100
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

-- OKHSL CONVERSIONS
-- These calculations were taken from https://bottosson.github.io/posts/colorpicker/

--[[
	MIT LICENSE
	Copyright (c) 2021 Björn Ottosson

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
  ]]

local ok_color = {}

ok_color.Lab = { L = 0, a = 0, b = 0 }
ok_color.RGB = { r = 0, g = 0, b = 0 }
ok_color.HSV = { h = 0, s = 0, v = 0 }
ok_color.HSL = { h = 0, s = 0, l = 0 }
ok_color.LC = { L = 0, C = 0 }

ok_color.ST = { S = 0, T = 0 }
ok_color.pi = 3.1415926535897932384626433832795028841971693993751058209749445923078164062
function ok_color.clamp(x, min, max)
    if x < min then
        return min
    end
    if x > max then
        return max
    end
    return x
end
function ok_color.sgn(x)
    return (0 < x and 1 or 0) - (x < 0 and 1 or 0)
end
function ok_color.srgb_transfer_function(a)
    return 0.0031308 >= a and 12.92 * a or 1.055 * a ^ 0.4166666666666667 - 0.055
end
function ok_color.srgb_transfer_function_inv(a)
    return 0.04045 < a and ((a + 0.055) / 1.055) ^ 2.4 or a / 12.92
end
function ok_color.linear_srgb_to_oklab(c)
    local l = 0.4122214708 * c.r + 0.5363325363 * c.g + 0.0514459929 * c.b
    local m = 0.2119034982 * c.r + 0.6806995451 * c.g + 0.1073969566 * c.b
    local s = 0.0883024619 * c.r + 0.2817188376 * c.g + 0.6299787005 * c.b
    local l_ = l ^ (1/3)
    local m_ = m ^ (1/3)
    local s_ = s ^ (1/3)
    return {
        0.2104542553 * l_ + 0.7936177850 * m_ - 0.0040720468 * s_,
        1.9779984951 * l_ - 2.4285922050 * m_ + 0.4505937099 * s_,
        0.0259040371 * l_ + 0.7827717662 * m_ - 0.8086757660 * s_,
    }
end
function ok_color.oklab_to_linear_srgb(c)
    local l_ = c.L + 0.3963377774 * c.a + 0.2158037573 * c.b
    local m_ = c.L - 0.1055613458 * c.a - 0.0638541728 * c.b
    local s_ = c.L - 0.0894841775 * c.a - 1.2914855480 * c.b
    local l = l_ ^ 3
    local m = m_ ^ 3
    local s = s_ ^ 3
    return {
        4.0767416621 * l - 3.3077115913 * m + 0.2309699292 * s,
        -1.2684380046 * l + 2.6097574011 * m - 0.3413193965 * s,
        -0.0041960863 * l - 0.7034186147 * m + 1.7076147010 * s,
    }
end
function ok_color.compute_max_saturation(a, b)
    local k0, k1, k2, k3, k4, wl, wm, ws
    if -1.88170328 * a - 0.80936493 * b > 1 then
        k0 = 1.19086277; k1 = 1.76576728; k2 = 0.59662641; k3 = 0.75515197; k4 = 0.56771245
        wl = 4.0767416621; wm = -3.3077115913; ws = 0.2309699292
    elseif 1.81444104 * a - 1.19445276 * b > 1 then
        k0 = 0.73956515; k1 = -0.45954404; k2 = 0.08285427; k3 = 0.12541070; k4 = 0.14503204
        wl = -1.2684380046; wm = 2.6097574011; ws = -0.3413193965
    else
        k0 = 1.35733652; k1 = -0.00915799; k2 = -1.15130210; k3 = -0.50559606; k4 = 0.00692167
        wl = -0.0041960863; wm = -0.7034186147; ws = 1.7076147010
    end
    local S = k0 + k1 * a + k2 * b + k3 * a * a + k4 * a * b
    local k_l = 0.3963377774 * a + 0.2158037573 * b
    local k_m = -0.1055613458 * a - 0.0638541728 * b
    local k_s = -0.0894841775 * a - 1.2914855480 * b
    local l_ = 1 + S * k_l
    local m_ = 1 + S * k_m
    local s_ = 1 + S * k_s
    local l = l_ ^ 3
    local m = m_ ^ 3
    local s = s_ ^ 3
    local l_dS = 3 * k_l * l_ * l_
    local m_dS = 3 * k_m * m_ * m_
    local s_dS = 3 * k_s * s_ * s_
    local l_dS2 = 6 * k_l * k_l * l_
    local m_dS2 = 6 * k_m * k_m * m_
    local s_dS2 = 6 * k_s * k_s * s_
    local f = wl * l + wm * m + ws * s
    local f1 = wl * l_dS + wm * m_dS + ws * s_dS
    local f2 = wl * l_dS2 + wm * m_dS2 + ws * s_dS2
    S = S - f * f1 / (f1 * f1 - 0.5 * f * f2)
    return S
end
function ok_color.find_cusp(a, b)
    local S_cusp = ok_color.compute_max_saturation(a, b)
    local rgb_at_max = ok_color.oklab_to_linear_srgb({ 1, S_cusp * a, S_cusp * b })
    local L_cusp = cbrtf(1 / math.max(math.max(rgb_at_max.r, rgb_at_max.g), rgb_at_max.b))
    local C_cusp = L_cusp * S_cusp
    return { L_cusp, C_cusp }
end
function ok_color.find_gamut_intersection(a, b, L1, C1, L0, cusp)
    local t
    if (L1 - L0) * cusp.C - (cusp.L - L0) * C1 <= 0 then
        t = cusp.C * L0 / (C1 * cusp.L + cusp.C * (L0 - L1))
    else
        t = cusp.C * (L0 - 1) / (C1 * (cusp.L - 1) + cusp.C * (L0 - L1))
        local dL = L1 - L0
        local dC = C1
        local k_l = 0.3963377774 * a + 0.2158037573 * b
        local k_m = -0.1055613458 * a - 0.0638541728 * b
        local k_s = -0.0894841775 * a - 1.2914855480 * b
        local l_dt = dL + dC * k_l
        local m_dt = dL + dC * k_m
        local s_dt = dL + dC * k_s
        local L = L0 * (1 - t) + t * L1
        local C = t * C1
        local l_ = L + C * k_l
        local m_ = L + C * k_m
        local s_ = L + C * k_s
        local l = l_ * l_ * l_
        local m = m_ * m_ * m_
        local s = s_ * s_ * s_
        local ldt = 3 * l_dt * l_ * l_
        local mdt = 3 * m_dt * m_ * m_
        local sdt = 3 * s_dt * s_ * s_
        local ldt2 = 6 * l_dt * l_dt * l_
        local mdt2 = 6 * m_dt * m_dt * m_
        local sdt2 = 6 * s_dt * s_dt * s_
        local r = 4.0767416621 * l - 3.3077115913 * m + 0.2309699292 * s - 1
        local r1 = 4.0767416621 * ldt - 3.3077115913 * mdt + 0.2309699292 * sdt
        local r2 = 4.0767416621 * ldt2 - 3.3077115913 * mdt2 + 0.2309699292 * sdt2
        local u_r = r1 / (r1 * r1 - 0.5 * r * r2)
        local t_r = -r * u_r
        local g = -1.2684380046 * l + 2.6097574011 * m - 0.3413193965 * s - 1
        local g1 = -1.2684380046 * ldt + 2.6097574011 * mdt - 0.3413193965 * sdt
        local g2 = -1.2684380046 * ldt2 + 2.6097574011 * mdt2 - 0.3413193965 * sdt2
        local u_g = g1 / (g1 * g1 - 0.5 * g * g2)
        local t_g = -g * u_g
        local b = -0.0041960863 * l - 0.7034186147 * m + 1.7076147010 * s - 1
        local b1 = -0.0041960863 * ldt - 0.7034186147 * mdt + 1.7076147010 * sdt
        local b2 = -0.0041960863 * ldt2 - 0.7034186147 * mdt2 + 1.7076147010 * sdt2
        local u_b = b1 / (b1 * b1 - 0.5 * b * b2)
        local t_b = -b * u_b
        t_r = u_r >= 0 and t_r or math.huge
        t_g = u_g >= 0 and t_g or math.huge
        t_b = u_b >= 0 and t_b or math.huge
        t = t + math.min(t_r, math.min(t_g, t_b))
    end
    return t
end
function ok_color.find_gamut_intersection(a, b, L1, C1, L0)
    local cusp = ok_color.find_cusp(a, b)
    return ok_color.find_gamut_intersection(a, b, L1, C1, L0, cusp)
end
function ok_color.gamut_clip_preserve_chroma(rgb)
    if rgb.r < 1 and rgb.g < 1 and rgb.b < 1 and rgb.r > 0 and rgb.g > 0 and rgb.b > 0 then
        return rgb
    end
    local lab = ok_color.linear_srgb_to_oklab(rgb)
    local L = lab.L
    local eps = 0.00001
    local C = math.max(eps, math.sqrt(lab.a * lab.a + lab.b * lab.b))
    local a_ = lab.a / C
    local b_ = lab.b / C
    local L0 = ok_color.clamp(L, 0, 1)
    local t = ok_color.find_gamut_intersection(a_, b_, L, C, L0)
    local L_clipped = L0 * (1 - t) + t * L
    local C_clipped = t * C
    return ok_color.oklab_to_linear_srgb({ L_clipped, C_clipped * a_, C_clipped * b_ })
end
function ok_color.gamut_clip_project_to_0_5(rgb)
    if rgb.r < 1 and rgb.g < 1 and rgb.b < 1 and rgb.r > 0 and rgb.g > 0 and rgb.b > 0 then
        return rgb
    end
    local lab = ok_color.linear_srgb_to_oklab(rgb)
    local L = lab.L
    local eps = 0.00001
    local C = math.max(eps, math.sqrt(lab.a * lab.a + lab.b * lab.b))
    local a_ = lab.a / C
    local b_ = lab.b / C
    local L0 = 0.5
    local t = ok_color.find_gamut_intersection(a_, b_, L, C, L0)
    local L_clipped = L0 * (1 - t) + t * L
    local C_clipped = t * C
    return ok_color.oklab_to_linear_srgb({ L_clipped, C_clipped * a_, C_clipped * b_ })
end
function ok_color.gamut_clip_project_to_L_cusp(rgb)
    if rgb.r < 1 and rgb.g < 1 and rgb.b < 1 and rgb.r > 0 and rgb.g > 0 and rgb.b > 0 then
        return rgb
    end
    local lab = ok_color.linear_srgb_to_oklab(rgb)
    local L = lab.L
    local eps = 0.00001
    local C = math.max(eps, math.sqrt(lab.a * lab.a + lab.b * lab.b))
    local a_ = lab.a / C
    local b_ = lab.b / C
    local cusp = ok_color.find_cusp(a_, b_)
    local L0 = cusp.L
    local t = ok_color.find_gamut_intersection(a_, b_, L, C, L0)
    local L_clipped = L0 * (1 - t) + t * L
    local C_clipped = t * C
    return ok_color.oklab_to_linear_srgb({ L_clipped, C_clipped * a_, C_clipped * b_ })
end
function ok_color.gamut_clip_adaptive_L0_0_5(rgb, alpha)
    alpha = alpha or 0.05
    if rgb.r < 1 and rgb.g < 1 and rgb.b < 1 and rgb.r > 0 and rgb.g > 0 and rgb.b > 0 then
        return rgb
    end
    local lab = ok_color.linear_srgb_to_oklab(rgb)
    local L = lab.L
    local eps = 0.00001
    local C = math.max(eps, math.sqrt(lab.a * lab.a + lab.b * lab.b))
    local a_ = lab.a / C
    local b_ = lab.b / C
    local Ld = L - 0.5
    local e1 = 0.5 + math.abs(Ld) + alpha * C
    local L0 = 0.5 * (1 + ok_color.sgn(Ld) * (e1 - math.sqrt(e1 * e1 - 2 * math.abs(Ld))))
    local t = ok_color.find_gamut_intersection(a_, b_, L, C, L0)
    local L_clipped = L0 * (1 - t) + t * L
    local C_clipped = t * C
    return ok_color.oklab_to_linear_srgb({ L_clipped, C_clipped * a_, C_clipped * b_ })
end
function ok_color.gamut_clip_adaptive_L0_L_cusp(rgb, alpha)
    alpha = alpha or 0.05
    if rgb.r < 1 and rgb.g < 1 and rgb.b < 1 and rgb.r > 0 and rgb.g > 0 and rgb.b > 0 then
        return rgb
    end
    local lab = ok_color.linear_srgb_to_oklab(rgb)
    local L = lab.L
    local eps = 0.00001
    local C = math.max(eps, math.sqrt(lab.a * lab.a + lab.b * lab.b))
    local a_ = lab.a / C
    local b_ = lab.b / C
    local cusp = ok_color.find_cusp(a_, b_)
    local Ld = L - cusp.L
    local k = 2 * (Ld > 0 and 1 - cusp.L or cusp.L)
    local e1 = 0.5 * k + math.abs(Ld) + alpha * C / k
    local L0 = cusp.L + 0.5 * ok_color.sgn(Ld) * (e1 - math.sqrt(e1 * e1 - 2 * k * math.abs(Ld)))
    local t = ok_color.find_gamut_intersection(a_, b_, L, C, L0)
    local L_clipped = L0 * (1 - t) + t * L
    local C_clipped = t * C
    return ok_color.oklab_to_linear_srgb({ L_clipped, C_clipped * a_, C_clipped * b_ })
end
function ok_color.toe(x)
    local k_1 = 0.206
    local k_2 = 0.03
    local k_3 = (1 + k_1) / (1 + k_2)
    return 0.5 * (k_3 * x - k_1 + math.sqrt((k_3 * x - k_1) * (k_3 * x - k_1) + 4 * k_2 * k_3 * x))
end
function ok_color.toe_inv(x)
    local k_1 = 0.206
    local k_2 = 0.03
    local k_3 = (1 + k_1) / (1 + k_2)
    return (x * x + k_1 * x) / (k_3 * (x + k_2))
end
function ok_color.to_ST(cusp)
    local L = cusp.L
    local C = cusp.C
    return { C / L, C / (1 - L) }
end
function ok_color.get_ST_mid(a_, b_)
    local S = 0.11516993 + 1 / (
        7.44778970 + 4.15901240 * b_
        + a_ * (-2.19557347 + 1.75198401 * b_
            + a_ * (-2.13704948 - 10.02301043 * b_
                + a_ * (-4.24894561 + 5.38770819 * b_ + 4.69891013 * a_
                    )))
        )
    local T = 0.11239642 + 1 / (
        1.61320320 - 0.68124379 * b_
        + a_ * (0.40370612 + 0.90148123 * b_
            + a_ * (-0.27087943 + 0.61223990 * b_
                + a_ * (0.00299215 - 0.45399568 * b_ - 0.14661872 * a_
                    )))
        )
    return { S, T }
end
function ok_color.get_Cs(L, a_, b_)
    local cusp = ok_color.find_cusp(a_, b_)
    local C_max = ok_color.find_gamut_intersection(a_, b_, L, 1, L, cusp)
    local ST_max = ok_color.to_ST(cusp)
    local k = C_max / math.min((L * ST_max.S), (1 - L) * ST_max.T)
    local C_mid
    do
        local ST_mid = ok_color.get_ST_mid(a_, b_)
        local C_a = L * ST_mid.S
        local C_b = (1 - L) * ST_mid.T
        C_mid = 0.9 * k * math.sqrt(math.sqrt(1 / (1 / (C_a * C_a * C_a * C_a) + 1 / (C_b * C_b * C_b * C_b))))
    end
    local C_0
    do
        local C_a = L * 0.4
        local C_b = (1 - L) * 0.8
        C_0 = math.sqrt(1 / (1 / (C_a * C_a) + 1 / (C_b * C_b)))
    end
    return { C_0, C_mid, C_max }
end
function ok_color.okhsl_to_srgb(hsl)
    local h = hsl.h
    local s = hsl.s
    local l = hsl.l
    if l == 1.0 then
        return { 1.0, 1.0, 1.0 }
    elseif l == 0.0 then
        return { 0.0, 0.0, 0.0 }
    end
    local a_ = math.cos(2.0 * ok_color.pi * h)
    local b_ = math.sin(2.0 * ok_color.pi * h)
    local L = ok_color.toe_inv(l)
    local cs = ok_color.get_Cs(L, a_, b_)
    local C_0 = cs.C_0
    local C_mid = cs.C_mid
    local C_max = cs.C_max
    local mid = 0.8
    local mid_inv = 1.25
    local C, t, k_0, k_1, k_2
    if s < mid then
        t = mid_inv * s
        k_1 = mid * C_0
        k_2 = (1.0 - k_1 / C_mid)
        C = t * k_1 / (1.0 - k_2 * t)
    else
        t = (s - mid) / (1.0 - mid)
        k_0 = C_mid
        k_1 = (1.0 - mid) * C_mid * C_mid * mid_inv * mid_inv / C_0
        k_2 = (1.0 - (k_1) / (C_max - C_mid))
        C = k_0 + t * k_1 / (1.0 - k_2 * t)
    end
    local rgb = ok_color.oklab_to_linear_srgb({ L, C * a_, C * b_ })
    return {
        ok_color.srgb_transfer_function(rgb.r),
        ok_color.srgb_transfer_function(rgb.g),
        ok_color.srgb_transfer_function(rgb.b),
    }
end
function ok_color.srgb_to_okhsl(rgb)
    local lab = ok_color.linear_srgb_to_oklab({
        ok_color.srgb_transfer_function_inv(rgb.r),
        ok_color.srgb_transfer_function_inv(rgb.g),
        ok_color.srgb_transfer_function_inv(rgb.b)
    })
    local C = math.sqrt(lab.a * lab.a + lab.b * lab.b)
    local a_ = lab.a / C
    local b_ = lab.b / C
    local L = lab.L
    local h = 0.5 + 0.5 * math.atan2(-lab.b, -lab.a) / ok_color.pi
    local cs = ok_color.get_Cs(L, a_, b_)
    local C_0 = cs.C_0
    local C_mid = cs.C_mid
    local C_max = cs.C_max
    local mid = 0.8
    local mid_inv = 1.25
    local s
    if C < C_mid then
        local k_1 = mid * C_0
        local k_2 = (1.0 - k_1 / C_mid)
        local t = C / (k_1 + k_2 * C)
        s = t * mid
    else
        local k_0 = C_mid
        local k_1 = (1.0 - mid) * C_mid * C_mid * mid_inv * mid_inv / C_0
        local k_2 = (1.0 - (k_1) / (C_max - C_mid))
        local t = (C - k_0) / (k_1 + k_2 * (C - k_0))
        s = mid + (1.0 - mid) * t
    end
    local l = ok_color.toe(L)
    return { h, s, l }
end
function ok_color.okhsv_to_srgb(hsv)
    local h = hsv.h
    local s = hsv.s
    local v = hsv.v
    local a_ = math.cos(2.0 * ok_color.pi * h)
    local b_ = math.sin(2.0 * ok_color.pi * h)
    local cusp = ok_color.find_cusp(a_, b_)
    local ST_max = ok_color.to_ST(cusp)
    local S_max = ST_max.S
    local T_max = ST_max.T
    local S_0 = 0.5
    local k = 1.0 - S_0 / S_max
    local L_v = 1.0 - s * S_0 / (S_0 + T_max - T_max * k * s)
    local C_v = s * T_max * S_0 / (S_0 + T_max - T_max * k * s)
    local L = v * L_v
    local C = v * C_v
    local L_vt = ok_color.toe_inv(L_v)
    local C_vt = C_v * L_vt / L_v
    local L_new = ok_color.toe_inv(L)
    C = C * L_new / L
    L = L_new
    local rgb_scale = ok_color.oklab_to_linear_srgb({ L_vt, a_ * C_vt, b_ * C_vt })
    local scale_L = cbrtf(1.0 / math.max(math.max(rgb_scale.r, rgb_scale.g), math.max(rgb_scale.b, 0.0)))
    L = L * scale_L
    C = C * scale_L
    local rgb = ok_color.oklab_to_linear_srgb({ L, C * a_, C * b_ })
    return {
        ok_color.srgb_transfer_function(rgb.r),
        ok_color.srgb_transfer_function(rgb.g),
        ok_color.srgb_transfer_function(rgb.b),
    }
end
function ok_color.srgb_to_okhsv(rgb)
    local lab = ok_color.linear_srgb_to_oklab({
        ok_color.srgb_transfer_function_inv(rgb.r),
        ok_color.srgb_transfer_function_inv(rgb.g),
        ok_color.srgb_transfer_function_inv(rgb.b)
    })
    local C = math.sqrt(lab.a * lab.a + lab.b * lab.b)
    local a_ = lab.a / C
    local b_ = lab.b / C
    local L = lab.L
    local h = 0.5 + 0.5 * math.atan2(-lab.b, -lab.a) / ok_color.pi
    local cusp = ok_color.find_cusp(a_, b_)
    local ST_max = ok_color.to_ST(cusp)
    local S_max = ST_max.S
    local T_max = ST_max.T
    local S_0 = 0.5
    local k = 1.0 - S_0 / S_max
    local t = T_max / (C + L * T_max)
    local L_v = t * L
    local C_v = t * C
    local L_vt = ok_color.toe_inv(L_v)
    local C_vt = C_v * L_vt / L_v
    local rgb_scale = ok_color.oklab_to_linear_srgb({ L_vt, a_ * C_vt, b_ * C_vt })
    local scale_L = cbrtf(1.0 / math.max(math.max(rgb_scale.r, rgb_scale.g), math.max(rgb_scale.b, 0.0)))
    L = L / scale_L
    C = C / scale_L
    C = C * ok_color.toe(L) / L
    L = ok_color.toe(L)
    local v = L / L_v
    local s = (S_0 + T_max) * C_v / ((T_max * S_0) + T_max * k * C_v)
    return { h, s, v }
end

--I'm not even going to pretend to understand what's going on there..

-- END OF OKHSL CONVERSIONS

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
			VS = 	valStrenght
			AS = 	alpaStrength
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
			VS = 	presetcustom1valStrenght
			AS = 	presetcustom1alpaStrength
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
			VS = 	presetcustom2valStrenght
			AS = 	presetcustom2alpaStrength
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
			VS = 	presetcustom3valStrenght
			AS = 	presetcustom3alpaStrength
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
			VS = 	presetcustom4valStrenght
			AS = 	presetcustom4alpaStrength
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
			VS = valStrenght
			AS = alpaStrength
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