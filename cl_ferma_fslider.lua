local Ferma = ADDON_GLOBAL_VARIABLE.Ferma; -- Replace this with the addon or gamemode global variable to have Ferma under
Ferma.Element.FSlider = {};
local FSlider = Ferma.Element.FSlider;

function FSlider:Style(style)
    /* Defaults */
    self.FT = Ferma.Core.Fermafy(style, self:GetParent());
    Ferma.Core.FermaDefaults(self);
    /* */

    /* Panel Specific Styling */
    self.FT.FXAxis = style["x-axis"] or nil;
    self.FT.FYAxis = style["y-axis"] or nil;
    self.FT.FVBar = style["vbar"] or false;
    self.FT.FHBar = style["hbar"] or false;
    self.FT.FNoClip = style["noclip"] or false;
    self.FT.FKnob = style["knob"];

    self.m_fSlideX = self.FT.FKnob[1];
    self.m_fSlideY = self.FT.FKnob[2];

    self:SetLockX(self.FT.FXAxis);
    self:SetLockY(self.FT.FYAxis);
    self.Knob:NoClipping(self.FT.FNoClip );
    /* */

end

function FSlider:Paint(w, h)
    
    /* Defaults */
    Ferma.Core.PaintFermafy(w, h, self.FT)
    /* */

    /* Panel Specific Painting */
    if (self.FT.FVBar ~= false) then
        Ferma.Core.DrawVerticalLine
        {
            ["x"] = (self:GetWide() / 2) - 2,
            ["y"] = 0,
            ["length"] = h,
            ["thickness"] = 3,
            ["color"] = self.FT.FBorderColor
        };
    end

    if (self.FT.FHBar ~= false) then
        Ferma.Core.DrawVerticalLine
        {
            ["x"] = 0,
            ["y"] = (self:GetTall() / 2) - 2,
            ["length"] = w,
            ["thickness"] = 3,
            ["color"] = self.FT.FBorderColor
        };
    end
    /* */
    
end

function FSlider:ConvertX(ValPosX, NewMinX, NewMaxX, OldMinX, OldMaxX)
    if (ValPosX == "knob") then
        local KnobX, KnobY = self.Knob:GetPos();
        X = (KnobX + (self.Knob:GetWide()/ 2)) * (NewMaxX - NewMinX) / (OldMaxX - OldMinX) + NewMinX;
    else
        X = (ValPosX - OldMinX) * (NewMaxX - NewMinX) / (OldMaxX - OldMinX) + NewMinX;
    end

    return X;
end

function FSlider:ConvertY(ValPosY, NewMinY, NewMaxY, OldMinY, OldMaxY)
    if (ValPosY == "knob") then
        local KnobX, KnobY = self.Knob:GetPos();
        Y = (KnobY + (self.Knob:GetTall() / 2)) * (NewMaxY - NewMinY) / (OldMaxY - OldMinY) + NewMinY;
    else
        Y = (ValPosY - OldMinY) * (NewMaxY - NewMinY) / (OldMaxY - OldMinY) + NewMinY;
    end

    return Y;
end

derma.DefineControl(Ferma.AddonNameSpace .. ".FSlider", "Better DSlider", FSlider, "DSlider");