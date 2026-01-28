local M = {}

function M.check()
  vim.health.start("template-markup-syntax")

  -- Check if syntax file is loadable
  local syntax_path = vim.api.nvim_get_runtime_file("syntax/tml.vim", false)
  if #syntax_path > 0 then
    vim.health.ok("Syntax file found: " .. syntax_path[1])
  else
    vim.health.error("Syntax file not found")
  end

  -- Check configuration
  local config = require("template-markup-syntax").config
  vim.health.ok("Detection patterns: " .. table.concat(config.patterns, ", "))
end

return M
