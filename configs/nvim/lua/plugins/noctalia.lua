return {
  {
    "RRethy/base16-nvim",
    lazy = false,
    priority = 1000,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        local ok, matugen = pcall(require, "noctalia")
        if ok then
          matugen.setup()
        else
          vim.cmd.colorscheme("default")
        end
      end,
    },
  },
}
