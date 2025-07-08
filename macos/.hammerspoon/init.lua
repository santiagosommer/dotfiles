-- Example notification --
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
  hs.notify.new({title="Hammerspoon", informativeText="Hello World"}):send()
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "H", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  
  f.x = f.x - 10
  win:setFrame(f)
end)
-- END --

-- Auto-reload configuration when changing this file --
function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")

-- Scroll when doing a pop/ssss/tsch sound with lips --
myNoise = hs.noises.new(function(event)
    local horizontalScrollAmount = 15
    hs.eventtap.scrollWheel({0, -horizontalScrollAmount}, {}, "line")
  end)

local isListening = false

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "L", function()
  if isListening then
    myNoise:stop()
    hs.alert.show("Detector de ruido OFF")
    isListening = false
  else
    myNoise:start()
    hs.alert.show("Detector de ruido ON")
    isListening = true
  end
end)
-- END --

