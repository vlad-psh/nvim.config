require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'auto',
    globalstatus = false,
    component_separators = { left = '⟩', right = '⟨' },
  },
  extensions = {'fugitive', 'quickfix'},
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
      {
        'filename',
        file_status = true,
        newfile_status = false,
        -- 0: Just the filename
        -- 1: Relative path
        -- 2: Absolute path
        -- 3: Absolute path, with tilde as the home directory
        -- 4: Filename and parent dir, with tilde as the home directory
        path = 1,
        -- Shortens path to leave 40 spaces in the window
        -- for other components. (terrible name, any suggestions?)
        shorting_target = 40,
        symbols = {
          modified = '[+]',
          readonly = '[RO]',
          unnamed = '[No Name]',
          newfile = '[NEW]',
        }
      },
    },
    lualine_c = {},
    lualine_x = {'filetype', 'diagnostics'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  tabline = {
    lualine_a = {},
    lualine_b = {
      {
        'tabs',
        mode = 2,
      }
    },
    lualine_c = {},
    lualine_x = {'diff'},
    lualine_y = {'branch'},
    lualine_z = {}
  },
}
