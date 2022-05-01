local Ferma = ADDON_GLOBAL_VARIABLE.Ferma; -- Replace this with the addon or gamemode global variable to have Ferma under
Ferma.Element.FEditablePanel = {};
local FEditablePanel = Ferma.Element.FEditablePanel;

function FEditablePanel:Style(style)
    /* Defaults */
    self.FT = Ferma.Core.Fermafy(style, self:GetParent());
    Ferma.Core.FermaDefaults(self);
    /* */
end

function FEditablePanel:Paint(w, h)
    /* Defaults */
    Ferma.Core.PaintFermafy(w, h, self.FT);
    /* */
end

derma.DefineControl(Ferma.AddonNameSpace .. ".FEditablePanel", "Better EditablePanel", FEditablePanel, "EditablePanel");