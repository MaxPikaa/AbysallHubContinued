local Services = setmetatable({}, {
    __index = function(self, Name)
        if Abysall.Environment.cloneref then
            return Abysall.Environment.cloneref(game:GetService(Name))
        else
            return game:GetService(Name)
        end
    end
})

local Bindable = Instance.new("BindableFunction")
Bindable.OnInvoke = function(Response)
    local Success, Result = pcall(function()
        toclipboard("https://dsc.gg/abysallhub")
    end)
    if not Success then
        Services.LocalPlayer:Kick("复制邀请链接失败\nhttps://dsc.gg/abysallhub")
    end
end

Services.StarterGui:SetCore("SendNotification", {
    Title = "Abysall Hub",
    Text = "目前仅支持 DOORS，抱歉 :)",
    Duration = 10,
    Button1 = "复制 Discord 邀请链接",
    Callback = Bindable,
})
