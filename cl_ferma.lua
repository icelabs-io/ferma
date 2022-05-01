--[[
Ferma - Ferma is an overhaul of Garry's Mod's integrated Derma system, designed to work as close as possible to CSS3.

COPYRIGHT (C) 2019 - Ferma is proprietary and may only be used for this addon. Usage of this library or
redistribution of this library is illegal under digital copyright laws. Your license does not permit
you to use this library outside of this addon.
]]--

ADDON_GLOBAL_VARIABLE = ADDON_GLOBAL_VARIABLE or {};

local Ferma            = ADDON_GLOBAL_VARIABLE.Ferma; -- Replace this with the addon or gamemode global variable to have Ferma under
Ferma.AddonNameSpace   = ""; -- Replace this with the name of the addon that will prefix all Ferma elements (Name.ElementName)
Ferma.Core             = Ferma.Core or {};
Ferma.Element          = Ferma.Element or {};

local blur = Material("pp/blurscreen");

function Ferma.Core.Fermafy(style, parent)
    local FT = {};
    
    FT.FWidth = style["width"] or 100;
    FT.FHeight = style["height"] or 100;

    FT.FPosX = style["x"] or 0;
    FT.FPosY = style["y"] or 0;

    FT.FLeft = style["left"] or 0;
    FT.FRight = style["right"] or 0;
    FT.FTop = style["top"] or 0;
    FT.FBottom = style["bottom"] or 0;

    FT.FMargin = style["margin"] or {0};
    FT.FMarginLeft = style["margin-left"] or nil;
    FT.FMarginTop = style["margin-top"] or nil;
    FT.FMarginRight = style["margin-right"] or nil;
    FT.FMarginBottom = style["margin-bottom"] or nil;

    FT.FBefore = style["before"] or nil;
    FT.FBeforeX = 0;
    FT.FBeforeWidth = 0;
    FT.FBeforeMarginLeft = 0;

    FT.FAfter = style["after"] or nil;
    FT.FAfterX = 0;
    FT.FAfterWidth = 0;
    FT.FAfterMarginRight = 0;

    FT.FAbove = style["above"] or nil;
    FT.FAboveY = 0;
    FT.FAboveHeight = 0;
    FT.FAboveMarginTop = 0;

    FT.FBelow = style["below"] or nil;
    FT.FBelowY = 0;
    FT.FBelowHeight = 0;
    FT.FBelowMarginBottom = 0;

    FT.FZIndex = style["z-index"] or nil;
    FT.FAlpha = style["opacity"] or nil;
    FT.FFloat = style["float"] or nil;

    FT.FPopup = style["popup"] or false;
    FT.FCenter = style["center"] or false;
    FT.FParent = parent or nil;

    function FT.CalculateSizeValue(value, percentVal, vwVal, vhVal)
        if (type(value) == "string") then
            if (string.match(value, "%%") == "%") then
                return percentVal / 100 * tonumber(string.Replace(value, "%", ""));
            elseif (string.match(value, "vw") == "vw") then
                return vwVal / 100 * tonumber(string.Replace(value, "vw", ""));
            elseif (string.match(value, "vh") == "vh") then
                return vhVal / 100 * tonumber(string.Replace(value, "vh", ""));
            end
        end

        return value;
    end

    local FGetWide = FT.FParent:GetWide();
    local FGetTall = FT.FParent:GetTall();

    FT.FWidth           = FT.CalculateSizeValue(FT.FWidth,          FGetWide, FGetWide, FGetTall);
    FT.FHeight          = FT.CalculateSizeValue(FT.FHeight,         FGetTall, FGetWide, FGetTall);
    FT.FMarginLeft      = FT.CalculateSizeValue(FT.FMarginLeft,     FGetWide, FGetWide, FGetTall);
    FT.FMarginTop       = FT.CalculateSizeValue(FT.FMarginTop,      FGetTall, FGetWide, FGetTall);
    FT.FMarginRight     = FT.CalculateSizeValue(FT.FMarginRight,    FGetWide, FGetWide, FGetTall);
    FT.FMarginBottom    = FT.CalculateSizeValue(FT.FMarginBottom,   FGetTall, FGetWide, FGetTall);
    FT.FMargin[1]       = FT.CalculateSizeValue(FT.FMargin[1],      FGetWide, FGetWide, FGetTall);
    FT.FMargin[2]       = FT.CalculateSizeValue(FT.FMargin[2],      FGetTall, FGetWide, FGetTall);
    FT.FMargin[3]       = FT.CalculateSizeValue(FT.FMargin[3],      FGetWide, FGetWide, FGetTall);
    FT.FMargin[4]       = FT.CalculateSizeValue(FT.FMargin[4],      FGetTall, FGetWide, FGetTall);
    FT.FLeft            = FT.CalculateSizeValue(FT.FLeft,           FGetWide, FGetWide, FGetTall);
    FT.FTop             = FT.CalculateSizeValue(FT.FTop,            FGetTall, FGetWide, FGetTall);
    FT.FRight           = FT.CalculateSizeValue(FT.FRight,          FGetWide, FGetWide, FGetTall);
    FT.FBottom          = FT.CalculateSizeValue(FT.FBottom,         FGetTall, FGetWide, FGetTall);

    if( FT.FMarginLeft ~= nil ) then
        FT.FMargin[1] = FT.FMarginLeft
    end

    if( FT.FMarginTop ~= nil ) then
        FT.FMargin[2] = FT.FMarginTop
    end

    if( FT.FMarginRight ~= nil ) then
        FT.FMargin[3] = FT.FMarginRight
    end

    if( FT.FMarginBottom ~= nil ) then
        FT.FMargin[4] = FT.FMarginBottom
    end

    if (FT.FMargin ~= nil) then
        if (FT.FMargin[4] ~= nil) then
            FT.FMargin[1] = FT.FMargin[1];
            FT.FMargin[2] = FT.FMargin[2];
            FT.FMargin[3] = FT.FMargin[3];
            FT.FMargin[4] = FT.FMargin[4];
        elseif (FT.FMargin[3] ~= nil) then
            FT.FMargin[1] = FT.FMargin[1];
            FT.FMargin[2] = FT.FMargin[2];
            FT.FMargin[3] = FT.FMargin[3];
            FT.FMargin[4] = 0;
        elseif (FT.FMargin[2] ~= nil) then
            FT.FMargin[1] = FT.FMargin[1];
            FT.FMargin[2] = FT.FMargin[2];
            FT.FMargin[3] = FT.FMargin[1];
            FT.FMargin[4] = FT.FMargin[2];
        elseif (FT.FMargin[1] ~= nil) then
            FT.FMargin[1] = FT.FMargin[1];
            FT.FMargin[2] = FT.FMargin[1];
            FT.FMargin[3] = FT.FMargin[1];
            FT.FMargin[4] = FT.FMargin[1];
        else
            FT.FMargin = {0, 0, 0, 0};
        end
    end

    if (FT.FBefore ~= nil) then
        FT.FBeforeX, FT.FBeforeY = FT.FBefore:GetPos();
        FT.FBeforeMarginLeft = FT.FBefore.FT.FMargin[1];
    elseif (FT.FAfter ~= nil) then
        FT.FAfterX, FT.FAfterY = FT.FAfter:GetPos();
        FT.FAfterWidth = FT.FAfter:GetWide();
        FT.FAfterMarginRight = FT.FAfter.FT.FMargin[3];
    end

    if (FT.FAbove ~= nil ) then
        FT.FAboveX, FT.FAboveY = FT.FAbove:GetPos();
        FT.FAboveMarginTop = FT.FAbove.FT.FMargin[2];
    elseif (FT.FBelow ~= nil) then
        FT.FBelowX, FT.FBelowY = FT.FBelow:GetPos();
        FT.FBelowHeight = FT.FBelow:GetTall();
        FT.FBelowMarginBottom = FT.FBelow.FT.FMargin[4];
    end

    FT.FWidth = FT.FWidth - FT.FMargin[1] - FT.FMargin[3];
    FT.FHeight = FT.FHeight - FT.FMargin[2] - FT.FMargin[4];

    if (FT.FFloat == "right") then
        FT.FPosX = FT.FParent:GetWide() - FT.FPosX - FT.FMargin[3] - FT.FWidth + FT.FLeft - FT.FRight;
        FT.FPosY = FT.FPosY + FT.FMargin[2] + FT.FTop - FT.FBottom;
    else
        FT.FPosX = FT.FPosX + FT.FMargin[1] + FT.FLeft - FT.FRight;
        FT.FPosY = FT.FPosY + FT.FMargin[2] + FT.FTop - FT.FBottom;
    end

    if (FT.FBefore ~= nil) then
        FT.FPosX = FT.FBeforeX - FT.FWidth - FT.FMargin[3] - FT.FBeforeMarginLeft + FT.FLeft - FT.FRight;
    elseif (FT.FAfter ~= nil) then
        FT.FPosX = FT.FAfterX + FT.FAfterWidth + FT.FAfterMarginRight + FT.FMargin[1] + FT.FLeft - FT.FRight;
    end
    
    if (FT.FAbove ~= nil) then
        FT.FPosY = FT.FAboveY - FT.FHeight - FT.FMargin[4] - FT.FAboveMarginTop + FT.FTop - FT.FBottom;
    elseif (FT.FBelow ~= nil) then
        FT.FPosY = FT.FBelowY + FT.FBelowHeight + FT.FBelowMarginBottom + FT.FMargin[2] + FT.FTop - FT.FBottom;
    end

    if (FT.FCenter == true) then
        FT.FPosX = (ScrW() / 2) - (FT.FWidth / 2);
        FT.FPosY = (ScrH() / 2) - (FT.FHeight / 2);
    end

    /* */

    FT.FBorder = style["border"] or nil;
    FT.FBorderColor = style["border-color"] or Color(0, 0, 0);
    FT.FBackground = style["background-color"] or Color(0, 0, 0, 150);
    FT.FVisibility = style["visibility"] or nil;
    FT.FBlur = style["blur"] or nil;

    FT.FBorderLeft = style["border-left"] or nil;
    FT.FBorderTop = style["border-top"] or nil;
    FT.FBorderRight = style["border-right"] or nil;
    FT.FBorderBottom = style["border-bottom"] or nil;

    if (FT.FBorder ~= nil) then
        if (FT.FBorder[4] ~= nil) then
            FT.FBorder[1] = FT.FBorder[1];
            FT.FBorder[2] = FT.FBorder[2];
            FT.FBorder[3] = FT.FBorder[3];
            FT.FBorder[4] = FT.FBorder[4];
        elseif (FT.FBorder[3] ~= nil) then
            FT.FBorder[1] = FT.FBorder[1];
            FT.FBorder[2] = FT.FBorder[2];
            FT.FBorder[3] = FT.FBorder[3];
            FT.FBorder[4] = 0;
        elseif (FT.FBorder[2] ~= nil) then
            FT.FBorder[1] = FT.FBorder[1];
            FT.FBorder[2] = FT.FBorder[2];
            FT.FBorder[3] = FT.FBorder[1];
            FT.FBorder[4] = FT.FBorder[2];
        elseif (FT.FBorder[1] ~= nil) then
            FT.FBorder[1] = FT.FBorder[1];
            FT.FBorder[2] = FT.FBorder[1];
            FT.FBorder[3] = FT.FBorder[1];
            FT.FBorder[4] = FT.FBorder[1];
        else
            FT.FBorder = {0, 0, 0, 0};
        end
    else
        FT.FBorder = {0, 0, 0, 0};
    end

    if (FT.FBorderLeft ~= nil) then
        FT.FBorder[1] = FT.FBorderLeft;
    end

    if (FT.FBorderTop ~= nil) then
        FT.FBorder[2] = FT.FBorderTop;
    end

    if (FT.FBorderRight ~= nil) then
        FT.FBorder[3] = FT.FBorderRight;
    end

    if (FT.FBorderBottom ~= nil) then
        FT.FBorder[4] = FT.FBorderBottom;
    end

    return FT;
