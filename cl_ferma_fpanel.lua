local Ferma = ADDON_GLOBAL_VARIABLE.Ferma; -- Replace this with the addon or gamemode global variable to have Ferma under
Ferma.Element.FPanel = {};
local FPanel = Ferma.Element.FPanel;

function FPanel:Style(style)
    /* Defaults */
    self.FT = Ferma.Core.Fermafy(style, self:GetParent());
    Ferma.Core.FermaDefaults(self);
    /* */
end

function FPanel:Paint(w, h)
    /* Defaults */
    Ferma.Core.PaintFermafy(w, h, self.FT);
    /* */
end

derma.DefineControl(Ferma.AddonNameSpace .. ".FPanel", "Better DPanel", FPanel, "DPanel");