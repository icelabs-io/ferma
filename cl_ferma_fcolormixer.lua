local Ferma = ADDON_GLOBAL_VARIABLE.Ferma; -- Replace this with the addon or gamemode global variable to have Ferma under
Ferma.Element.FColorMixer = {};
local FColorMixer = Ferma.Element.FColorMixer;

function FColorMixer:Style(style)
    /* Defaults */
    self.FT = Ferma.Core.Fermafy( style, self:GetParent());
    Ferma.Core.FermaDefaults(self);
    /* */

    /* Panel Specific Styling */
    self.FT.FAlphaBar = style["alphabar"] or false;
    self.FT.FPalette = style["palette"] or false;
    self.FT.FWangs = style["wangs"] or false;
    self.FT.FColor = style["color"] or Color(0, 0, 255);

    if (self.FT.FAlphaBar ~= nil) then
        self:SetAlphaBar(self.FT.FAlphaBar);
    end

    if (self.FT.FPalette ~= nil) then
        self:SetPalette(self.FT.FPalette)
    end

    if (self.FT.FWangs ~= nil) then
        self:SetWangs( self.FT.FWangs)
    end

    self:SetColor(self.FT.FColor);
    /* */
    
end

derma.DefineControl(Ferma.AddonNameSpace .. ".FColorMixer", "Better DColorMixer", FColorMixer, "DColorMixer");