end

function Ferma.Core.PaintFermafy(w, h, panel)
    if (panel.FVisibility ~= "hidden") then
        Ferma.Core.DrawBox 
        {
            ["x"] = 0,
            ["y"] = 0,
            ["width"] = w,
            ["height"] = h,
            ["color"] = panel.FBackground
        };

        if (panel.FBlur ~= nil) then
            Ferma.Core.DrawBlurBox
            { 
                ["x"] = panel.FPosX,
                ["y"] = panel.FPosY,
                ["strength"] = panel.FBlur
            };
        end

        if (panel.FBorder[1] ~= nil && panel.FBorder[1] ~= 0) then
            Ferma.Core.DrawVerticalLine 
            {
                ["x"] = 0,
                ["y"] = 0,
                ["length"]  = h,
                ["thickness"] = panel.FBorder[1],
                ["color"] = panel.FBorderColor
            };
        end

        if (panel.FBorder[2] ~= nil && panel.FBorder[2] ~= 0) then
            Ferma.Core.DrawHorizontalLine 
            {
                ["x"] = 0,
                ["y"] = 0,
                ["length"] = w,
                ["thickness"] = panel.FBorder[2],
                ["color"] = panel.FBorderColor
            };
        end

        if (panel.FBorder[3] ~= nil && panel.FBorder[3] ~= 0) then
            Ferma.Core.DrawVerticalLine 
            {
                ["x"] = w - panel.FBorder[3],
                ["y"] = 0,
                ["length"]  = h,
                ["thickness"] = panel.FBorder[3],
                ["color"] = panel.FBorderColor
            };
        end

        if (panel.FBorder[4] ~= nil && panel.FBorder[4] ~= 0) then
            Ferma.Core.DrawHorizontalLine 
            {
                ["x"] = 0,
                ["y"] = h - panel.FBorder[4],
                ["length"] = w,
                ["thickness"] = panel.FBorder[4],
                ["color"] = panel.FBorderColor
            };
        end
    end
