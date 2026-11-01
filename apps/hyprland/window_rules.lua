local window_rules = {
  -- Anki
  {
    name = 'Anki Add',
    match = {
      initial_class = '^anki$',
      initial_title = '^Add$',
    },
    center = true,
    float = true,
    size = '700 600',
  },
  {
    name = 'Anki Browse',
    match = {
      initial_class = '^anki$',
      initial_title = '^Anki$',
    },
    center = true,
    float = true,
    size = '740 680',
  },
  {
    name = 'Anki Preferences',
    match = {
      initial_class = '^anki$',
      initial_title = '^Preferences$',
    },
    size = '750 650',
    center = true,
  },
  {
    name = 'Anki Statistics',
    match = {
      initial_class = '^anki$',
      initial_title = '^Statistics$',
    },
    center = true,
    float = true,
    size = '720 580',
  },
  {
    name = 'Anki Addons',
    match = {
      initial_class = '^anki$',
      initial_title = '^Add-ons$',
    },
    center = true,
    float = true,
    size = '750 650',
  },

  -- Obsidian
  {
    name = 'Obsidian Settings',
    match = {
      initial_class = '^md.obsidian.Obsidian$',
      initial_title = '^Settings - .*$',
    },
    center = true,
    float = true,
    size = '750 650',
  },
  {
    name = 'Obsidian Community Plugins',
    match = {
      initial_class = '^md.obsidian.Obsidian$',
      initial_title = '^Community plugins - .*$',
    },
    center = true,
    float = true,
    size = '850 700',
  },

  -- File chooser
  {
    name = 'File chooser',
    match = {
      initial_class = '^kitty$',
      initial_title = '^File Chooser$',
    },
    center = true,
    float = true,
    size = '1000 600',
  },
}

for _, rule in ipairs(window_rules) do
  hl.window_rule(rule)
end
