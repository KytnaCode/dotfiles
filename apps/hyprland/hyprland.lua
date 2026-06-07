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
  hl.exec_cmd('mpvpaper -vs -o "no-audio loop" ALL "$HOME/Videos/Wallpaper.mp4"')
end)

hl.bind('SUPER + SHIFT + n', hl.dsp.exec_cmd('swaync-client -t -sw'))

-- Apps
local terminal = 'kitty'
local browser = 'brave'

hl.bind('SUPER + RETURN', hl.dsp.exec_cmd(terminal))
hl.bind('SUPER + b', hl.dsp.exec_cmd(browser))

-- Utils
hl.bind('SUPER + p', hl.dsp.exec_cmd('hyprquickshot -n'))

hl.bind('SUPER + d', hl.dsp.exec_cmd('vicinae toggle'))

hl.layer_rule({
  name = 'vicinae-blur',
  blur = true,
  ignore_alpha = 0,
  match = { namespace = 'vicinae' },
})

-- Windows
hl.bind('SUPER + h', hl.dsp.focus({ direction = 'l' }))
hl.bind('SUPER + j', hl.dsp.focus({ direction = 'd' }))
hl.bind('SUPER + k', hl.dsp.focus({ direction = 'u' }))
hl.bind('SUPER + l', hl.dsp.focus({ direction = 'r' }))

hl.bind('SUPER + SHIFT + h', hl.dsp.window.move({ direction = 'l' }))
hl.bind('SUPER + SHIFT + j', hl.dsp.window.move({ direction = 'd' }))
hl.bind('SUPER + SHIFT + k', hl.dsp.window.move({ direction = 'u' }))
hl.bind('SUPER + SHIFT + l', hl.dsp.window.move({ direction = 'r' }))

local resizeStep = 20

hl.bind('SUPER + ALT + h', hl.dsp.window.resize({ relative = true, x = -resizeStep, y = 0 }), { repeating = true })
hl.bind('SUPER + ALT + j', hl.dsp.window.resize({ relative = true, x = 0, y = -resizeStep }), { repeating = true })
hl.bind('SUPER + ALT + k', hl.dsp.window.resize({ relative = true, x = 0, y = resizeStep }), { repeating = true })
hl.bind('SUPER + ALT + l', hl.dsp.window.resize({ relative = true, x = resizeStep, y = 0 }), { repeating = true })

hl.bind('SUPER + SHIFT + q', hl.dsp.window.close())
hl.bind('SUPER + SHIFT + x', hl.dsp.window.kill())

hl.bind('SUPER + v', hl.dsp.window.float())
hl.bind('SUPER + f', hl.dsp.window.fullscreen({ mode = 'fullscreen' }))
hl.bind('SUPER + z', hl.dsp.window.fullscreen({ mode = 'maximized' }))

hl.bind('SUPER + mouse:273', hl.dsp.window.resize(), { mouse = true })

-- Workspaces

for i = 1, 9, 1 do
  hl.bind('SUPER + ' .. i, hl.dsp.focus({ workspace = i }))
  hl.bind('SUPER + SHIFT + ' .. i, hl.dsp.window.move({ workspace = i, follow = true }))
end
