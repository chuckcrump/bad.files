vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.g.mapleader = "  "
vim.opt.termguicolors = true

vim.diagnostic.config({
  virtual_text = {
    prefix = ";(", -- or ">>" or anything fun, makes the error pop
    spacing = 2,
  },
  signs = true,
  underline = true,
  update_in_insert = false, -- optional: don't show errors while typing
  severity_sort = true, -- optional: sort by error severity
})


vim.o.guifont = "JetBrainsMono Nerd Font:h14"
vim.opt.linespace = 15
vim.g.neovide_cursor_trail_size = 0.5
vim.g.neovide_scale_factor = 0.9

