--- === sleep_event ===
--- 接口文档: https://www.hammerspoon.org/docs/hs.caffeinate.watcher.html
---
local obj={}
obj.__index = obj

-- 
obj.name = "sleep_event"
obj.version = "1.0"
obj.author = "all4fun <wujiwh@gmail.com>"
obj.homepage = "https://github.com/Hammerspoon/Spoons"
obj.license = "MIT - https://opensource.org/licenses/MIT"

function obj:init()
    local function systemSleepCallBack(event)   
        local getTime = os.date("%Y-%m-%d %H:%M:%S");
        -- print("system sleep state changed, action: "..event)
        if (event==hs.caffeinate.watcher.systemWillSleep) then
            print("system will sleep at  "..getTime)
            hs.wifi.setPower(false)
            -- -- turn off the bluetooth
            -- os.execute('/usr/local/bin/blueutil --power 0')
            print("turn off wifi and bluetooth...")
        end

        if (event==hs.caffeinate.watcher.systemDidWake) then
            print("system wake up at  "..getTime)
            hs.wifi.setPower(true)
            -- -- turn on the bluetooth
            -- os.execute('/usr/local/bin/blueutil --power 1')
            print("turn on wifi and bluetooth...")
        end
    end

    sleep_event = hs.caffeinate.watcher.new(systemSleepCallBack)
    sleep_event:start()
end

return obj
