local Ferma = ADDON_GLOBAL_VARIABLE.Ferma; -- Replace this with the addon or gamemode global variable to have Ferma under
Ferma.Element.FScrollPanel = {};
local FScrollPanel = Ferma.Element.FScrollPanel;

AccessorFunc(FScrollPanel, "pnlCanvas", "Canvas");

function FScrollPanel:Style(style)
    
    /* Defaults */
    self.FT = Ferma.Core.Fermafy(style, self:GetParent());
    Ferma.Core.FermaDefaults(self);
    /* */

    /* Panel Specific Styling */
    self.FT.FOverflowYBackground = style["scroll-background-color"] or Color(0, 0, 0, 25);
    self.FT.FOverflowYGripColor = style["scroll-grip-color"] or Color(255, 255, 255, 3);

    if (self.VBar.Enabled) then
        self.pnlCanvas:SetWide(self.FT.FWidth);
    else
        self.pnlCanvas:SetWide(self.FT.FWidth - 15);
    end
end

function FScrollPanel:Paint(w, h)
    /* Defaults */
    Ferma.Core.PaintFermafy( w, h, self.FT )
    /* */

    /* Panel Specific Painting */
    if (self.VBar.Enabled) then
        Ferma.Core.DrawVerticalLine 
        {
            ["x"] = w - self.FT.FBorder[3] - 15,
            ["y"] = 0,
            ["length"]  = h,
            ["thickness"] = self.FT.FBorder[3],
            ["color"] = self.FT.FBorderColor
        };
    end
    
    local VT = self.FT;

    function self.VBar:Paint(w, h)
        Ferma.Core.DrawBox 
        {
            ["x"] = 0,
            ["y"] = 0,
            ["width"] = w,
            ["height"] = h,
            ["color"] = VT.FOverflowYBackground
        };
    end

    function self.VBar.btnUp:Paint(w, h)
        Ferma.Core.DrawBox 
        {
            ["x"] = 0,
            ["y"] = VT.FBorder[2],
            ["width"] = w - VT.FBorder[3],
            ["height"] = h,
            ["color"] = VT.FBorderColor
        };
    end

    function self.VBar.btnDown:Paint(w, h)
        Ferma.Core.DrawBox 
        {
            ["x"] = 0,
            ["y"] = 0,
            ["width"] = w - VT.FBorder[3],
            ["height"] = h - VT.FBorder[4],
            ["color"] = VT.FBorderColor
        };
    end

    function self.VBar.btnGrip:Paint(w, h)
        Ferma.Core.DrawBox 
        {
            ["x"] = 0,
            ["y"] = 0,
            ["width"] = w - VT.FBorder[3],
            ["height"] = h,
            ["color"] = VT.FOverflowYGripColor
        };
    end
    /* */

end

derma.DefineControl(Ferma.AddonNameSpace .. ".FScrollPanel", "Better DScrollPanel", FScrollPanel, "DScrollPanel");
