-- Monitors

hl.monitor({
  output = 'HDMI-A-1',
  mode = '1920x1080@60',
  position = '0x-1080',
  scale = 1,
})

hl.monitor({
  output = 'DVI-D-1',
  mode = '1920x1080@60',
  position = '0x0',
  scale = 1,
})

-- Keyboard
hl.config({
  input = {
    kb_layout = 'us,latam',
  },
})

hl.bind('SUPER + SPACE', hl.dsp.exec_cmd('hyprctl switchxkblayout current next'))

-- Notifications
hl.on('hyprland.start', function()
  hl.exec_cmd('swaync')
end)

hl.bind('SUPER + SHIFT + n', hl.dsp.exec_cmd('swaync-client -t -sw'))

-- Apps
local terminal = 'kitty'
local browser = 'brave'

hl.bind('SUPER + RETURN', hl.dsp.exec_cmd(terminal))
hl.bind('SUPER + b', hl.dsp.exec_cmd(browser))

-- Windows
hl.bind('SUPER + h', hl.dsp.focus({ direction = 'l' }))
hl.bind('SUPER + j', hl.dsp.focus({ direction = 'd' }))
hl.bind('SUPER + k', hl.dsp.focus({ direction = 'u' }))
hl.bind('SUPER + l', hl.dsp.focus({ direction = 'r' }))

hl.bind('SUPER + SHIFT + h', hl.dsp.window.move({ direction = 'l' }))
hl.bind('SUPER + SHIFT + j', hl.dsp.window.move({ direction = 'd' }))
hl.bind('SUPER + SHIFT + k', hl.dsp.window.move({ direction = 'u' }))
hl.bind('SUPER + SHIFT + l', hl.dsp.window.move({ direction = 'r' }))

hl.bind('SUPER + SHIFT + q', hl.dsp.window.close())
hl.bind('SUPER + SHIFT + x', hl.dsp.window.kill())

hl.bind('SUPER + v', hl.dsp.window.float())
hl.bind('SUPER + f', hl.dsp.window.fullscreen({ mode = 'fullscreen' }))
hl.bind('SUPER + z', hl.dsp.window.fullscreen({ mode = 'maximized' }))

-- Workspaces

for i = 1, 9, 1 do
  hl.bind('SUPER + ' .. i, hl.dsp.focus({ workspace = i }))
  hl.bind('SUPER + SHIFT + ' .. i, hl.dsp.window.move({ workspace = i, follow = true }))
end
