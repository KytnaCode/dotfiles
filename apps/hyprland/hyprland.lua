-- Load modules.
require('window_rules').setup_window_rules()

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

hl.config({
  xwayland = {
    force_zero_scaling = true,
  },
})

hl.layer_rule({
  name = 'vicinae-blur',
  blur = true,
  ignore_alpha = 0,
  match = { namespace = 'vicinae' },
})