end

function Ferma.Core.FermaDefaults(panel)
    panel:SetSize(panel.FT.FWidth, panel.FT.FHeight);
    panel:SetPos(panel.FT.FPosX, panel.FT.FPosY);

    if (panel.FT.FZIndex ~= nil) then
        panel:SetZPos(panel.FT.FZIndex);
    end

    if (panel.FT.FAlpha ~= nil) then
        panel:SetAlpha(panel.FT.FAlpha);
    end
    
    if (panel.FT.FPopup == true) then
        panel:MakePopup();
    end
end

function Ferma.Core.DrawBlurBox(style)
	surface.SetDrawColor(255, 255, 255);
	surface.SetMaterial(blur);

	for i = 1, 3 do
		blur:SetFloat("$blur", (i / 3) * (style["strength"] or 6));
		blur:Recompute();
		render.UpdateScreenEffectTexture();
		surface.DrawTexturedRect(style["x"] * -1, style["y"] * -1, ScrW(), ScrH());
	end
end

function Ferma.Core.DrawVerticalLine(style)
	surface.SetDrawColor(style["color"]);
	surface.DrawRect(style["x"], style["y"], style["thickness"], style["length"]);
end

function Ferma.Core.DrawHorizontalLine(style)
	surface.SetDrawColor(style["color"])
	surface.DrawRect(style["x"], style["y"], style["length"], style["thickness"]);
