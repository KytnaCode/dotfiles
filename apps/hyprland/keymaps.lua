local apps = require('apps')

hl.bind('SUPER + SHIFT + n', hl.dsp.exec_cmd('swaync-client -t -sw'))

hl.bind('SUPER + RETURN', hl.dsp.exec_cmd(apps.terminal))
hl.bind('SUPER + b', hl.dsp.exec_cmd(apps.browser))

-- Utils
hl.bind('SUPER + p', hl.dsp.exec_cmd('hyprquickshot -n'))

hl.bind('SUPER + d', hl.dsp.exec_cmd('vicinae toggle'))

-- Windows
hl.bind('SUPER + h', hl.dsp.focus({ direction = 'l' }))
hl.bind('SUPER + j', hl.dsp.focus({ direction = 'd' }))
hl.bind('SUPER + k', hl.dsp.focus({ direction = 'u' }))
hl.bind('SUPER + l', hl.dsp.focus({ direction = 'r' }))

local step_size = 50

local function move(direction)
  return function()
    local win = hl.get_active_window()

    if win ~= nil and win.floating then
      if direction == 'l' then
        hl.dispatch(hl.dsp.window.move({ x = -step_size, y = 0, relative = true }))
      elseif direction == 'd' then
        hl.dispatch(hl.dsp.window.move({ x = 0, y = step_size, relative = true }))
      elseif direction == 'u' then
        hl.dispatch(hl.dsp.window.move({ x = 0, y = -step_size, relative = true }))
      elseif direction == 'r' then
        hl.dispatch(hl.dsp.window.move({ x = step_size, y = 0, relative = true }))
      else
        error('unknown direction: ' .. direction)
      end

      return
    end

    hl.dispatch(hl.dsp.window.move({ direction = direction }))
  end
end

hl.bind('SUPER + SHIFT + h', move('l'), { repeating = true })
hl.bind('SUPER + SHIFT + j', move('d'), { repeating = true })
hl.bind('SUPER + SHIFT + k', move('u'), { repeating = true })
hl.bind('SUPER + SHIFT + l', move('r'), { repeating = true })

hl.bind('SUPER + C', hl.dsp.window.center())

hl.bind('SUPER + mouse:272', hl.dsp.window.drag(), { mouse = true })
hl.bind('SUPER + mouse:273', hl.dsp.window.resize(), { mouse = true })

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

-- Workspaces

for i = 1, 9, 1 do
  hl.bind('SUPER + ' .. i, hl.dsp.focus({ workspace = i }))
  hl.bind('SUPER + SHIFT + ' .. i, hl.dsp.window.move({ workspace = i, follow = true }))
  hl.workspace_rule({
    workspace = tostring(i),
    persistent = true,
  })
end
