local M = {}

function M.setup()
  require("base16-colorscheme").setup({
    base00 = "#131313",
    base01 = "#1f1f1f",
    base02 = "#2a2a2a",
    base03 = "#919191",
    base04 = "#c6c6c6",
    base05 = "#e2e2e2",
    base06 = "#e2e2e2",
    base07 = "#e2e2e2",
    base08 = "#ffb4ab",
    base09 = "#d8c58d",
    base0A = "#e7bdb2",
    base0B = "#ffb5a0",
    base0C = "#d8c58d",
    base0D = "#ffb5a0",
    base0E = "#e7bdb2",
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
