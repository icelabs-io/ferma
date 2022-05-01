local Ferma = ADDON_GLOBAL_VARIABLE.Ferma; -- Replace this with the addon or gamemode global variable to have Ferma under
Ferma.Element.FButton = {};
local FButton = Ferma.Element.FButton;

function FButton:Style( style )    
    
    /* Defaults */
    self.FT = Ferma.Core.Fermafy(style, self:GetParent());
    Ferma.Core.FermaDefaults(self);
    /* */

    /* Panel Specific Styling */
    self.FT.FContent = style["content"] or "Button";
    self.FT.FFont = style["font-family"] or nil;
    self.FT.FHover = style["hover"] or Color(255, 255, 255);
    self.FT.FClick = style["click"] or Color(255, 255, 255, 150);
    self.FT.FColor = style["color"] or Color(255, 255, 255, 70);

    self:SetText(self.FT.FContent)

    if (self.FT.FFont ~= nil) then
        self:SetFont(self.FT.FFont);
    end

    /* */

end

function FButton:Paint(w, h)
    /* Defaults */
    Ferma.Core.PaintFermafy(w, h, self.FT);
    /* */
end

function FButton:UpdateColours(skin)
	if (!self:IsEnabled()) then 
        return self:SetTextStyleColor(skin.Colours.Button.Disabled);
    end
	
    if (self:IsDown() || self.m_bSelected) then
        return self:SetTextStyleColor( self.FT.FClick );
    end
	
    if (self.Hovered) then
        return self:SetTextStyleColor(self.FT.FHover);
    end

	return self:SetTextStyleColor(self.FT.FColor);
end

derma.DefineControl(Ferma.AddonNameSpace .. ".FButton", "Better DButton", FButton, "DButton");