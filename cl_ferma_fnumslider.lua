local Ferma = ADDON_GLOBAL_VARIABLE.Ferma; -- Replace this with the addon or gamemode global variable to have Ferma under
Ferma.Element.FNumSlider = {};
local FNumSlider = Ferma.Element.FNumSlider;

function FNumSlider:Style( style )
    /* Defaults */
    self.FT = Ferma.Core.Fermafy(style, self:GetParent());
    Ferma.Core.FermaDefaults(self);
    /* */

    /* Panel Specific Styling */
    self.FT.FMax = style["max"] or 1;
    self.FT.FMin = style["min"] or 0;
    self.FT.FDecimals = style["decimal"] or 0;
    self.FT.FColor = style["color"] or Color(255, 255, 255, 100);
    
    self:SetMin(self.FT.FMin);
    self:SetMax(self.FT.FMax);
    self:SetDecimals(self.FT.FDecimals);
    self:SetValue(self.FT.FMin);
    
    self.Label:Dock(NODOCK);
    self.Scratch:Dock(NODOCK);
    self.Label:SetWide(0);
    self.Scratch:SetWide(0);

    self.TextArea:SetTextColor(self.FT.FColor);
    self.TextArea:SetPos(self:GetWide() / 2 - 5, 0);
    self.TextArea:Dock(NODOCK);
    self.TextArea:OnValueChange(self:SetValue(self.TextArea:GetValue()));
    /* */
end

function FNumSlider:Paint( w, h )
    Ferma.Core.DrawHorizontalLine
    {
        ["x"] = 7,
        ["y"] = h / 2,
        ["length"] = w - 14,
        ["thickness"] = 2,
        ["color"] = self.FT.FColor
    };

    for i = 0, self.FT.FMax do
        local Increment = ((w - 15) / (self.FT.FMax)) * i;
        
        Ferma.Core.DrawVerticalLine
        {
            ["x"] = 7 + Increment,
            ["y"] = h / 2 - 4,
            ["length"] = 11,
            ["thickness"] = 1,
            ["color"] = self.FT.FColor
        };
    end
end

derma.DefineControl(Ferma.AddonNameSpace .. ".FNumSlider", "Better DNumSlider", FNumSlider, "DNumSlider");