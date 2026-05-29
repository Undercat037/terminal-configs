local M = {}

function M.setup()
  require("base16-colorscheme").setup({
    base00 = "#0b151a",
    base01 = "#172127",
    base02 = "#222b31",
    base03 = "#8093a0",
    base04 = "#b5c9d7",
    base05 = "#dae4ec",
    base06 = "#dae4ec",
    base07 = "#dae4ec",
    base08 = "#ffb4ab",
    base09 = "#8fcef3",
    base0A = "#82d5c7",
    base0B = "#54dbc8",
    base0C = "#8fcef3",
    base0D = "#54dbc8",
    base0E = "#82d5c7",
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
