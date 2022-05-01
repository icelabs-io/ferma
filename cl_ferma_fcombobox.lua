local Ferma = ADDON_GLOBAL_VARIABLE.Ferma; -- Replace this with the addon or gamemode global variable to have Ferma under
Ferma.Element.FComboBox = {};
local FComboBox = Ferma.Element.FComboBox;

function FComboBox:Style(style)
    /* Defaults */
    self.FT = Ferma.Core.Fermafy(style, self:GetParent());
    Ferma.Core.FermaDefaults(self);
    /* */

    /* Panel Specific Styling */
    self.FT.FFont = style["font-family"] or nil;

    if (self.FT.FFont != nil) then
        self:SetFont(self.FT.FFont);
    end
    /* */
end

function FComboBox:Paint(w, h)
    /* Defaults */
    Ferma.Core.PaintFermafy(w, h, self.FT);
    /* */
end

derma.DefineControl(Ferma.AddonNameSpace .. ".FComboBox", "Better DComboBox", FComboBox, "DComboBox");