--- === wifi_recoder ===
---
local obj={}
obj.__index = obj

-- 
obj.name = "wifi_recoder"
obj.version = "1.0"
obj.author = "all4fun <wujiwh@gmail.com>"
obj.homepage = "https://github.com/Hammerspoon/Spoons"
obj.license = "MIT - https://opensource.org/licenses/MIT"

function obj:init()
    local function ssidChangedCallback()
        ssid = hs.wifi.currentNetwork()
        if (ssid ~= nil) then
            print("wifi linked to ssid = "..(ssid))
        end
    end
    wifi_recoder = hs.wifi.watcher.new(ssidChangedCallback)
    wifi_recoder:start()
end

return obj
