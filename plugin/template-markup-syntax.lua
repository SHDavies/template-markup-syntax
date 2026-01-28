if vim.g.loaded_template_markup_syntax then
  return
end
vim.g.loaded_template_markup_syntax = true

-- Set up with default patterns on load
require("template-markup-syntax.ftdetect").setup(
  require("template-markup-syntax").config.patterns
)
