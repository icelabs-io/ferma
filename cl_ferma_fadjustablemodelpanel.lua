local Ferma = ADDON_GLOBAL_VARIABLE.Ferma; -- Replace this with the addon or gamemode global variable to have Ferma under
Ferma.Element.FAdjustableModelPanel = {};
local FAdjustableModelPanel = Ferma.Element.FAdjustableModelPanel;

AccessorFunc(FAdjustableModelPanel, "Entity", "Entity");

function FAdjustableModelPanel:Style(style)
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
    self.FT.FLock = style["lock"] or nil;
    self.FT.FSpin = style["spin"] or false;

    if (self.FT.FSpin ~= true) then
        self.LayoutEntity = function(Entity)
            self.vCamPos = self.Entity:OBBCenter() - self.aLookAngle:Forward() * self.vCamPos:Length();
        end
    end

    self:SetModel(self.FT.FModel)

    if (self.FT.FFOV ~= nil) then
        self:SetFOV(self.FT.FFOV);
    end

    if (self.FT.FPos ~= nil) then
        self.Entity:SetPos(self.FT.FPos);
    end

    if (self.FT.FAngle ~= nil) then
        self.Entity:SetAngles(self.FT.FAngle);
    end

    if (self.FT.FColor ~= nil) then
        self:SetColor(self.FT.FColor);
    end

    if (self.FT.FCamPos ~= nil) then
        self:SetCamPos(self.FT.FCamPos);
    end

    if (self.FT.FCamAngle ~= nil) then
        self:SetLookAng(self.FT.FCamAngle);
    end

    if (self.FT.FEyePos ~= nil) then
        self.Entity:SetEyeTarget(self.FT.FEyePos);
    end

    self:SetCursor("none");

    if (self.FT.FLock == "x") then
        function self:FirstPersonControls();
    
            local x, y = self:CaptureMouse();
        
            local scale = self:GetFOV() / 180;
            
            x = x * -0.5 * scale;
            y = y * 0.5 * scale;
        
            if (self.MouseKey == MOUSE_LEFT) then
                self.aLookAngle = self.aLookAngle + Angle(self:GetLookAng().p, x * 2, self:GetLookAng().r);
                self.vCamPos = self.Entity:OBBCenter() - self.aLookAngle:Forward() * self.vCamPos:Length();
                return
            end
        end
    end
    
    if ( self.FT.FLock == "y" ) then
        function self:FirstPersonControls();
    
            local x, y = self:CaptureMouse();
        
            local scale = self:GetFOV() / 180;
            
            x = x * -0.5 * scale;
            y = y * 0.5 * scale;
        
            if ( self.MouseKey == MOUSE_LEFT ) then
                self.aLookAngle = self.aLookAngle + Angle(y * 2, self:GetLookAng().y, self:GetLookAng().r);
                self.vCamPos = self.Entity:OBBCenter() - self.aLookAngle:Forward() * self.vCamPos:Length();
                return
            end
        end
    end
    /* */

end

derma.DefineControl(Ferma.AddonNameSpace .. ".FAdjustableModelPanel", "Better DAdjustableModelPanel", FAdjustableModelPanel, "DAdjustableModelPanel");