end

function Ferma.Core.DrawLine(style)
	surface.SetDrawColor(style["color"]);
	surface.DrawLine(style["x"], style["y"], style["end-x"], style["end-y"]);
end

function Ferma.Core.DrawBox(style)
	surface.SetDrawColor(style["color"]);
	surface.DrawRect(style["x"], style["y"], style["width"], style["height"]);
end

function Ferma.Core.CreateFont(path, name, setfont, setweight, fonttable)
    local i = 1
    while i <= 40 do
        surface.CreateFont(name .. i, { 
            font = setfont,
            size = ScreenScale(i),
            weight = setweight,
            blursize = fonttable.blur or nil,
            scanlines = fonttable.scanlines or nil,
            antialias = fonttable.antialias or true,
            underline = fonttable.underline or nil,
            italic = fonttable.italic or nil,
            strikeout = fonttable.strikeout or nil,
            symbol = fonttable.symbol or nil,
            rotary = fonttable.rotary or nil,
            shadow = fonttable.shadow or nil,
            additive = fonttable.additive or nil,
            outline = fonttable.outline or nil,
            extended = fonttable.extended or nil
        });
        surface.CreateFont(name .. "Unscaled" .. i, { 
            font = setfont,
            size = i,
            weight = setweight,
            blursize = fonttable.blur or nil,
            scanlines = fonttable.scanlines or nil,
            antialias = fonttable.antialias or true,
            underline = fonttable.underline or nil,
            italic = fonttable.italic or nil,
            strikeout = fonttable.strikeout or nil,
            symbol = fonttable.symbol or nil,
            rotary = fonttable.rotary or nil,
            shadow = fonttable.shadow or nil,
            additive = fonttable.additive or nil,
            outline = fonttable.outline or nil,
            extended = fonttable.extended or nil
        });
        i = i + 1;
    end
end 