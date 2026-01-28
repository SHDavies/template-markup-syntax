# template-markup-syntax

Neovim syntax highlighting for Template Markup Language (TML).

## Features

- Syntax highlighting for TML constructs:
  - Tags: `{insert: value}`, `{if: condition}...{:if}`, `{each: items as=item}...{:each}`
  - References with dot notation: `object.attribute`
  - Refinements: `.long_format`, `.plural?`, `.dollars`
  - Escape sequences: `\{`, `\}`
- Configurable file detection patterns
- Semantic highlighting (conditionals, loops, keywords)

## Installation

### lazy.nvim

```lua
{ "SHDavies/template-markup-syntax" }
```

### packer.nvim

```lua
use "SHDavies/template-markup-syntax"
```

## Configuration

```lua
require("template-markup-syntax").setup({
  -- Glob patterns for files to treat as TML
  patterns = { "**/templates/**/*.txt" },  -- default
})
```

### Examples

Detect `.tml` files in a different directory:
```lua
require("template-markup-syntax").setup({
  patterns = { "**/emails/**/*.tml" },
})
```

Multiple patterns:
```lua
require("template-markup-syntax").setup({
  patterns = {
    "**/templates/**/*.txt",
    "**/emails/**/*.tml",
  },
})
```

## TML Syntax Reference

| Construct | Example |
|-----------|---------|
| Insert | `{insert: variable_name}` |
| Conditional | `{if: condition}...{else:}...{:if}` |
| Loop | `{each: items as=item}...{:each}` |
| Delimited list | `{delimited-list: comma-and}A{delimiter}B{:delimited-list}` |
| Render | `{render: object}` |
| Escape | `\{literal braces\}` |

## Health Check

Run `:checkhealth template-markup-syntax` to verify installation.

## License

MIT
