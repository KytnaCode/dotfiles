local apps = require('apps')

local autostart_applications = {
  notification_daemon = {
    cmd = apps.notification_daemon,
  },
  wallpaper = {
    cmd = apps.wallpaper_daemon,
  },
  terminal = {
    cmd = apps.terminal,
    rules = {
      workspace = 1,
    },
  },
  browser = {
    cmd = apps.browser,
    rules = {
      workspace = 2,
    },
  },
  note_taking = {
    cmd = apps.note_taking_app,
    rules = {
      workspace = 4,
    },
  },
  flashcards = {
    cmd = apps.flashcards_app,
    rules = {
      workspace = 5,
    },
  },
  -- ibus = {
  --   cmd = 'ibus start --type wayland',
  -- },
}

hl.on('hyprland.start', function()
  for _, app in pairs(autostart_applications) do
    hl.dispatch(hl.dsp.exec_cmd(app.cmd, app.rules))
  end
end)
