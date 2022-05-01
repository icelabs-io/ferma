local Ferma = ADDON_GLOBAL_VARIABLE.Ferma; -- Replace this with the addon or gamemode global variable to have Ferma under
Ferma.Element.FModelPanel = {};
local FModelPanel = Ferma.Element.FModelPanel;

AccessorFunc(FModelPanel, "Entity", "Entity");

function FModelPanel:Style(style)
    /* Defaults */
    self.FT = Ferma.Core.Fermafy(style, self:GetParent());
    Ferma.Core.FermaDefaults(self);
    /* */

    /* Panel Specific Styling */
    self.FT.FModel = style["model"] or nil;
    self.FT.FFOV = style["fov"] or nil;
    self.FT.FCamPos = style["campos"] or nil;
    self.FT.FCamAngle = style["camangle"] or nil;
    self.FT.FPos = style["pos"] or nil;
    self.FT.FAngle = style["angle"] or nil;
    self.FT.FColor = style["color"] or nil;
    self.FT.FEyePos = style["eyepos"] or nil;
    self.FT.FSpin = style["spin"] or false;

    self:SetModel(self.FT.FModel);

    if (self.FT.FSpin ~= true) then
        self.LayoutEntity = function(Entity)
            return;
        end
    else
        self.LayoutEntity = function(Entity)
            if (self.bAnimated) then
                self:RunAnimation();
            end
            self.Entity:SetAngles(Angle(0, RealTime() * 40 % 360, 0));
        end
    end

    if (self.FT.FFOV ~= nil) then
        self:SetFOV(self.FT.FFOV);
    end

    if (self.FT.FPos ~= nil) then
        self:GetEntity():SetPos(self.FT.FPos);
    end

    if (self.FT.FAngle ~= nil) then
        self:GetEntity():SetAngles(self.FT.FAngle);
    end

    if (self.FT.FColor ~= nil) then
        self:GetEntity():SetColor(self.FT.FColor);
    end

    if (self.FT.FCamPos ~= nil) then
        self:SetCamPos(self.FT.FCamPos);
    end

    if (self.FT.FCamAngle ~= nil) then
        self:SetLookAng(self.FT.FCamAngle);
    end

    if (self.FT.FEyePos ~= nil) then
        self:GetEntity():SetEyeTarget(self.FT.FEyePos);
    end

    self:SetCursor("none");
    /* */

end

derma.DefineControl(Ferma.AddonNameSpace .. ".FModelPanel", "Better DModelPanel", FModelPanel, "DModelPanel");