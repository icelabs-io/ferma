local Ferma = ADDON_GLOBAL_VARIABLE.Ferma; -- Replace this with the addon or gamemode global variable to have Ferma under
Ferma.Element.FHTML = {};
local FHTML = Ferma.Element.FHTML;

function FHTML:Style(style)
    /* Defaults */
    self.FT = Ferma.Core.Fermafy(style, self:GetParent());
    Ferma.Core.FermaDefaults(self);
    /* */
    
    /* Panel Specific Styling */
    self.FT.FURL = style["url"];

    self:OpenURL(self.FT.FURL);
    /* */
end

derma.DefineControl(Ferma.AddonNameSpace .. ".FHTML", "Better DHTML", FHTML, "DHTML");