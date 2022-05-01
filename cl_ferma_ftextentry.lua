local Ferma = ADDON_GLOBAL_VARIABLE.Ferma; -- Replace this with the addon or gamemode global variable to have Ferma under
Ferma.Element.FTextEntry = {};
local FTextEntry = Ferma.Element.FTextEntry;

function FTextEntry:Style(style)
    /* Defaults */
    self.FT = Ferma.Core.Fermafy(style, self:GetParent());
    Ferma.Core.FermaDefaults(self);
    /* */

    /* Panel Specific Styling */
    self.FT.FPlaceHolder = style["placeholder"] or "";
    self.FT.FFontFamily = style["font-family"] or "Default";
    self.FT.FContent = style["content"] or "";
    self.FT.FColor = style["color"] or {Color(255, 255, 255), Color(255, 255, 255, 70)};
    self.FT.FTextWrap = style["white-space"] or nil;
    self.FT.FIndent = style["padding"] or 20;

    self:SetFont( self.FT.FFontFamily )

    if (self.FT.FContent == "" && self.FT.FPlaceHolder ~= "") then
        self:SetText(self.FT.FPlaceHolder);
    else
        self:SetText(self.FT.FContent);
    end

    if (self.FT.FTextWrap == "nowrap") then
        self:SetMultiline(true);
    end
    /* */

end

function FTextEntry:Paint(w, h)
    /* Defaults */
    Ferma.Core.PaintFermafy(w, h, self.FT);
    /* */

    /* Panel Specific Painting */
    if (self:GetValue() == self.FT.FPlaceHolder) then
        self:DrawTextEntryText(self.FT.FColor[2],  Color(30, 130, 255), self.FT.FColor[1]);
    else
        self:DrawTextEntryText(self.FT.FColor[1], Color(30, 130, 255), self.FT.FColor[1]);
    end
    /* */

end

function FTextEntry:OnGetFocus()
    if (self:GetValue() == self.FT.FPlaceHolder) then
        self:SetValue("");
    end
end

function FTextEntry:OnLoseFocus()
    if (self:GetValue() == "") then
        self:SetText(self.FT.FPlaceHolder);
    end
end

derma.DefineControl(Ferma.AddonNameSpace .. ".FTextEntry", "Better DTextEntry", FTextEntry, "DTextEntry");
