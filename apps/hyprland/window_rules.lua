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
}

local M = {}

for _, rule in ipairs(window_rules) do
  hl.window_rule(rule)
end
