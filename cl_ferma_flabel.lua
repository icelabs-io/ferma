local Ferma = ADDON_GLOBAL_VARIABLE.Ferma; -- Replace this with the addon or gamemode global variable to have Ferma under
Ferma.Element.FLabel = {};
local FLabel = Ferma.Element.FLabel;

function FLabel:Style(style)
    /* Defaults */
    self.FT = Ferma.Core.Fermafy(style, self:GetParent());
    Ferma.Core.FermaDefaults(self);
    /* */

    /* Panel Specific Styling */
    self.FT.FContent = style["content"] or "";
    self.FT.FFont = style["font-family"] or "Default";
    self.FT.FTextAlign = style["text-align"] or 5;
    self.FT.FColor = style["color"] or Color(255, 255, 255);

    self:SetText(self.FT.FContent);
    self:SetFont(self.FT.FFont);
    self:SetColor(self.FT.FColor);
    self:SetContentAlignment(self.FT.FTextAlign);
    /* */

end

function FLabel:Paint(w, h)
    /* Defaults */
    Ferma.Core.PaintFermafy(w, h, self.FT);
    /* */
end

derma.DefineControl(Ferma.AddonNameSpace .. ".FLabel", "Better DLabel", FLabel, "DLabel");