local Ferma = ADDON_GLOBAL_VARIABLE.Ferma; -- Replace this with the addon or gamemode global variable to have Ferma under
Ferma.Element.FTitlebar = {};
local FTitlebar = Ferma.Element.FTitlebar;

function FTitleBar:Style(style)
    /* Defaults */
    self.FT = Ferma.Core.Fermafy(style, self:GetParent());
    Ferma.Core.FermaDefaults(self);
    /* */

    /* Panel Specific Styling */
    self.FT.FTitle = style["content"] or "";
    self.FT.FColor = style["color"] or Color(255, 255, 255);
    self.FT.FFont = style["font-family"] or "Default";

    self.Label = vgui.Create("FLabel", self);
    self.Label:Style
    {
        ["width"] = "100%",
        ["height"] = "100%",
        ["content"] = "   " .. self.FT.FTitle,
        ["color"] = self.FT.FColor,
        ["font-family"] = self.FT.FFont,
        ["text-align"] = 4,
        ["visibility"] = "hidden"
    }

    self.Button = vgui.Create("FButton", self);
    self.Button:Style
    {
        ["float"] = "right",
        ["width"] = "90vh",
        ["height"] = "100%",
        ["font-family"] = "HudHintTextLarge",
        ["content"] = "X",
        ["visibility"] = "hidden"
    };

    function self.Button.DoClick()
        self:GetParent():Remove();
    end
    /* */

end

function FTitleBar:Paint(w, h)
    /* Defaults */
    Ferma.Core.PaintFermafy(w, h, self.FT);
    /* */
end

derma.DefineControl(Ferma.AddonNameSpace .. ".FTitleBar", "A title bar for closable windows.", FTitleBar, "DPanel");