return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      theme = 'hyper',
      shortcut_type = 'numbers',
      config = {
        week_header = {
          enable = true
        },
        shortcut = {
          { desc = '󰚰 Update', group = '@property', action = 'Lazy update', key = 'u' },
          { desc = ' Search', group = '@property', action = 'Telescope find_files', key = 'f'},
        }
      }
    }
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
}
