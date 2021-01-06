hs.window.animationDuration = 0

myDoKeyStroke = function(modifiers, character)
    local event = require("hs.eventtap").event
    event.newKeyEvent(modifiers, string.lower(character), true):post()
    event.newKeyEvent(modifiers, string.lower(character), false):post()
end

hs.hotkey.bind({"ctrl"}, "j", function()
  myDoKeyStroke({""}, "down")
end, nil, function ()
  myDoKeyStroke({""}, "down")
end)

hs.hotkey.bind({"ctrl"}, "h", function()
  myDoKeyStroke({""}, "left")
end, nil, function ()
  myDoKeyStroke({""}, "left")
end)

hs.hotkey.bind({"ctrl"}, "k", function()
  myDoKeyStroke({""}, "up")
end, nil, function ()
  myDoKeyStroke({""}, "up")
end)

hs.hotkey.bind({"ctrl"}, "l", function()
  myDoKeyStroke({""}, "right")
end, nil, function ()
  myDoKeyStroke({""}, "right")
end)

hs.hotkey.bind({"cmd", "alt"}, "f", function()
  local win = hs.window.focusedWindow()
  local screen = win:screen()
  local max = screen:frame()

  win:setFrame(max)
end)

local l = 2
local r = 2
local u = 2
local d = 2
local XY = {{x=1/3, y=2/3}, {x=1/2, y=1/2}, {x=2/3, y=1/3}}

resizeLeft = function()
  r = 2
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w * XY[l].x
  f.h = max.h
  win:setFrame(f)
  if l < 3 then
    l = l + 1
   else
    l = 1
  end
end

resizeRight = function()
  l = 2
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w * XY[r].y)
  f.y = max.y
  f.w = max.w * XY[r].x
  f.h = max.h
  win:setFrame(f)
  if r < 3 then
    r = r + 1
   else
    r = 1
  end
end

resizeUp = function()
  d = 2
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h * XY[u].x
  win:setFrame(f)
  if u < 3 then
    u = u + 1
   else
    u = 1
  end
end

resizeDown = function()
  u = 2
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y + (max.h * XY[d].y)
  f.w = max.w
  f.h = max.h * XY[d].x
  win:setFrame(f)
  if d < 3 then
    d = d + 1
   else
    d = 1
  end
end

hs.hotkey.bind({"cmd", "alt"}, "h", resizeLeft)
hs.hotkey.bind({"cmd", "alt"}, "left", resizeLeft)

hs.hotkey.bind({"cmd", "alt"}, "l", resizeRight)
hs.hotkey.bind({"cmd", "alt"}, "right", resizeRight)

hs.hotkey.bind({"cmd", "alt"}, "k", resizeUp)
hs.hotkey.bind({"cmd", "alt"}, "up", resizeUp)

hs.hotkey.bind({"cmd", "alt"}, "j", resizeDown)
hs.hotkey.bind({"cmd", "alt"}, "down", resizeDown)

hs.urlevent.httpCallback = function(scheme, host, params, fullURL)
  hs.alert.show("clicked " .. fullURL)
end