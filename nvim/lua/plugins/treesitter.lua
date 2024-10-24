  return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function() 
    local config = require("nvim-treesitter.configs")
    config.setup({
    ensuse_installed = {"lua", "go", "rust", "python", "c", "javascript", "css"},
    auto_install = true,
    highlight = {enable = true},
    indent = {enable = true},
    })
    end
  }

