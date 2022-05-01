local Ferma = ADDON_GLOBAL_VARIABLE.Ferma; -- Replace this with the addon or gamemode global variable to have Ferma under
Ferma.Element.FSpawnIcon = {};
local FSpawnIcon = Ferma.Element.FSpawnIcon;

function FSpawnIcon:Style(style)
    /* Defaults */
    self.FT = Ferma.Core.Fermafy(style, self:GetParent());
    Ferma.Core.FermaDefaults(self);
    /* */

    /* Panel Specific Styling */
    self.FT.FModel = style["model"];

    self:SetModel(self.FT.FModel);
    /* */
end

function FSpawnIcon:Paint(w, h)
    /* Defaults */
    Ferma.Core.PaintFermafy(w, h, self.FT);
    /* */

    /* Panel Specific Painting */
    self.OverlayFade = math.Clamp((self.OverlayFade or 0) - RealFrameTime() * 640 * 2, 0, 255);

	if (dragndrop.IsDragging() || !self:IsHovered()) then 
        return;
    end

	self.OverlayFade = math.Clamp(self.OverlayFade + RealFrameTime() * 640 * 8, 0, 255);
    /* */
end

function FSpawnIcon:PerformLayout()
    self.Icon:StretchToParent(self.FT.FBorder[1], self.FT.FBorder[2], self.FT.FBorder[3], self.FT.FBorder[4]);
end

function FSpawnIcon:PaintOver(w, h)
end

derma.DefineControl(Ferma.AddonNameSpace .. ".FSpawnIcon", "Better SpawnIcon", FSpawnIcon, "SpawnIcon");