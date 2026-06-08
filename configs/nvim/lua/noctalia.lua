local M = {}

function M.setup()
  require("base16-colorscheme").setup({
    base00 = "#1e100c",
    base01 = "#2b1c18",
    base02 = "#372621",
    base03 = "#ae887e",
    base04 = "#e7bdb2",
    base05 = "#f9dcd5",
    base06 = "#f9dcd5",
    base07 = "#f9dcd5",
    base08 = "#ffb4ab",
    base09 = "#ffb5a0",
    base0A = "#f9b1dc",
    base0B = "#ffaedf",
    base0C = "#ffb5a0",
    base0D = "#ffaedf",
    base0E = "#f9b1dc",
    base0F = "#93000a",
  })

  local groups = {
    "Normal",
    "NormalNC",
    "NormalFloat",
    "SignColumn",
    "LineNr",
    "CursorLineNr",
    "EndOfBuffer",
    "FoldColumn",
    "StatusLine",
    "StatusLineNC",
    "WinBar",
    "WinBarNC",
  }
  for _, group in ipairs(groups) do
    vim.api.nvim_set_hl(0, group, { bg = "NONE", ctermbg = "NONE" })
  end
end

local signal = vim.uv.new_signal()
signal:start(
  "sigusr1",
  vim.schedule_wrap(function()
    package.loaded["noctalia"] = nil
    require("noctalia").setup()
  end)
)

return M
