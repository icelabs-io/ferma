local Ferma = ADDON_GLOBAL_VARIABLE.Ferma; -- Replace this with the addon or gamemode global variable to have Ferma under
Ferma.Element.FAvatarImage = {};
local FAvatarImage = Ferma.Element.FAvatarImage;

function FAvatarImage:Style(style)
    /* Defaults */
    self.FT = Ferma.Core.Fermafy(style, self:GetParent());
    Ferma.Core.FermaDefaults(self);
    /* */

    /* Panel Specific Styling */
    self.FT.FAvatar = style["background-image"] or LocalPlayer();
    self.FT.FAvatarSize = style["background-size"] or 128;

    self:SetPlayer(self.FT.FAvatar, self.FT.FAvatarSize);
    /* */
end

derma.DefineControl(Ferma.AddonNameSpace .. ".FAvatarImage", "Better AvatarImage", FAvatarImage, "AvatarImage");