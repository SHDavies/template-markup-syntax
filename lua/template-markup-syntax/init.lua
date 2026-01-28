local M = {}

M.config = {
  patterns = { "**/templates/**/*.txt" },
}

function M.setup(opts)
  opts = opts or {}
  M.config = vim.tbl_deep_extend("force", M.config, opts)

  -- Re-register filetype detection with new patterns
  require("template-markup-syntax.ftdetect").setup(M.config.patterns)
end

return M
