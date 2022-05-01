local Ferma = ADDON_GLOBAL_VARIABLE.Ferma; -- Replace this with the addon or gamemode global variable to have Ferma under
Ferma.Element.FCheckBox = {};
local FCheckBox = Ferma.Element.FCheckBox;

function FCheckBox:Style(style)
    /* Defaults */
    self.FT = Ferma.Core.Fermafy(style, self:GetParent());
    Ferma.Core.FermaDefaults(self);
    /* */

    /* Panel Specific Styling */
    self.FT.FCVar = style["cvar"] or nil;

    if (self.FT.FCVar ~= nil) then
        self:SetValue(cvars.Bool(self.FT.FCVar ));
        self:SetConVar(self.FT.FCVar);
    end
    /* */
end

derma.DefineControl(Ferma.AddonNameSpace .. ".FCheckBox", "Better DCheckBox", FCheckBox, "DCheckBox");